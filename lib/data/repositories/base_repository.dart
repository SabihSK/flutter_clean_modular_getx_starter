import 'package:dio/dio.dart';
import '../../core/utils/helpers.dart';

abstract class BaseRepository {
  Future<T?> safeApiCall<T>(Future<T> Function() apiCall) async {
    try {
      return await apiCall();
    } on DioException catch (e) {
      Helpers.handleApiError(e);
      return null;
    } catch (e) {
      Helpers.showSnackBar('Unexpected error: $e', isError: true);
      return null;
    }
  }
}
