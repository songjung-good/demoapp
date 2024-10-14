import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:fe/home_page.dart'; // HomePage 임포트 추가

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  // 로그인 로직
  Future<void> _loginWithKakao(BuildContext context) async {
    // 카카오톡 앱이 있다면
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      print('카카오톡으로 로그인 성공 ${token.accessToken}');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
      // 카카오 앱이 없다면 or 카카오톡을 통해 accessToken이 발급되지 않으면
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
      // 카카오계정으로 로그인
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        print('카카오 계정으로 로그인 성공 ${token.accessToken}');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } catch (accountError) {
        print('카카오 계정으로 로그인 실패 $accountError');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; // 화면 크기 가져오기

    return Scaffold(
      body: Center(
        child: Container(
          width: screenSize.width, // 전체 너비
          height: screenSize.height, // 전체 높이
          decoration: BoxDecoration(
            color: Color(0xFF22BE67),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 환영 메시지와 디자인 요소 추가
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: screenSize.width * 0.9, // 90% 너비
                    height: screenSize.height * 0.5, // 50% 높이
                    decoration: BoxDecoration(
                      color: Color(0xFF22BE67),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '더 ',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: screenSize.width * 0.1, // 반응형 폰트 크기
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: '똑똑',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenSize.width * 0.1, // 반응형 폰트 크기
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: ' 해진 더치페이,\n',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: screenSize.width * 0.1, // 반응형 폰트 크기
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: '똑똑',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenSize.width * 0.1, // 반응형 폰트 크기
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: ' 과 함께',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: screenSize.width * 0.1, // 반응형 폰트 크기
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // 간격 추가
              GestureDetector(
                onTap: () => _loginWithKakao(context),
                child: Container(
                  width: 250, // 버튼 너비
                  height: 50, // 버튼 높이
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/kakao_login_medium_wide.png'), // 카카오 로그인 이미지
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
