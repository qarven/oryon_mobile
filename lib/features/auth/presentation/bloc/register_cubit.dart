import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oryon_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:oryon_mobile/features/auth/presentation/bloc/auth_state.dart';

class RegisterCubit extends Cubit<AuthState> {
  RegisterCubit(this._repository) : super(const AuthState());

  final AuthRepository _repository;

  Future<void> register({
    required String name,
    required String identifier,
    required String password,
    required bool viaPhone,
  }) async {
    emit(const AuthState(status: AuthStatus.loading));
    try {
      final flowId = await _repository.register(
        name: name,
        identifier: identifier,
        password: password,
        viaPhone: viaPhone,
      );
      emit(AuthState(status: AuthStatus.success, flowId: flowId));
    } catch (error) {
      emit(AuthState(status: AuthStatus.failure, error: error));
    }
  }
}
