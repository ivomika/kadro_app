import 'package:go_router/go_router.dart';
import 'package:kadro_app/flows/history/ui/history_screen.dart';
import 'package:kadro_app/flows/search/ui/search_screen.dart';
import 'package:kadro_app/shared/ui/layouts/main_app_layout.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => MainAppLayout(
            currentIndex: shell.currentIndex,
            onTapNavigation: (int index) {
              final currentPage = shell.currentIndex == index;
              shell.goBranch(index, initialLocation: currentPage);
            },
            body: shell
        ),
        branches: [
          StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/',
                  builder: (context, state) => const SearchScreen(),
                ),
              ]
          ),
          StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/history',
                  builder: (context, state) => const HistoryScreen(),
                ),
              ]
          ),
        ]
    )
  ],
);