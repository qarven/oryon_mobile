import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/features/auth/module.dart';
import 'package:oryon_mobile/features/auth/services/auth_session.dart';
import 'package:oryon_mobile/features/profile/domain/entities/profile_user.dart';
import 'package:oryon_mobile/features/profile/domain/repositories/profile_repository.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late final Future<ProfileUser> _userFuture =
      GetIt.instance<ProfileRepository>().getCurrentUser();

  Future<void> _signOut() async {
    final confirmed = await context.showConfirmDialog(
      title: context.l10n.profileSignOutTitle,
      message: context.l10n.profileSignOutMessage,
      confirmLabel: context.l10n.profileSignOut,
      cancelLabel: context.l10n.profileSignOutCancel,
    );
    if (!confirmed || !mounted) return;
    await GetIt.instance<AuthSession>().clear();
    if (mounted) {
      GoRouter.of(context).goNamed(AuthModule.loginName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.navProfile)),
      body: FutureBuilder<ProfileUser>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return Center(
              child: Text(
                context.l10n.profileLoadError,
                style: AppTypography.bodyMedium.copyWith(color: colors.error),
              ),
            );
          }
          final user = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: colors.primaryContainer,
                  child: Text(
                    user.initials,
                    style: AppTypography.headlineSmall.copyWith(
                      color: colors.onPrimaryContainer,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(user.name, style: AppTypography.titleLarge),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '@${user.username}',
                  style: AppTypography.bodyMedium.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  user.email,
                  style: AppTypography.bodySmall.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.logout, color: colors.error),
                  title: Text(
                    context.l10n.profileSignOut,
                    style: TextStyle(color: colors.error),
                  ),
                  onTap: _signOut,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
