import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oryon_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:oryon_mobile/features/auth/presentation/bloc/auth_state.dart';

class ForgotPasswordCubit extends Cubit<AuthState> {
  ForgotPasswordCubit(this._repository) : super(const AuthState());

  final AuthRepository _repository;

  Future<void> requestReset(String identifier) async {
    emit(const AuthState(status: AuthStatus.loading));
    try {
      await _repository.requestPasswordReset(identifier);
      emit(const AuthState(status: AuthStatus.success));
    } catch (error) {
      emit(AuthState(status: AuthStatus.failure, error: error));
    }
  }
}
