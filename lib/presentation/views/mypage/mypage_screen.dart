import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/viewmodels/auth_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/board_list_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/like_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/my_posts_viewmodel.dart';
import 'package:flutter_assignment/presentation/views/mypage/widgets/board_card.dart';
import 'package:flutter_assignment/presentation/views/mypage/widgets/empty_state.dart';
import 'package:flutter_assignment/presentation/views/mypage/widgets/full_list_screen.dart';
import 'package:flutter_assignment/presentation/views/mypage/widgets/section_title.dart';
import 'package:flutter_assignment/presentation/views/mypage/widgets/user_info_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MypageScreen extends ConsumerStatefulWidget {
  const MypageScreen({super.key});

  @override
  ConsumerState<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends ConsumerState<MypageScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(likeViewModelProvider.notifier).refresh();
      ref.read(myPostsViewModelProvider.notifier).refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    final boardState = ref.watch(boardListViewModelProvider);
    final likeState = ref.watch(likeViewModelProvider);
    final myPostsState = ref.watch(myPostsViewModelProvider);

    final userEmail = authState.user?.email;

    if (userEmail == null) {
      return Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: const Center(
          child: Text('로그인 정보를 찾을 수 없습니다'),
        ),
      );
    }

    final likedBoards = boardState.boards
        .where((board) => likeState.likedPostIds.contains(board.id))
        .toList();

    final myBoards = boardState.boards
        .where((board) => myPostsState.myPostIds.contains(board.id))
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 사용자 정보 카드
            const UserInfoCard(),
            const SizedBox(height: 24),
            /*  토큰 만료 테스트 버튼용
            AccessToken / RefreshToken 만료 시나리오 테스트를 위해 구현*/
            // const TokenExpireTestWidget(),

            const SizedBox(height: 24),
            // 내가 좋아요한 게시글
            SectionTitle(
              title: '내가 좋아요한 게시글',
              count: likedBoards.length,
            ),
            const SizedBox(height: 12),
            if (likedBoards.isEmpty)
              const EmptyState(message: '좋아요한 게시글이 없습니다')
            else ...[
              ...likedBoards.take(3).map((board) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: BoardCard(board: board),
              )),
              if (likedBoards.length > 3)
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullListScreen(
                          title: '내가 좋아요한 게시글',
                          boards: likedBoards,
                        ),
                      ),
                    );
                  },
                  child: const Text('전체보기'),
                ),
            ],

            const SizedBox(height: 24),
            // 내가 작성한 게시글
            SectionTitle(
              title: '내가 작성한 게시글',
              count: myBoards.length,
            ),
            const SizedBox(height: 12),
            if (myBoards.isEmpty)
              const EmptyState(message: '작성한 게시글이 없습니다')
            else ...[
              ...myBoards.take(3).map((board) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: BoardCard(board: board),
              )),
              if (myBoards.length > 3)
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullListScreen(
                          title: '내가 작성한 게시글',
                          boards: myBoards,
                        ),
                      ),
                    );
                  },
                  child: const Text('전체보기'),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
