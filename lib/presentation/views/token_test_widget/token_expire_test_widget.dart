import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_assignment/core/constants/api_constants.dart';

/* 토큰 만료 테스트 전용 위젯
AccessToken / RefreshToken 만료 상황을 수동으로 만들어 테스트하기 위해 구현 */

/*🔐 토큰 만료 테스트 시나리오
- 먼저 mypage_screen에 있는 TokenExpireTestWidget() 주석을 제거해주세요

시나리오 1
1. RefreshToken + AccessToken 모두 만료 경우 테스트
- RefreshToken 만료 버튼 클릭
- AccessToken 만료 버튼 클릭
- 게시판 탭 이동 후 위로 스와이프
 → 로그인 화면 이동


시나리오 2
2. AccessToken만 만료된 경우 테스트
- AccessToken 만료 버튼 클릭
- 게시판 탭 이동 후 위로 스와이프
→ RefreshToken으로 AccessToken 자동 갱신 (로그아웃 없음)*/


class TokenExpireTestWidget extends StatelessWidget {
  const TokenExpireTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '토큰 만료 테스트',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.orange.shade800,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              /// AccessToken 만료
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () async {
                    const storage = FlutterSecureStorage();
                    await storage.write(
                      key: ApiConstants.accessTokenKey,
                      value: 'expired_access_token_for_test',
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'AccessToken을 만료 상태로 변경했습니다.\n게시판 탭으로 이동해 테스트하세요.',
                        ),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  },
                  icon: const Icon(Icons.access_time, size: 18),
                  label: const Text('AccessToken 만료'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.orange.shade700,
                    side: BorderSide(color: Colors.orange.shade300),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              /// RefreshToken 만료
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () async {
                    const storage = FlutterSecureStorage();
                    await storage.write(
                      key: ApiConstants.refreshTokenKey,
                      value: 'expired_refresh_token_for_test',
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'RefreshToken을 만료 상태로 변경했습니다.\n게시판 탭으로 이동해 테스트하세요.',
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  icon: const Icon(Icons.refresh, size: 18),
                  label: const Text('RefreshToken 만료'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red.shade700,
                    side: BorderSide(color: Colors.red.shade300),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
