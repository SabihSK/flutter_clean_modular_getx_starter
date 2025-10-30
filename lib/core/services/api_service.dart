import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../constants/app_config.dart';
import 'storage_service.dart';
import 'network_service.dart';
import '../utils/helpers.dart';

class ApiService {
  late final Dio _dio;
  final _maxRetries = 3; // ✅ Retry limit

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['API_BASE_URL'] ?? '',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        headers: {'Content-Type': 'application/json'},
      ),
    );
    _initializeInterceptors();
  }

  void _initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // ✅ Network check before request
          final networkService = Get.find<NetworkService>();
          if (!networkService.isConnected) {
            final error = DioException(
              requestOptions: options,
              error: 'No Internet Connection',
              type: DioExceptionType.unknown,
            );
            return handler.reject(error);
          }

          // ✅ Attach token if exists
          final token = await StorageService().getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          if (AppConfig.enableLogging) {
            log('➡️ REQUEST[${options.method}] => PATH: ${options.path}');
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (AppConfig.enableLogging) {
            log('✅ RESPONSE[${response.statusCode}] => DATA: ${response.data}');
          }
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          if (AppConfig.enableLogging) {
            log('❌ ERROR[${e.response?.statusCode}] => ${e.message}');
          }

          Helpers.handleApiError(e);
          return handler.next(e);
        },
      ),
    );
  }

  Dio get client => _dio;

  // 🔁 Generic retry wrapper
  Future<Response> _retryRequest(
    Future<Response> Function() requestFn, {
    int retries = 0,
  }) async {
    try {
      return await requestFn();
    } on DioException catch (e) {
      // ✅ Retry only for network/server errors
      final retriable = e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout;

      if (retriable && retries < _maxRetries) {
        final delay = Duration(seconds: 2 * (retries + 1));
        if (AppConfig.enableLogging) {
          log('🔁 Retrying request... Attempt ${retries + 1}/$_maxRetries after ${delay.inSeconds}s');
        }
        await Future.delayed(delay);
        return _retryRequest(requestFn, retries: retries + 1);
      }

      rethrow; // Give up after max retries
    }
  }

  // ✅ GET method with network check + retry
  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    return _retryRequest(() async {
      return await _dio.get(endpoint, queryParameters: params);
    });
  }

  // ✅ POST method with network check + retry
  Future<Response> post(String endpoint, dynamic data) async {
    return _retryRequest(() async {
      return await _dio.post(endpoint, data: data);
    });
  }

  // ✅ PUT method
  Future<Response> put(String endpoint, dynamic data) async {
    return _retryRequest(() async {
      return await _dio.put(endpoint, data: data);
    });
  }

  // ✅ DELETE method
  Future<Response> delete(String endpoint, {Map<String, dynamic>? params}) async {
    return _retryRequest(() async {
      return await _dio.delete(endpoint, queryParameters: params);
    });
  }
}
