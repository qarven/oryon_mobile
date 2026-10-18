import 'package:flutter/material.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

class _TeamMember {
  const _TeamMember({
    required this.name,
    required this.role,
    required this.email,
  });

  final String name;
  final String role;
  final String email;

  String get initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1))
        .toUpperCase();
  }
}

class TeamView extends StatelessWidget {
  const TeamView({super.key});

  static const _members = <_TeamMember>[
    _TeamMember(
      name: 'Ava Carter',
      role: 'Product Designer',
      email: 'ava.carter@oryon.com',
    ),
    _TeamMember(
      name: 'Marcus Lee',
      role: 'Engineering Lead',
      email: 'marcus.lee@oryon.com',
    ),
    _TeamMember(
      name: 'Priya Sharma',
      role: 'Frontend Engineer',
      email: 'priya.sharma@oryon.com',
    ),
    _TeamMember(
      name: 'Diego Alvarez',
      role: 'Backend Engineer',
      email: 'diego.alvarez@oryon.com',
    ),
    _TeamMember(
      name: 'Noor Hassan',
      role: 'QA Engineer',
      email: 'noor.hassan@oryon.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.navTeam),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_add_outlined),
            tooltip: 'Invite',
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.lg),
        itemCount: _members.length,
        separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
        itemBuilder: (context, index) {
          final member = _members[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: colors.primaryContainer,
                child: Text(
                  member.initials,
                  style: AppTypography.labelLarge.copyWith(
                    color: colors.onPrimaryContainer,
                  ),
                ),
              ),
              title: Text(member.name, style: AppTypography.titleSmall),
              subtitle: Text(
                '${member.role} · ${member.email}',
                style: AppTypography.bodySmall.copyWith(
                  color: colors.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ),
          );
        },
      ),
    );
  }
}
