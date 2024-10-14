import 'package:flutter/material.dart';
import 'package:fe/dutchpay/dutch_alone.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 화면 크기 가져오기
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: width,
            height: height, // 전체 화면 크기
            decoration: ShapeDecoration(
              color: const Color(0xFF22BE67),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Stack(
              children: [
                // 좌측 상단 아이콘
                Positioned(
                  left: width * 0.05, // 화면 너비의 5%
                  top: height * 0.12, // 화면 높이의 12%
                  child: SizedBox(
                    width: width * 0.1, // 화면 너비의 10%
                    height: height * 0.05, // 화면 높이의 5%
                    child: const Icon(Icons.menu, color: Colors.white),
                  ),
                ),

                // 혼자 정산하기, 같이 정산하기 카드 (좌측 카드)
                Positioned(
                  left: width * 0.05,
                  top: height * 0.29,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DutchAlone(),
                        ),
                      );
                    },
                    child: Container(
                      width: width * 0.43, // 화면 너비의 43%
                      height: height * 0.25, // 화면 높이의 25%
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '혼자\n정산하기',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // 같이 정산하기 카드 (우측 카드)
                Positioned(
                  left: width * 0.51,
                  top: height * 0.29,
                  child: Container(
                    width: width * 0.43,
                    height: height * 0.25,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '같이\n정산하기',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),

                // 상단 메시지
                Positioned(
                  left: width * 0.05,
                  top: height * 0.18,
                  child: Container(
                    width: width * 0.89,
                    height: height * 0.09,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.12,
                  top: height * 0.20,
                  child: const Text(
                    '똑똑~\n정산 요청이 2건 있어요',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                // 하단 버튼 영역
                Positioned(
                  left: width * 0.05,
                  top: height * 0.56,
                  child: Container(
                    width: width * 0.89,
                    height: height * 0.07,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.12,
                  top: height * 0.58,
                  child: const Text(
                    '똑똑 이용법',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.77,
                  top: height * 0.58,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    child: const Text(
                      '알아보기',
                      style: TextStyle(
                        color: Color(0xFF22BE67),
                        fontSize: 9,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // 하단 네비게이션 바
                Positioned(
                  left: 0,
                  top: height * 0.88,
                  child: Container(
                    width: width,
                    height: height * 0.12,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),
                ),

                // 하단 네비게이션 아이콘들
                Positioned(
                  left: width * 0.13,
                  top: height * 0.90,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white24,
                    radius: 17,
                    child: Icon(Icons.home, color: Colors.white),
                  ),
                ),
                Positioned(
                  left: width * 0.45,
                  top: height * 0.90,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white24,
                    radius: 17,
                    child: Icon(Icons.account_circle, color: Colors.white),
                  ),
                ),
                Positioned(
                  left: width * 0.77,
                  top: height * 0.90,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white24,
                    radius: 17,
                    child: Icon(Icons.settings, color: Colors.white),
                  ),
                ),

                // 우측 상단 알림 아이콘
                Positioned(
                  left: width * 0.93,
                  top: height * 0.12,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
