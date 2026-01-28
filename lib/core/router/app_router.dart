import 'package:flutter_assignment/presentation/viewmodels/auth_viewmodel.dart';
import 'package:flutter_assignment/presentation/views/detail/board_detail_screen.dart';
import 'package:flutter_assignment/presentation/views/form/board_form_screen.dart';
import 'package:flutter_assignment/presentation/views/list/board_list_screen.dart';
import 'package:flutter_assignment/presentation/views/login_screen.dart';
import 'package:flutter_assignment/presentation/views/main_screen.dart';
import 'package:flutter_assignment/presentation/views/mypage/mypage_screen.dart';
import 'package:flutter_assignment/presentation/views/signup_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final authState = ref.watch(authViewModelProvider);
      final isAuthenticated = authState.isAuthenticated;
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
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),

      GoRoute(
        path: '/board/new',
        builder: (context, state) => const BoardFormScreen(),
      ),
      GoRoute(
        path: '/board/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return BoardDetailScreen(boardId: id);
        },
      ),
      GoRoute(
        path: '/board/:id/edit',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return BoardFormScreen(boardId: id);
        },
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