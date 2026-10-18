import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

/// Kind of value an [AppTextField] collects.
///
/// The kind sets the keyboard, autocapitalisation, autofill hints, and whether
/// the value is obscured, so screens do not repeat them per field.
enum AppTextFieldType {
  text,
  email,
  password,
  phone,
}

/// Visual emphasis of an [AppTextField].
///
/// Use [AppTextFieldVariant.outlined] on plain surfaces and
/// [AppTextFieldVariant.filled] on cards and other already filled surfaces.
enum AppTextFieldVariant {
  filled,
  outlined,
}

/// Size of an [AppTextField], controlling its height, padding, and text style.
///
/// Heights follow the Material 3 text field scale and never fall below the
/// 48x48 tap target, so the password visibility toggle stays tappable.
enum AppTextFieldSize {
  sm,
  md,
  lg,
}

/// Single line text input that follows the app design system.
///
/// Use [AppTextFieldType.email], [AppTextFieldType.password], or
/// [AppTextFieldType.phone] so the keyboard, autofill, and obscuring match the
/// value, and [AppTextFieldType.text] for anything else.
///
/// The field is a [TextFormField], so [validator] runs inside the surrounding
/// [Form].
class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.label,
    this.controller,
    this.type = AppTextFieldType.text,
    this.variant = AppTextFieldVariant.outlined,
    this.size = AppTextFieldSize.md,
    this.icon,
    this.hintText,
    this.helperText,
    this.errorText,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.autofocus = false,
    this.enabled = true,
    super.key,
  });

  /// Floating label of the field.
  final String label;

  final TextEditingController? controller;

  /// Value the field collects, which drives keyboard, autofill, and obscuring.
  final AppTextFieldType type;

  final AppTextFieldVariant variant;

  final AppTextFieldSize size;

  /// Optional leading icon. A password field also shows the visibility toggle
  /// in the trailing position.
  final IconData? icon;

  final String? hintText;

  final String? helperText;

  /// Error owned by the caller, shown without running [validator].
  final String? errorText;

  final FormFieldValidator<String>? validator;

  final ValueChanged<String>? onChanged;

  /// Called when the value is submitted from the keyboard action key.
  final ValueChanged<String>? onSubmitted;

  /// Label of the keyboard action key. Defaults to the platform's done action.
  final TextInputAction? textInputAction;

  final bool autofocus;

  final bool enabled;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  var _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final metrics = widget.size.metrics;
    final isPassword = widget.type == AppTextFieldType.password;

    if (theme.platform == TargetPlatform.iOS) {
      return _buildCupertinoField(theme, metrics, isPassword);
    }

    final borders = widget.variant.borders(theme.inputDecorationTheme);

    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      obscureText: isPassword && _isObscured,
      keyboardType: widget.type.keyboardType,
      textCapitalization: widget.type.textCapitalization,
      textInputAction: widget.textInputAction,
      autofillHints: widget.type.autofillHints,
      style: metrics.textStyle,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        helperText: widget.helperText,
        errorText: widget.errorText,
        filled: widget.variant == AppTextFieldVariant.filled,
        fillColor: widget.variant == AppTextFieldVariant.filled
            ? theme.colorScheme.surfaceContainerHighest
            : null,
        contentPadding: metrics.contentPadding,
        constraints: BoxConstraints(minHeight: metrics.height),
        prefixIcon: widget.icon == null
            ? null
            : Icon(
                widget.icon,
                size: metrics.iconSize,
                color: theme.colorScheme.onSurfaceVariant,
              ),
        suffixIcon: isPassword
            ? _buildVisibilityToggle(metrics.iconSize)
            : null,
        border: borders.border,
        enabledBorder: borders.enabledBorder,
        focusedBorder: borders.focusedBorder,
        errorBorder: borders.errorBorder,
        focusedErrorBorder: borders.focusedErrorBorder,
      ),
    );
  }

  Widget _buildCupertinoField(
    ThemeData theme,
    ({
      double height,
      EdgeInsets contentPadding,
      TextStyle textStyle,
      double iconSize,
    })
    metrics,
    bool isPassword,
  ) {
    final effectiveErrorText = widget.errorText;
    final obscureText = isPassword && _isObscured;

    return FormField<String>(
      initialValue: widget.controller?.text,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.disabled,
      builder: (field) {
        final errorText = effectiveErrorText ?? field.errorText;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: metrics.height,
              child: CupertinoTextField(
                controller: widget.controller,
                enabled: widget.enabled,
                autofocus: widget.autofocus,
                obscureText: obscureText,
                keyboardType: widget.type.keyboardType,
                textCapitalization: widget.type.textCapitalization,
                textInputAction: widget.textInputAction,
                autofillHints: widget.type.autofillHints,
                style: metrics.textStyle,
                padding: metrics.contentPadding,
                placeholder: widget.label,
                placeholderStyle: metrics.textStyle.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                prefix: widget.icon == null
                    ? null
                    : Padding(
                        padding: const EdgeInsets.only(left: AppSpacing.sm),
                        child: Icon(
                          widget.icon,
                          size: metrics.iconSize,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                suffix: isPassword
                    ? _buildVisibilityToggle(metrics.iconSize)
                    : null,
                decoration: BoxDecoration(
                  color: widget.variant == AppTextFieldVariant.filled
                      ? theme.colorScheme.surfaceContainerHighest
                      : null,
                  border: Border.all(
                    color: errorText != null
                        ? theme.colorScheme.error
                        : theme.colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                onChanged: (value) {
                  widget.onChanged?.call(value);
                  field.didChange(value);
                },
                onSubmitted: (value) {
                  widget.onSubmitted?.call(value);
                },
              ),
            ),
            if (widget.helperText != null || errorText != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                errorText ?? widget.helperText!,
                style:
                    (errorText != null
                            ? theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.error,
                              )
                            : theme.textTheme.bodySmall)
                        ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildVisibilityToggle(double iconSize) {
    final l10n = context.l10n;
    return IconButton(
      onPressed: () => setState(() => _isObscured = !_isObscured),
      tooltip: _isObscured ? l10n.fieldShowPassword : l10n.fieldHidePassword,
      icon: Icon(
        _isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        size: iconSize,
      ),
    );
  }
}

extension on AppTextFieldType {
  TextInputType get keyboardType => switch (this) {
    AppTextFieldType.text => TextInputType.text,
    AppTextFieldType.email => TextInputType.emailAddress,
    AppTextFieldType.password => TextInputType.visiblePassword,
    AppTextFieldType.phone => TextInputType.phone,
  };

  TextCapitalization get textCapitalization => switch (this) {
    AppTextFieldType.text => TextCapitalization.sentences,
    AppTextFieldType.email => TextCapitalization.none,
    AppTextFieldType.password => TextCapitalization.none,
    AppTextFieldType.phone => TextCapitalization.none,
  };

  Iterable<String>? get autofillHints => switch (this) {
    AppTextFieldType.text => null,
    AppTextFieldType.email => const [AutofillHints.email],
    AppTextFieldType.password => const [AutofillHints.password],
    AppTextFieldType.phone => const [AutofillHints.telephoneNumber],
  };
}

extension on AppTextFieldVariant {
  /// Borders of this variant, taken from the theme so the field keeps its
  /// shape and colours in light and dark mode.
  ///
  /// A filled field hides its resting borders and keeps the focused and error
  /// borders, so focus and validation stay visible.
  ({
    InputBorder? border,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
  })
  borders(InputDecorationThemeData theme) => switch (this) {
    AppTextFieldVariant.outlined => (
      border: theme.border,
      enabledBorder: theme.enabledBorder,
      focusedBorder: theme.focusedBorder,
      errorBorder: theme.errorBorder,
      focusedErrorBorder: theme.focusedErrorBorder,
    ),
    AppTextFieldVariant.filled => (
      border: theme.border?.copyWith(borderSide: BorderSide.none),
      enabledBorder: theme.enabledBorder?.copyWith(
        borderSide: BorderSide.none,
      ),
      focusedBorder: theme.focusedBorder,
      errorBorder: theme.errorBorder,
      focusedErrorBorder: theme.focusedErrorBorder,
    ),
  };
}

extension on AppTextFieldSize {
  /// Height, content padding, text style, and icon size of this size.
  ///
  /// The height is a minimum: a floating label or long helper text grows the
  /// field instead of overflowing it.
  ({
    double height,
    EdgeInsets contentPadding,
    TextStyle textStyle,
    double iconSize,
  })
  get metrics => switch (this) {
    AppTextFieldSize.sm => (
      height: 48,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.sm,
      ),
      textStyle: AppTypography.labelMedium,
      iconSize: 20,
    ),
    AppTextFieldSize.md => (
      height: 56,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      textStyle: AppTypography.bodyMedium,
      iconSize: 24,
    ),
    AppTextFieldSize.lg => (
      height: 64,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      textStyle: AppTypography.bodyLarge,
      iconSize: 24,
    ),
  };
}
