import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oryon_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:oryon_mobile/features/auth/presentation/forgot_password/bloc/forgot_password_event.dart';
import 'package:oryon_mobile/features/auth/presentation/forgot_password/bloc/forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc(this._repository) : super(const ForgotPasswordState()) {
    on<ForgotPasswordSubmitted>(_onSubmitted);
  }

  final AuthRepository _repository;

  Future<void> _onSubmitted(
    ForgotPasswordSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(
      const ForgotPasswordState(status: ForgotPasswordStatus.loading),
    );
    try {
      await _repository.requestPasswordReset(event.identifier);
      emit(
        const ForgotPasswordState(status: ForgotPasswordStatus.success),
      );
    } catch (error) {
      emit(
        ForgotPasswordState(
          status: ForgotPasswordStatus.failure,
          error: error,
        ),
      );
    }
  }
}
