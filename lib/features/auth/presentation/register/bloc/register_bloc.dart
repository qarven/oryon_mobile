import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oryon_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:oryon_mobile/features/auth/presentation/register/bloc/register_event.dart';
import 'package:oryon_mobile/features/auth/presentation/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this._repository) : super(const RegisterState()) {
    on<RegisterSubmitted>(_onSubmitted);
  }

  final AuthRepository _repository;

  Future<void> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(const RegisterState(status: RegisterStatus.loading));
    try {
      final flowId = await _repository.register(
        name: event.name,
        identifier: event.identifier,
        password: event.password,
        viaPhone: event.viaPhone,
      );
      emit(RegisterState(status: RegisterStatus.success, flowId: flowId));
    } catch (error) {
      emit(RegisterState(status: RegisterStatus.failure, error: error));
    }
  }
}
