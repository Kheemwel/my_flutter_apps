import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_apps/core/extensions/theme_x.dart';
import 'package:my_flutter_apps/core/theme/accent_family.dart';
import 'package:my_flutter_apps/features/home/presentation/cubit/home_cubit.dart';
import 'package:my_flutter_apps/features/home/presentation/cubit/home_state.dart';
import 'package:my_flutter_apps/features/home/presentation/models/app_catalog.dart';
import 'package:my_flutter_apps/features/home/presentation/models/app_entry.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => HomeCubit(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (BuildContext context, HomeState state) {
                final List<AppEntry> visible = state.filter(catalog);

                return CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: _SearchBar(
                          controller: _searchController,
                          onChanged: context.read<HomeCubit>().queryChanged,
                          onClear: () {
                            _searchController.clear();
                            context.read<HomeCubit>().cleared();
                          },
                          showClear: state.hasActiveFilters,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: _FilterChips(
                          tags: state.collectTags(catalog),
                          selected: state.selectedTags,
                          onToggle: context.read<HomeCubit>().tagToggled,
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 16)),
                    if (visible.isEmpty)
                      const SliverFillRemaining(
                        hasScrollBody: false,
                        child: _EmptyState(),
                      )
                    else
                      SliverLayoutBuilder(
                        builder: (context, constraints) {
                          const int singleColumnBreakpoint = 450;
                          final width = constraints.crossAxisExtent;
                          // 1 column below ~450px (Mobile L = 425px included)
                          final delegate = width < singleColumnBreakpoint
                              ? const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisExtent:
                                      220, // fixed height for single column
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
                                (context, index) =>
                                    _AppCard(entry: visible[index]),
                                childCount: visible.length,
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    required this.controller,
    required this.onChanged,
    required this.onClear,
    required this.showClear,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final bool showClear;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search apps…',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: showClear
            ? IconButton(
                tooltip: 'Clear',
                icon: const Icon(Icons.close),
                onPressed: onClear,
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

class _FilterChips extends StatelessWidget {
  const _FilterChips({
    required this.tags,
    required this.selected,
    required this.onToggle,
  });

  final Set<String> tags;
  final Set<String> selected;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: tags
          .map(
            (String tag) => FilterChip(
              label: Text(tag),
              selected: selected.contains(tag),
              onSelected: (_) => onToggle(tag),
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
