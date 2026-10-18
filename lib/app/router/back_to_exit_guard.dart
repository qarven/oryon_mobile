import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';

/// Asks for a second back press before the app closes. Only Android closes the
/// app on a back press, so the guard is installed there alone.
class BackToExitGuard extends StatefulWidget {
  const BackToExitGuard({required this.child, super.key});

  final Widget child;

  @override
  State<BackToExitGuard> createState() => _BackToExitGuardState();
}

class _BackToExitGuardState extends State<BackToExitGuard> {
  // Doubles as the arm timer and the hint duration, so the hint disappears
  // exactly when the second press stops counting.
  static const window = Duration(seconds: 3);

  Timer? _reset;
  bool _armed = false;

  @override
  void dispose() {
    _reset?.cancel();
    super.dispose();
  }

  void _hint() {
    ScaffoldMessenger.of(context)
      // Repeated presses must replace the hint, not queue another one.
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(context.l10n.exitPressAgain),
          duration: window,
        ),
      );
  }

  void _onPop(bool didPop) {
    // A route pushed inside a tab still pops without reaching this guard.
    if (didPop) return;

    if (_armed) {
      unawaited(SystemNavigator.pop());
      return;
    }

    _armed = true;
    _reset?.cancel();
    _reset = Timer(window, () => _armed = false);
    _hint();
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform != TargetPlatform.android) return widget.child;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) => _onPop(didPop),
      child: widget.child,
    );
  }
}
