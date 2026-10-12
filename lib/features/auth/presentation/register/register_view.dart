import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/app/router/app_navigation_router.dart';
import 'package:oryon_mobile/features/auth/presentation/auth_validators.dart';
import 'package:oryon_mobile/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:oryon_mobile/features/auth/presentation/register/bloc/register_event.dart';
import 'package:oryon_mobile/features/auth/presentation/register/bloc/register_state.dart';
import 'package:oryon_mobile/features/auth/presentation/widgets/auth_widgets.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _identifier = TextEditingController();
  final _password = TextEditingController();
  var _viaPhone = false;

  @override
  void dispose() {
    _name.dispose();
    _identifier.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) return;
    context.read<RegisterBloc>().add(
      RegisterSubmitted(
        name: _name.text.trim(),
        identifier: _identifier.text.trim(),
        password: _password.text,
        viaPhone: _viaPhone,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<RegisterBloc, RegisterState>(
      listenWhen: (previous, current) =>
          current.isSuccess && !previous.isSuccess,
      listener: (context, state) => GoRouter.of(context).goToVerifyRegister((
        flowId: state.flowId!,
        identifier: _identifier.text.trim(),
        viaPhone: _viaPhone,
      )),
      builder: (context, state) => AuthScaffold(
        title: l10n.authCreateAccount,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SegmentedButton<bool>(
                segments: [
                  ButtonSegment(value: false, label: Text(l10n.authEmail)),
                  ButtonSegment(value: true, label: Text(l10n.authPhone)),
                ],
                selected: {_viaPhone},
                onSelectionChanged: (selection) =>
                    setState(() => _viaPhone = selection.first),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _name,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: l10n.authName),
                validator: (value) => validateRequired(l10n, value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _identifier,
                keyboardType: _viaPhone
                    ? TextInputType.phone
                    : TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: _viaPhone ? l10n.authPhone : l10n.authEmail,
                ),
                validator: (value) => _viaPhone
                    ? validatePhone(l10n, value)
                    : validateEmail(l10n, value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _password,
                obscureText: true,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: l10n.authPassword),
                validator: (value) => validatePassword(l10n, value),
                onFieldSubmitted: (_) => _submit(),
              ),
              const SizedBox(height: 24),
              AuthErrorText(state.error),
              AuthSubmitButton(
                label: l10n.authCreateAccount,
                onPressed: state.isLoading ? null : _submit,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(l10n.authHaveAccount),
                  TextButton(
                    onPressed: () => GoRouter.of(context).goToLogin(),
                    child: Text(l10n.authSignIn),
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
