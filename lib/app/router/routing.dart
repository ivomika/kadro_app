import 'package:go_router/go_router.dart';
import 'package:kadro_app/flows/browse_history/ui/screen/browse_history_screen.dart';
import 'package:kadro_app/flows/find_anime/ui/screen/find_anime_screen.dart';
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
        body: shell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const FindAnimeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/history',
              builder: (context, state) => const BrowseHistoryScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
