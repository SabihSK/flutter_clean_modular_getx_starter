import 'package:dio/dio.dart';
import '../models/base_response.dart';
import '../models/user_model.dart';
import '../providers/api_provider.dart';
import 'base_repository.dart';

class AuthRepository extends BaseRepository {
  final ApiProvider _apiProvider = ApiProvider();

  /// Example Login
  Future<BaseResponse<UserModel>?> login(String email, String password) async {
    return await safeApiCall(() async {
      final Response response = await _apiProvider.post('/login', {
        'email': email,
        'password': password,
      });

      return BaseResponse<UserModel>.fromJson(
        response.data,
        (data) => UserModel.fromJson(data),
      );
    });
  }

  /// Example Register
  Future<BaseResponse<UserModel>?> register(
    String name,
    String email,
    String password,
  ) async {
    return await safeApiCall(() async {
      final Response response = await _apiProvider.post('/register', {
        'name': name,
        'email': email,
        'password': password,
      });

      return BaseResponse<UserModel>.fromJson(
        response.data,
        (data) => UserModel.fromJson(data),
      );
    });
  }
}
