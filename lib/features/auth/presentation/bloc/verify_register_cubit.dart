import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oryon_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:oryon_mobile/features/auth/presentation/bloc/auth_state.dart';

class VerifyRegisterCubit extends Cubit<AuthState> {
  VerifyRegisterCubit(this._repository) : super(const AuthState());

  final AuthRepository _repository;

  Future<void> verify({
    required String flowId,
    required String code,
    required bool viaPhone,
  }) async {
    emit(const AuthState(status: AuthStatus.loading));
    try {
      await _repository.verifyRegistration(
        flowId: flowId,
        code: code,
        viaPhone: viaPhone,
      );
      emit(const AuthState(status: AuthStatus.success));
    } catch (error) {
      emit(AuthState(status: AuthStatus.failure, error: error));
    }
  }
}
