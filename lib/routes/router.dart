import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:scheduling_assistant/views/layout/main_layout.dart';
import 'package:scheduling_assistant/views/calendar/index.dart';
import 'package:scheduling_assistant/views/scheduling/index.dart';
import 'package:scheduling_assistant/views/scheduling/edit.dart';
import 'package:scheduling_assistant/views/setting/index.dart';

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
          builder: (context, state) => const SchedulingPage(),
        ),
        GoRoute(
          path: '/scheduling/edit/:id',
          builder: (context, state) => SchedulingEditPage(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
        ),
      ],
    ),
  ],
);
