import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/app/router/app_navigation_router.dart';
import 'package:oryon_mobile/features/auth/presentation/auth_validators.dart';
import 'package:oryon_mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:oryon_mobile/features/auth/presentation/bloc/forgot_password_cubit.dart';
import 'package:oryon_mobile/features/auth/presentation/widgets/auth_widgets.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({this.initialIdentifier, super.key});

  final String? initialIdentifier;

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  late final _identifier = TextEditingController(
    text: widget.initialIdentifier,
  );

  @override
  void dispose() {
    _identifier.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) return;
    context.read<ForgotPasswordCubit>().requestReset(_identifier.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<ForgotPasswordCubit, AuthState>(
      builder: (context, state) => AuthScaffold(
        title: l10n.authForgotPasswordTitle,
        child: state.isSuccess
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(l10n.authResetSent),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () => GoRouter.of(context).goToLogin(),
                    child: Text(l10n.authSignIn),
                  ),
                ],
              )
            : Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _identifier,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: l10n.authIdentifier,
                      ),
                      validator: (value) => validateRequired(l10n, value),
                      onFieldSubmitted: (_) => _submit(),
                    ),
                    const SizedBox(height: 24),
                    AuthErrorText(state),
                    AuthSubmitButton(
                      label: l10n.authSendResetCode,
                      onPressed: state.isLoading ? null : _submit,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
