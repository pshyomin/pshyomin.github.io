import 'package:flutter/material.dart';
import 'package:portfolio/utils/config.dart';

import 'pages/about_me.dart';
import 'pages/experience.dart';
import 'pages/portfolio.dart';
import 'widgets/bottom.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
    Config.setisMobile(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Config.bodyLineColor,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            AboutMe(),
            Portfolio(),
            Experience(),
            // 이 소스를 사용 시에 Bottom Widget의 내용은 변경을 금합니다.
            // 출처는 꼭 작성 해주세요!
            // When using this source, the contents of the Bottom Widget are prohibited from being changed.
            // Please write the source!
            const Bottom(),
          ],
        ),
      ),
    );
  }
}
