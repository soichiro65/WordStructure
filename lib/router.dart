import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:word_structure/views/screen/detail_screen.dart';
import 'package:word_structure/views/screen/home_screen.dart';

GoRouter createRouter() {
  final GoRouter _router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (
        BuildContext context,
        GoRouterState state,
      ) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (
            BuildContext context,
            GoRouterState state,
          ) {
            return const DetailsScreen();
          },
        ),
      ],
    ),
  ]);

  return _router;
}
