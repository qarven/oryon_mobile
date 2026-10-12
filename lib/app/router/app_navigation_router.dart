import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/features/auth/module.dart';
import 'package:oryon_mobile/features/home/module.dart';

extension AppNavigationX on GoRouter {
  void goToHome() => goNamed(HomeModule.rootName);

  void goToLogin() => goNamed(AuthModule.loginName);
  void goToRegister() => goNamed(AuthModule.registerName);
  void goToForgotPassword(String identifier) =>
      goNamed(AuthModule.forgotName, extra: identifier);
  void goToVerifyRegister(VerifyRegisterArgs args) =>
      goNamed(AuthModule.verifyName, extra: args);
}
