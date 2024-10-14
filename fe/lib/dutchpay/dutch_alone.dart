import 'package:flutter/material.dart';

class DutchAlone extends StatelessWidget {
  const DutchAlone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('혼자 정산하기'),
      ),
      body: Center(
        child: const Text('여기에 혼자 정산하기 페이지 내용을 추가하세요.'),
      ),
    );
  }
}
