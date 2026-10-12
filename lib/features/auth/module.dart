import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/core/network/api_client.dart';
import 'package:oryon_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:oryon_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:oryon_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:oryon_mobile/features/auth/presentation/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:oryon_mobile/features/auth/presentation/forgot_password/forgot_password_view.dart';
import 'package:oryon_mobile/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:oryon_mobile/features/auth/presentation/login/login_view.dart';
import 'package:oryon_mobile/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:oryon_mobile/features/auth/presentation/register/register_view.dart';
import 'package:oryon_mobile/features/auth/presentation/verify_register/bloc/verify_register_bloc.dart';
import 'package:oryon_mobile/features/auth/presentation/verify_register/verify_register_view.dart';
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
      ..registerFactory<LoginBloc>(
        () => LoginBloc(GetIt.instance<AuthRepository>()),
      )
      ..registerFactory<RegisterBloc>(
        () => RegisterBloc(GetIt.instance<AuthRepository>()),
      )
      ..registerFactory<VerifyRegisterBloc>(
        () => VerifyRegisterBloc(GetIt.instance<AuthRepository>()),
      )
      ..registerFactory<ForgotPasswordBloc>(
        () => ForgotPasswordBloc(GetIt.instance<AuthRepository>()),
      );
  }

  @override
  List<RouteBase> get routes => [
    GoRoute(
      name: loginName,
      path: loginPath,
      builder: (_, _) => BlocProvider(
        create: (_) => GetIt.instance<LoginBloc>(),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      name: registerName,
      path: registerPath,
      builder: (_, _) => BlocProvider(
        create: (_) => GetIt.instance<RegisterBloc>(),
        child: const RegisterView(),
      ),
    ),
    GoRoute(
      name: verifyName,
      path: verifyPath,
      builder: (_, state) => BlocProvider(
        create: (_) => GetIt.instance<VerifyRegisterBloc>(),
        child: VerifyRegisterView(args: state.extra! as VerifyRegisterArgs),
      ),
    ),
    GoRoute(
      name: forgotName,
      path: forgotPath,
      builder: (_, state) => BlocProvider(
        create: (_) => GetIt.instance<ForgotPasswordBloc>(),
        child: ForgotPasswordView(
          initialIdentifier: state.extra as String?,
        ),
      ),
    ),
  ];
}
