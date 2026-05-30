import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:scheduling_assistant/views/layout/main_layout.dart';
import 'package:scheduling_assistant/views/calendar/index.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final viewRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/calendar',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/calendar',
          builder: (context, state) => const CalendarPage(),
        ),
        GoRoute(
          path: '/scheduling',
          builder: (context, state) => const Text('scheduling'),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const Text('settings'),
        ),
      ],
    ),
  ],
);
