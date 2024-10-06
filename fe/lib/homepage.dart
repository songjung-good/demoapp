import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈페이지'),
      ),
      body: Center(
        child: const Text('로그인 성공!'),
      ),
    );
  }
}
