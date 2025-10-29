import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'auth_repository_test.mocks.dart';
import '../../../lib/data/repositories/auth_repository.dart';
import '../../../lib/data/providers/api_provider.dart';

@GenerateMocks([ApiProvider])
void main() {
  late MockApiProvider mockApi;
  late AuthRepository repository;

  setUp(() {
    mockApi = MockApiProvider();
    repository = AuthRepository();
  });

  test('Login returns BaseResponse<UserModel>', () async {
    final fakeResponse = Response(
      data: {
        "success": true,
        "message": "OK",
        "data": {"id": 1, "name": "Sabih", "email": "sabih@yammtech.com"},
      },
      statusCode: 200,
      requestOptions: RequestOptions(path: '/login'),
    );

    when(mockApi.post(any, any)).thenAnswer((_) async => fakeResponse);

    final result = await repository.login('sabih@yammtech.com', '123456');
    expect(result?.success, true);
    expect(result?.data?.email, contains('sabih'));
  });
}
