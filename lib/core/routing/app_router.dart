import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tudkabir/features/auth/presentation/pages/login/login_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Scaffold();
      },
    ),
  ],
);
