import 'dart:ui';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.child});

  final Widget child;

  static const routes = ['/calendar', '/scheduling', '/settings'];

  static const labels = ['日历', '排班', '设置'];

  static const icons = [
    FluentIcons.calendar,
    FluentIcons.task_list,
    FluentIcons.settings,
  ];

  int _selectedIndex(BuildContext context) {
    final path = GoRouterState.of(context).uri.path;

    if (path.startsWith('/calendar')) {
      return 0;
    }

    if (path.startsWith('/scheduling')) {
      return 1;
    }

    if (path.startsWith('/settings')) {
      return 2;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _selectedIndex(context);

    return material.Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 96),
                child: child,
              ),
            ),

            Positioned(
              left: 20,
              right: 20,
              bottom: 24,
              child: _FloatingTabBar(selectedIndex: selectedIndex),
            ),
          ],
        ),
      ),
    );
  }
}

class _FloatingTabBar extends StatelessWidget {
  const _FloatingTabBar({required this.selectedIndex});

  final int selectedIndex;

  static const routes = ['/calendar', '/scheduling', '/settings'];

  static const labels = ['日历', '排班', '设置'];

  static const icons = [
    FluentIcons.calendar,
    FluentIcons.task_list,
    FluentIcons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: material.Colors.white.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              material.BoxShadow(
                blurRadius: 32,
                offset: Offset(0, 8),
                color: Color(0x18000000),
              ),
            ],
          ),
          child: Row(
            children: List.generate(routes.length, (index) {
              final selected = index == selectedIndex;

              return Expanded(
                child: material.InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () {
                    if (!selected) {
                      context.go(routes[index]);
                    }
                  },
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOutCubic,
                      padding: EdgeInsets.symmetric(
                        horizontal: selected ? 14 : 0,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF1677FF)
                            : material.Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            icons[index],
                            size: 20,
                            color: selected
                                ? material.Colors.white
                                : const Color(0xFF7A7A7A),
                          ),
                          if (selected) ...[
                            const SizedBox(width: 6),
                            Text(
                              labels[index],
                              style: const TextStyle(
                                color: material.Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
