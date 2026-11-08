import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_apps/core/extensions/theme_x.dart';
import 'package:my_flutter_apps/core/theme/accent_family.dart';
import 'package:my_flutter_apps/features/home/presentation/models/app_catalog.dart';
import 'package:my_flutter_apps/features/home/presentation/models/app_entry.dart';
import 'package:my_flutter_apps/features/home/presentation/notifier/home_notifier.dart';
import 'package:my_flutter_apps/features/home/presentation/state/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const _HomeView();
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final List<AppEntry> catalog = buildAppCatalog(context);

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.interests, color: context.colorScheme.primary),
        title: const Text("Kheemwel's Flutter Apps"),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: _SearchBar(),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: _FilterChipsRow(),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                _ResultsGrid(catalog: catalog),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResultsGrid extends ConsumerWidget {
  const _ResultsGrid({required this.catalog});

  final List<AppEntry> catalog;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the pieces that determine the filtered list.
    final HomeState state = ref.watch(homeProvider);
    final List<AppEntry> visible = state.filter(catalog);

    if (visible.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: _EmptyState(),
      );
    }

    return SliverLayoutBuilder(
      builder: (BuildContext context, SliverConstraints constraints) {
        const int singleColumnBreakpoint = 450;
        final double width = constraints.crossAxisExtent;
        final SliverGridDelegate delegate = width < singleColumnBreakpoint
            ? const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: 220,
                mainAxisSpacing: 12,
              )
            : const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 320,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                mainAxisExtent: 220,
              );
        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          sliver: SliverGrid(
            gridDelegate: delegate,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) =>
                  _AppCard(entry: visible[index]),
              childCount: visible.length,
            ),
          ),
        );
      },
    );
  }
}

class _SearchBar extends ConsumerStatefulWidget {
  const _SearchBar();

  @override
  ConsumerState<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<_SearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool showClear = ref.watch(
      homeProvider.select((HomeState s) => s.hasActiveFilters),
    );

    return TextField(
      controller: _controller,
      onChanged: ref.read(homeProvider.notifier).queryChanged,
      decoration: InputDecoration(
        hintText: 'Search apps…',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: showClear
            ? IconButton(
                tooltip: 'Clear',
                icon: const Icon(Icons.close),
                onPressed: () {
                  _controller.clear();
                  ref.read(homeProvider.notifier).cleared();
                },
              )
            : null,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _FilterChipsRow extends ConsumerWidget {
  const _FilterChipsRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<AppEntry> catalog = buildAppCatalog(context);

    // Scope: rebuild only when the selected set changes.
    // The available tags are derived from the (static) catalog.
    final Set<String> selected = ref.watch(
      homeProvider.select((HomeState s) => s.selectedTags),
    );
    final Set<String> allTags = const HomeState().collectTags(catalog);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: allTags
          .map(
            (String tag) => FilterChip(
              label: Text(tag),
              selected: selected.contains(tag),
              onSelected: (_) =>
                  ref.read(homeProvider.notifier).tagToggled(tag),
            ),
          )
          .toList(growable: false),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.search_off,
            size: 48,
            color: context.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 12),
          Text(
            'No apps match your filters',
            style: context.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class _AppCard extends StatelessWidget {
  const _AppCard({required this.entry});
  final AppEntry entry;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => entry.route(context),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _SquircleIcon(icon: entry.icon, accent: entry.accent),
              const SizedBox(height: 12),
              Text(
                entry.title,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                entry.description,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: entry.tags
                    .map(
                      (String tag) =>
                          _TagChip(label: tag, accent: entry.accent),
                    )
                    .toList(growable: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A squircle (superellipse-ish) icon container filled with the accent's
/// primaryContainer and using its onPrimaryContainer for contrast.
class _SquircleIcon extends StatelessWidget {
  const _SquircleIcon({required this.icon, required this.accent});

  final IconData icon;
  final AccentFamily accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: accent.primaryContainer,
        // A near-squircle: big radius + a slightly smaller inner radius look.
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, color: accent.onPrimaryContainer, size: 26),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label, required this.accent});

  final String label;
  final AccentFamily accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: accent.primaryContainer.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          color: accent.onPrimaryContainer,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
