import 'package:flutter/material.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

/// A single mock explore item shown on the Explore tab.
class _ExploreItem {
  const _ExploreItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
}

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  static const _categories = <String>[
    'All',
    'Design',
    'Development',
    'Marketing',
    'Product',
  ];

  int _selectedCategory = 0;

  static const _items = <_ExploreItem>[
    _ExploreItem(
      title: 'Design systems',
      subtitle: 'Components, tokens and patterns',
      icon: Icons.palette_outlined,
      color: Colors.indigo,
    ),
    _ExploreItem(
      title: 'Flutter widgets',
      subtitle: 'Reusable building blocks',
      icon: Icons.widgets_outlined,
      color: Colors.teal,
    ),
    _ExploreItem(
      title: 'API guides',
      subtitle: 'Connect your backend',
      icon: Icons.api_outlined,
      color: Colors.orange,
    ),
    _ExploreItem(
      title: 'Accessibility',
      subtitle: 'Inclusive by default',
      icon: Icons.accessibility_new_outlined,
      color: Colors.purple,
    ),
    _ExploreItem(
      title: 'Performance',
      subtitle: 'Keep it fast and smooth',
      icon: Icons.speed_outlined,
      color: Colors.green,
    ),
    _ExploreItem(
      title: 'Testing',
      subtitle: 'Confidence in your code',
      icon: Icons.verified_outlined,
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.navExplore)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: colors.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              itemCount: _categories.length,
              separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
              itemBuilder: (context, index) {
                final selected = index == _selectedCategory;
                return ChoiceChip(
                  label: Text(_categories[index]),
                  selected: selected,
                  onSelected: (_) => setState(() => _selectedCategory = index),
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(AppSpacing.lg),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppSpacing.md,
                crossAxisSpacing: AppSpacing.md,
                childAspectRatio: 1.1,
              ),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: item.color.withValues(alpha: 0.15),
                            child: Icon(item.icon, color: item.color),
                          ),
                          const Spacer(),
                          Text(
                            item.title,
                            style: AppTypography.titleSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            item.subtitle,
                            style: AppTypography.bodySmall.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
