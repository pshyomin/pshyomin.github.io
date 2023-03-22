import 'package:flutter/material.dart';
import 'package:portfolio/pages/portfolio/project/calculator/calculator_main.dart';

import '../models/portfolio/experience_model.dart';
import '../models/portfolio/portfolio_model.dart';
import '../pages/portfolio/project/weather/main.dart';

class Config {
  static String domain = 'www.uridongnae.com';

  static double contantsWidth = 1190;
  static double contentSize = 1000;

  static Color fontColor = const Color.fromRGBO(51, 51, 51, 1.0);
  static Color fontTitleColor = const Color.fromRGBO(51, 51, 51, 1.0);
  static Color fontLightColor = const Color.fromRGBO(102, 102, 102, 1.0);

  static Color bodyLineColor = const Color.fromRGBO(51, 51, 51, 1.0);

  static Color lineSelectColor = const Color.fromRGBO(51, 51, 51, 1.0);
  static Color lineNotSelectColor = const Color.fromRGBO(51, 51, 51, 0.5);

  static Color backGroundColor = const Color.fromRGBO(248, 248, 255, 1.0);
  static Color backGroundSubColor = const Color.fromRGBO(250, 251, 255, 1.0);

  static String titleAboutMe = 'About Me';
  static String titlePortfolio = 'Portfolio';
  static String titleExperience = 'Experience';

  static String titleName = '이름';
  static String titleBirthDate = '생년월일';
  static String titleResidence = '주소지';
  static String titleEmail = '이메일';

  static String profilePhoto = 'assets/profile.jpg';

  static String profileName = '최효민';
  static String profileBirthDate = '93.12.07';
  static String profileResidence = '부산시 기장군';
  static String profileGithub = 'https://github.com/pshyomin';
  static String profileEmail = 'chymin7321@icloud.com';

  static String emailSubject = 'HYOMIN CHOI (포트폴리오)';

  static String profileAboutMe =
      '하루 하루 성장하고 열정 넘치는 개발자 최효민이라고 합니다. 새로운 기술을 찾아보는 것과 그 기술로 아이디어를 접목하여 만들어 보는 것을 좋아합니다. 잘 부탁드립니다.';

  static bool isMobile = false;

  static bool getisMobile() {
    return isMobile;
  }

  static void setisMobile(bool isCheck) {
    isMobile = isCheck;
  }

  static List<String> skills = [
    'Flutter',
    'C#',
    '.net',
    'Unity',
  ];

  static List<Portfolio> portfolios = [
    Portfolio(
      icon: Container(),
      title: '무엇이든 물어보세요',
      contents: '',
      project: Container(),
      stack: const [
        'Bloc',
        'Rest API',
        'JsonSerializable',
      ],
      github: 'https://github.com/pshyomin/ask',
    ),
    Portfolio(
      icon: Image.asset('assets/icon/weather.png'),
      title: '오늘의날씨',
      contents: '',
      project: MyApp(),
      stack: const [
        'Bloc',
        'Rest API',
        'JsonSerializable',
      ],
      github: 'https://github.com/pshyomin/weather',
    ),
    Portfolio(
      icon: Image.asset('assets/icon/calculator.png'),
      title: '계산기',
      contents: '',
      project: const CalculatorMain(),
      stack: const [
        'Bloc',
      ],
      github: 'https://github.com/pshyomin/calculator',
    ),
  ];

  static List<Experience> experiences = [
    Experience(
      icon: Image.asset(
        'assets/icon/wafull.jpg',
        fit: BoxFit.fitWidth,
      ),
      title: '와풀',
      contents: '외주',
      dateTime: '22.11 ~ 22.12',
      stacks: ['Bloc', 'Rest API', 'Firebase', 'Sqlite'],
      google: 'https://play.google.com/store/apps/details?id=net.wafull',
    ),
  ];
}
