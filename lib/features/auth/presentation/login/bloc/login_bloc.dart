import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oryon_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:oryon_mobile/features/auth/presentation/login/bloc/login_event.dart';
import 'package:oryon_mobile/features/auth/presentation/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._repository) : super(const LoginState()) {
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthRepository _repository;

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState(status: LoginStatus.loading));
    try {
      await _repository.login(
        identifier: event.identifier,
        password: event.password,
      );
      emit(const LoginState(status: LoginStatus.success));
    } catch (error) {
      emit(LoginState(status: LoginStatus.failure, error: error));
    }
  }
}
