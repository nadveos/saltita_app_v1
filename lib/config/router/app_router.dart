import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saltita/presentation/screens/screens.dart';
import 'package:saltita/presentation/widgets/auth/register.dart';
import 'package:saltita/presentation/widgets/shared/scaffold_with_nav_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _sectionANavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _sectionBNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _sectionCNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _sectionDNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _sectionANavigatorKey,
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'artist/:id',
                  builder: (context, state) {
                     final id = state.pathParameters['id'];
                     return ArtistProfileScreen(artistId: id);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _sectionBNavigatorKey,
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) => const SearchScreen(),
               routes: [
                 // Allow navigating to artist from search too, maintaining search stack
                  GoRoute(
                  path: 'artist/:id',
                  builder: (context, state) {
                     final id = state.pathParameters['id'];
                     return ArtistProfileScreen(artistId: id);
                  },
                ),
               ]
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _sectionCNavigatorKey,
          routes: [
            GoRoute(
              path: '/map',
              builder: (context, state) => const MapScreen(),
              routes: [
                GoRoute(
                  path: 'artist/:id',
                  builder: (context, state) {
                     final id = state.pathParameters['id'];
                     return ArtistProfileScreen(artistId: id);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _sectionDNavigatorKey,
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const UserProfileScreen(),
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: '/register',
      builder: (context, state) => Register(),
    ),
  ],
);
