import 'package:dio/dio.dart';
import '../../core/services/api_service.dart';

class ApiProvider {
  final ApiService _apiService = ApiService();

  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    return await _apiService.get(endpoint, params: params);
  }

  Future<Response> post(String endpoint, dynamic data) async {
    return await _apiService.post(endpoint, data);
  }
}
