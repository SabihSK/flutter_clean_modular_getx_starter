import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:slide_scout/core/services/auth_service.dart';
import 'package:slide_scout/presentation/auth/login/login_controller.dart';
import 'login_controller_test.mocks.dart';

@GenerateMocks([AuthService])
void main() {
  late MockAuthService mockAuthService;
  late LoginController controller;

  setUp(() {
    mockAuthService = MockAuthService();
    Get.put<AuthService>(mockAuthService);
    controller = LoginController();
  });

  tearDown(() {
    Get.reset();
  });

  test('Login form should be invalid if empty', () {
    expect(controller.formKey.currentState?.validate(), isNull);
  });

  test('Login success should navigate to Home', () async {
    when(mockAuthService.login(any, any)).thenAnswer((_) async => true);
    controller.emailController.text = 'sabih@yammtech.com';
    controller.passwordController.text = '123456';
    await controller.login();
    verify(mockAuthService.login(any, any)).called(1);
  });

  test('Login failure shows error', () async {
    when(mockAuthService.login(any, any)).thenAnswer((_) async => false);
    controller.emailController.text = 'invalid@x.com';
    controller.passwordController.text = 'wrong';
    await controller.login();
    verify(mockAuthService.login(any, any)).called(1);
  });
}
