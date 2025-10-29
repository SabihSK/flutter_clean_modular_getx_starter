import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:slide_scout/core/services/api_service.dart';
import 'package:slide_scout/core/services/auth_service.dart';
import 'package:slide_scout/core/services/storage_service.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([ApiService, StorageService])
void main() {
  late MockApiService mockApi;
  late MockStorageService mockStorage;
  late AuthService authService;

  setUp(() {
    mockApi = MockApiService();
    mockStorage = MockStorageService();
    Get.put<MockApiService>(mockApi);
    Get.put<MockStorageService>(mockStorage);
    authService = AuthService();
  });

  tearDown(() {
    Get.reset();
  });

  test('Should start logged out', () {
    expect(authService.isLoggedIn, false);
  });

  test('Should save and read token correctly', () async {
    when(mockStorage.readToken()).thenAnswer((_) async => 'token');
    await mockStorage.saveToken('token');
    final token = await mockStorage.readToken();
    expect(token, equals('token'));
  });
}
