import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oryon_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:oryon_mobile/features/auth/presentation/bloc/auth_state.dart';

class LoginCubit extends Cubit<AuthState> {
  LoginCubit(this._repository) : super(const AuthState());

  final AuthRepository _repository;

  Future<void> login({
    required String identifier,
    required String password,
  }) async {
    emit(const AuthState(status: AuthStatus.loading));
    try {
      await _repository.login(identifier: identifier, password: password);
      emit(const AuthState(status: AuthStatus.success));
    } catch (error) {
      emit(AuthState(status: AuthStatus.failure, error: error));
    }
  }
}
