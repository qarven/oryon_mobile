import 'package:flutter/material.dart';
import 'package:oryon_mobile/features/auth/presentation/auth_error.dart';
import 'package:oryon_mobile/features/auth/presentation/bloc/auth_state.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({required this.title, required this.child, super.key});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: child,
      ),
    ),
  );
}

class AuthSubmitButton extends StatelessWidget {
  const AuthSubmitButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;

  // Null while a request is in flight, which is also what disables the button.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => FilledButton(
    onPressed: onPressed,
    child: onPressed == null
        ? const SizedBox.square(
            dimension: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Text(label),
  );
}

class AuthErrorText extends StatelessWidget {
  const AuthErrorText(this.state, {super.key});

  final AuthState state;

  @override
  Widget build(BuildContext context) {
    final error = state.error;
    if (error == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        context.authErrorMessage(error),
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      ),
    );
  }
}
