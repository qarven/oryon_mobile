import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/app/router/app_navigation_router.dart';
import 'package:oryon_mobile/features/auth/module.dart';
import 'package:oryon_mobile/features/auth/presentation/auth_validators.dart';
import 'package:oryon_mobile/features/auth/presentation/verify_register/bloc/verify_register_bloc.dart';
import 'package:oryon_mobile/features/auth/presentation/verify_register/bloc/verify_register_event.dart';
import 'package:oryon_mobile/features/auth/presentation/verify_register/bloc/verify_register_state.dart';
import 'package:oryon_mobile/features/auth/presentation/widgets/auth_widgets.dart';

class VerifyRegisterView extends StatefulWidget {
  const VerifyRegisterView({required this.args, super.key});

  final VerifyRegisterArgs args;

  @override
  State<VerifyRegisterView> createState() => _VerifyRegisterViewState();
}

class _VerifyRegisterViewState extends State<VerifyRegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _code = TextEditingController();

  @override
  void dispose() {
    _code.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) return;
    context.read<VerifyRegisterBloc>().add(
      VerifyRegisterSubmitted(
        flowId: widget.args.flowId,
        code: _code.text.trim(),
        viaPhone: widget.args.viaPhone,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final args = widget.args;
    return BlocConsumer<VerifyRegisterBloc, VerifyRegisterState>(
      listenWhen: (previous, current) =>
          current.isSuccess && !previous.isSuccess,
      // Registration returns a user, not a token, so the account still has to
      // sign in once the code is accepted.
      listener: (context, _) => GoRouter.of(context).goToLogin(),
      builder: (context, state) => AuthScaffold(
        title: l10n.authVerifyTitle,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l10n.authVerifySubtitle(args.identifier)),
              const SizedBox(height: 24),
              TextFormField(
                controller: _code,
                autofocus: true,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: l10n.authCode),
                validator: (value) => validateRequired(l10n, value),
                onFieldSubmitted: (_) => _submit(),
              ),
              const SizedBox(height: 16),
              AuthErrorText(state.error),
              AuthSubmitButton(
                label: l10n.authVerify,
                onPressed: state.isLoading ? null : _submit,
              ),
              const SizedBox(height: 16),
              Align(
                child: TextButton(
                  onPressed: () => GoRouter.of(context).goToLogin(),
                  child: Text(l10n.authSignIn),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
