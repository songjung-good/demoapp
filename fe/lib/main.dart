import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'homepage.dart'; // HomePage 임포트 추가

void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();
  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: 'd86001ed71db96a40261eb31723e3745',
    javaScriptAppKey: '8356013255026db797a63a0c7f0fdb7e',
  );

  runApp(const MyApp());
}

class Config {
  static const String apiUrl = 'http://localhost:8080'; // 임시 주소
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '똑똑',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Future<void> _loginWithKakao(BuildContext context) async {
    try {
      // 카카오톡으로 로그인 시도
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      print('카카오톡으로 로그인 성공 ${token.accessToken}');
      // 로그인 성공 시 HomePage로 이동
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
      // 카카오톡 로그인 실패 시 카카오 계정으로 로그인 시도
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        print('카카오 계정으로 로그인 성공 ${token.accessToken}');
        // 로그인 성공 시 HomePage로 이동
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('똑똑'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _loginWithKakao(context), // context를 전달
          child: const Text('카카오로 로그인'),
        ),
      ),
    );
  }
}
