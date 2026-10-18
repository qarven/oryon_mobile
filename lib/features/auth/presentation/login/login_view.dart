import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/app/router/app_navigation_router.dart';
import 'package:oryon_mobile/features/auth/presentation/auth_validators.dart';
import 'package:oryon_mobile/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:oryon_mobile/features/auth/presentation/login/bloc/login_event.dart';
import 'package:oryon_mobile/features/auth/presentation/login/bloc/login_state.dart';
import 'package:oryon_mobile/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _identifier = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _identifier.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) return;
    context.read<LoginBloc>().add(
      LoginSubmitted(
        identifier: _identifier.text.trim(),
        password: _password.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          current.isSuccess && !previous.isSuccess,
      listener: (context, _) => GoRouter.of(context).goToHome(),
      builder: (context, state) => AuthScaffold(
        title: l10n.authSignIn,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField(
                controller: _identifier,
                label: l10n.authIdentifier,
                textInputAction: TextInputAction.next,
                validator: (value) => validateRequired(l10n, value),
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextField(
                controller: _password,
                label: l10n.authPassword,
                type: AppTextFieldType.password,
                textInputAction: TextInputAction.done,
                validator: (value) => validateRequired(l10n, value),
                onSubmitted: (_) => _submit(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: AppButton(
                  label: l10n.authForgotPassword,
                  variant: AppButtonVariant.link,
                  onPressed: () => GoRouter.of(context).goToForgotPassword(
                    _identifier.text.trim(),
                  ),
                ),
              ),
              AuthErrorText(state.error),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  label: l10n.authSignIn,
                  isLoading: state.isLoading,
                  onPressed: _submit,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Text(l10n.authNoAccount)),
                  AppButton(
                    label: l10n.authCreateAccount,
                    variant: AppButtonVariant.link,
                    onPressed: () => GoRouter.of(context).goToRegister(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
