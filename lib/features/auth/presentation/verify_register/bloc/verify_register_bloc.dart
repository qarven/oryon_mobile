import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oryon_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:oryon_mobile/features/auth/presentation/verify_register/bloc/verify_register_event.dart';
import 'package:oryon_mobile/features/auth/presentation/verify_register/bloc/verify_register_state.dart';

class VerifyRegisterBloc
    extends Bloc<VerifyRegisterEvent, VerifyRegisterState> {
  VerifyRegisterBloc(this._repository) : super(const VerifyRegisterState()) {
    on<VerifyRegisterSubmitted>(_onSubmitted);
  }

  final AuthRepository _repository;

  Future<void> _onSubmitted(
    VerifyRegisterSubmitted event,
    Emitter<VerifyRegisterState> emit,
  ) async {
    emit(
      const VerifyRegisterState(status: VerifyRegisterStatus.loading),
    );
    try {
      await _repository.verifyRegistration(
        flowId: event.flowId,
        code: event.code,
        viaPhone: event.viaPhone,
      );
      emit(
        const VerifyRegisterState(status: VerifyRegisterStatus.success),
      );
    } catch (error) {
      emit(
        VerifyRegisterState(
          status: VerifyRegisterStatus.failure,
          error: error,
        ),
      );
    }
  }
}
