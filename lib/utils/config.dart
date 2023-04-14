import 'package:flutter/material.dart';
import 'package:portfolio/pages/portfolio/project/calculator/calculator_main.dart';

import '../models/portfolio/experience_model.dart';
import '../models/portfolio/portfolio_model.dart';
import '../pages/portfolio/project/weather/main.dart' as weather;
import '../pages/portfolio/project/ask/main.dart' as ask;

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

  static final PageController _pageController = PageController();

  static List<Portfolio> portfolios = [
    Portfolio(
      icon: Image.asset('assets/uridongnae_icon.png'),
      title: '우리동네',
      contents: '토이프로젝트',
      project: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 30, 37, 1.0),
        appBar: AppBar(
          title: const Text(
            '우리동네',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: FittedBox(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 360,
                  height: 640,
                  padding: const EdgeInsets.all(18),
                  child: PageView(
                    controller: _pageController,
                    physics: const ClampingScrollPhysics(),
                    onPageChanged: (value) {
                      //
                    },
                    children: [
                      Image.asset('assets/s1.png'),
                      Image.asset('assets/s2.png'),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  child: IconButton(
                    onPressed: () {
                      _pageController.animateToPage(0,
                          duration: const Duration(microseconds: 250),
                          curve: Curves.bounceInOut);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      _pageController.animateToPage(1,
                          duration: const Duration(microseconds: 250),
                          curve: Curves.bounceInOut);
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      stack: const [
        'Bloc',
        'dio',
        'go_router',
        'JsonSerializable',
        'Rest API',
      ],
      google:
          'https://play.google.com/store/apps/details?id=com.uridongnae.travel',
    ),
    Portfolio(
      icon: Image.asset('assets/icon/backend.png'),
      title: '포트폴리오 백엔드',
      contents: '',
      project: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 30, 37, 1.0),
        appBar: AppBar(
          title: const Text(
            'Portfolio Backend',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: FittedBox(
            child: Container(
              width: 360,
              height: 640,
              padding: const EdgeInsets.all(18),
              child: const Text(
                '저는 백엔드에 대해서는 아는 부분이 없어 고민하던 중 Dart 이용한 백엔드를 만들 수 있다는 걸 알게되었고 수없이 검색하며 "${'백엔드는 어떤식으로 돌아가는지'}" 를 알게되었고 아직 미흡하나 재미를 느껴 Dart 를 이용한 백엔드도 공부가 필요하다고 느꼈습니다. 잘 안되는 부분들도 있었지만 하나씩 하나씩 해나가니 포트폴리오에 사용할 백엔드 서버를 완성할 수 있었습니다.',
                maxLines: 12,
                style: TextStyle(
                  fontSize: 21,
                  letterSpacing: 1,
                  wordSpacing: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
      ),
      stack: const [
        'shelf',
        'http',
      ],
      github: 'https://github.com/pshyomin/backend',
    ),
    Portfolio(
      icon: Image.asset('assets/icon/ask.png'),
      title: '무엇이든 물어보세요',
      contents: '',
      project: const ask.MyApp(),
      stack: const [
        'Bloc',
        'http (web)',
        'dio (mobile)',
        'Rest API',
        'JsonSerializable',
      ],
      github: 'https://github.com/pshyomin/ask',
    ),
    Portfolio(
      icon: Image.asset('assets/icon/weather.png'),
      title: '오늘의날씨',
      contents: '',
      project: weather.MyApp(),
      stack: const [
        'Bloc',
        'http',
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
      stacks: ['Bloc', 'http', 'Rest API', 'Firebase', 'Sqlite'],
      google: 'https://play.google.com/store/apps/details?id=net.wafull',
    ),
  ];
}
