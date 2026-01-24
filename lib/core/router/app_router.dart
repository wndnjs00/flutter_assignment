import 'package:flutter_assignment/presentation/viewmodels/auth_viewmodel.dart';
import 'package:flutter_assignment/presentation/views/board_detail_screen.dart';
import 'package:flutter_assignment/presentation/views/board_form_screen.dart';
import 'package:flutter_assignment/presentation/views/board_list_screen.dart';
import 'package:flutter_assignment/presentation/views/login_screen.dart';
import 'package:flutter_assignment/presentation/views/main_screen.dart';
import 'package:flutter_assignment/presentation/views/mypage_screen.dart';
import 'package:flutter_assignment/presentation/views/signup_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final authState = ref.watch(authViewModelProvider);

      final isAuthenticated = authState.maybeWhen(
        data: (user) => user != null,
        orElse: () => false,
      );

      final isLoggingIn =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/signup';

      if (!isAuthenticated && !isLoggingIn) {
        return '/login';
      }

      if (isAuthenticated && isLoggingIn) {
        return '/';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const BoardListScreen(),
                routes: [
                  GoRoute(
                    path: 'board/:id',
                    builder: (context, state) {
                      final id = int.parse(state.pathParameters['id']!);
                      return BoardDetailScreen(boardId: id);
                    },
                  ),
                  GoRoute(
                    path: 'board/new',
                    builder: (context, state) => const BoardFormScreen(),
                  ),
                  GoRoute(
                    path: 'board/:id/edit',
                    builder: (context, state) {
                      final id = int.parse(state.pathParameters['id']!);
                      return BoardFormScreen(boardId: id);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/mypage',
                builder: (context, state) => const MypageScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
