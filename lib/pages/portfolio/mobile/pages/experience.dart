import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/config.dart';
import '../../../../utils/layout_manager.dart';

import '../../../../models/portfolio/experience_model.dart' as exp;

class Experience extends StatelessWidget {
  Experience({Key? key}) : super(key: key);

  final List<exp.Experience> experiences = Config.experiences;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    LayoutManager layoutManager = LayoutManager(MediaQuery.of(context));
    return Container(
      width: layoutManager.width,
      color: Colors.grey.shade100,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: _text(Config.titleExperience, Config.fontColor),
          ),
          Container(
            width: layoutManager.getWidth(0.7),
            height: layoutManager.getHeight(0.35),
            margin: const EdgeInsets.all(8),
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                return _experienceTile(
                  layoutManager,
                  experiences[index].icon,
                  experiences[index].title,
                  experiences[index].contents,
                  experiences[index].dateTime,
                  experiences[index].stacks!,
                  experiences[index].google!,
                  experiences[index].apple!,
                );
              },
            ),
          ),
          FittedBox(
            child: Container(
              width: layoutManager.getWidth(1),
              height: layoutManager.getHeight(0.03),
              margin: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: experiences.length,
                itemExtent: 12,
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: _currentPage(index, controller.page!),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _currentPage(int index, double page) {
    Color ballColor = index == page ? Config.fontColor : Colors.grey.shade300;
    return Text(
      '●',
      style: TextStyle(color: ballColor, fontSize: 10),
    );
  }

  Widget _experienceTile(LayoutManager layoutManager, Widget icon, String title,
      String contents, String dateTime, List<String> stacks,
      [String googleUrl = '', String appleUrl = '']) {
    return Container(
      width: layoutManager.getWidth(0.8),
      height: layoutManager.getHeight(0.32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: _tagExperienceTitle(contents),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade200,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: icon,
                    ),
                  ),
                  _text(title, Config.fontTitleColor, 24),
                ],
              ),
            ),
            _text(dateTime, Config.fontLightColor, 10),
            SizedBox(
              width: layoutManager.getWidth(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: _experienceStacks(stacks),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      googleUrl == ''
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(2, 10, 2, 5),
                              child: _link2Button(
                                  'assets/Google_Play.svg', googleUrl),
                            ),
                      appleUrl == ''
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(2, 10, 2, 5),
                              child: _link2Button('assets/Apple.svg', appleUrl),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _link2Button(String svgAsset, String url) {
    return MaterialButton(
      onPressed: () => _openUrl(url),
      padding: const EdgeInsets.all(5),
      elevation: 1,
      hoverElevation: 1,
      shape: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 6, 8),
        child: SvgPicture.asset(
          svgAsset,
          width: 32,
          height: 32,
        ),
      ),
    );
  }

  Widget _experienceStacks(List<String> stacks) {
    return Wrap(
      spacing: 1,
      runSpacing: 1,
      children: stacks
          .map(
            (e) => _tagExperience(e),
          )
          .toList(),
    );
  }

  Widget _tagExperienceTitle(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Config.fontLightColor),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 10,
              color: Config.fontColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _tagExperience(String text) {
    return FittedBox(
      child: Container(
        margin: const EdgeInsets.fromLTRB(3, 0, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: Config.fontLightColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _text(String text, Color fontColor,
      [double size = 18, FontWeight fontWeight = FontWeight.w500]) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: size,
        fontWeight: fontWeight,
        letterSpacing: 2,
      ),
    );
  }

  Future _openUrl(String strUrl) async {
    final url = Uri.parse(strUrl);
    if (!await launchUrl(url)) {
      throw Exception('$url');
    }
  }
}
