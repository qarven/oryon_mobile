import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/core/network/api_client.dart';
import 'package:oryon_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:oryon_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:oryon_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:oryon_mobile/features/auth/presentation/bloc/forgot_password_cubit.dart';
import 'package:oryon_mobile/features/auth/presentation/bloc/login_cubit.dart';
import 'package:oryon_mobile/features/auth/presentation/bloc/register_cubit.dart';
import 'package:oryon_mobile/features/auth/presentation/bloc/verify_register_cubit.dart';
import 'package:oryon_mobile/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:oryon_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:oryon_mobile/features/auth/presentation/pages/register_page.dart';
import 'package:oryon_mobile/features/auth/presentation/pages/verify_register_page.dart';
import 'package:oryon_mobile/features/auth/services/auth_session.dart';
import 'package:oryon_mobile/shared/base/base_module.dart';
import 'package:sdk_protobuf_gen_dart/oryon/identity/v1/authentication.connect.client.dart';

// What the verification screen needs to finish the registration started on the
// register screen.
typedef VerifyRegisterArgs = ({
  String flowId,
  String identifier,
  bool viaPhone,
});

final class AuthModule implements BaseModule {
  static const loginPath = '/login';
  static const loginName = 'login';
  static const registerPath = '/register';
  static const registerName = 'register';
  static const verifyPath = '/verify-register';
  static const verifyName = 'verify-register';
  static const forgotPath = '/forgot-password';
  static const forgotName = 'forgot-password';

  static bool get isAuthenticated =>
      GetIt.instance<AuthSession>().isAuthenticated;

  static bool isAuthPath(String location) =>
      location == loginPath ||
      location == registerPath ||
      location == verifyPath ||
      location == forgotPath;

  // The session is created here because the transport interceptor reads it, so
  // one instance has to back both the storage and the bearer header.
  @override
  void initialize() {
    final session = AuthSession();
    GetIt.instance
      ..registerSingleton<AuthSession>(session)
      ..registerSingleton<AuthRepository>(
        AuthRepositoryImpl(
          AuthRemoteDataSource(
            AuthenticationServiceClient(createApiTransport(session)),
            session,
          ),
        ),
      )
      ..registerFactory<LoginCubit>(
        () => LoginCubit(GetIt.instance<AuthRepository>()),
      )
      ..registerFactory<RegisterCubit>(
        () => RegisterCubit(GetIt.instance<AuthRepository>()),
      )
      ..registerFactory<VerifyRegisterCubit>(
        () => VerifyRegisterCubit(GetIt.instance<AuthRepository>()),
      )
      ..registerFactory<ForgotPasswordCubit>(
        () => ForgotPasswordCubit(GetIt.instance<AuthRepository>()),
      );
  }

  @override
  List<RouteBase> get routes => [
    GoRoute(
      name: loginName,
      path: loginPath,
      builder: (_, _) => BlocProvider(
        create: (_) => GetIt.instance<LoginCubit>(),
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      name: registerName,
      path: registerPath,
      builder: (_, _) => BlocProvider(
        create: (_) => GetIt.instance<RegisterCubit>(),
        child: const RegisterPage(),
      ),
    ),
    GoRoute(
      name: verifyName,
      path: verifyPath,
      builder: (_, state) => BlocProvider(
        create: (_) => GetIt.instance<VerifyRegisterCubit>(),
        child: VerifyRegisterPage(args: state.extra! as VerifyRegisterArgs),
      ),
    ),
    GoRoute(
      name: forgotName,
      path: forgotPath,
      builder: (_, state) => BlocProvider(
        create: (_) => GetIt.instance<ForgotPasswordCubit>(),
        child: ForgotPasswordPage(initialIdentifier: state.extra as String?),
      ),
    ),
  ];
}
