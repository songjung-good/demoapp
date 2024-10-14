import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:get/get.dart';
import './splash/splash_page.dart'; // SplashPage 임포트 추가

void main() {
  KakaoSdk.init(
    nativeAppKey: 'd86001ed71db96a40261eb31723e3745',
    javaScriptAppKey: 'ac1d7350a0ed33d54d982bfb88937541'
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '똑똑',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(), // 스플래시 페이지를 처음에 띄움
    );
  }
}
