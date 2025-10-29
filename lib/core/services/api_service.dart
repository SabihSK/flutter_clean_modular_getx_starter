import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../constants/app_config.dart';
import 'storage_service.dart';
import '../utils/helpers.dart';

class ApiService {
  late final Dio _dio;

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
          // Attach token if exists
          final token = await StorageService().readToken();
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

          // Handle global errors
          Helpers.handleApiError(e);

          return handler.next(e);
        },
      ),
    );
  }

  Dio get client => _dio;

  // ✅ Example GET method
  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    return await _dio.get(endpoint, queryParameters: params);
  }

  // ✅ Example POST method
  Future<Response> post(String endpoint, dynamic data) async {
    return await _dio.post(endpoint, data: data);
  }
}
