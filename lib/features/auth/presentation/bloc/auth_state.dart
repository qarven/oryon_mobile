enum AuthStatus { idle, loading, success, failure }

// One state for the four auth cubits, they only differ in what they call.
// flowId is what registration hands over to the verification screen.
class AuthState {
  const AuthState({this.status = AuthStatus.idle, this.error, this.flowId});

  final AuthStatus status;
  final Object? error;
  final String? flowId;

  bool get isLoading => status == AuthStatus.loading;
  bool get isSuccess => status == AuthStatus.success;
}
