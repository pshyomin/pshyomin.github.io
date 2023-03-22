import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/models/portfolio/experience_model.dart';
import 'package:portfolio/models/portfolio/portfolio_model.dart';
import 'package:portfolio/pages/portfolio/web/widgets/detail.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<Portfolio> projects = Config.portfolios;
  final List<Experience> experiences = Config.experiences;
  final List<String> skills = Config.skills;

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(42),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: Container(
          width: Config.contantsWidth - 5,
          height: Config.contentSize - 5,
          color: Colors.white,
          child: ListView(
            controller: ScrollController(),
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: (Config.contantsWidth) * 0.4,
                height: Config.contentSize,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: (Config.contantsWidth) * 0.38,
                      height: Config.contentSize * 0.35,
                      child: Column(
                        children: [
                          _text(Config.titleAboutMe, Config.fontColor),
                          SizedBox(
                            width: (Config.contantsWidth) * 0.38,
                            height: Config.contentSize * 0.15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 52,
                                  backgroundColor: Config.bodyLineColor,
                                  child: CircleAvatar(
                                    foregroundImage:
                                        Image.asset(Config.profilePhoto).image,
                                    backgroundColor: Colors.grey.shade200,
                                    radius: 48,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: VerticalDivider(
                                    thickness: 0.2,
                                    indent: Config.contentSize * 0.035,
                                    endIndent: Config.contentSize * 0.035,
                                    color: Config.bodyLineColor,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _profileTextWidget(
                                        '${Config.titleName} : ${Config.profileName}'),
                                    _profileTextWidget(
                                        '${Config.titleBirthDate} : ${Config.profileBirthDate}'),
                                    _profileTextWidget(
                                        '${Config.titleResidence} : ${Config.profileResidence}'),
                                    _profileTextWidget(
                                        Config.profileEmail, 12, true),
                                    _linkButton('assets/github.svg',
                                        Config.profileGithub),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: (Config.contantsWidth) * 0.3,
                            height: Config.contentSize * 0.17,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _profileSkills(skills),
                                _profileTextWidget(Config.profileAboutMe, 15),
                                Divider(
                                  thickness: 0.5,
                                  indent: Config.contentSize * 0.01,
                                  endIndent: Config.contentSize * 0.01,
                                  color: Config.bodyLineColor,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: (Config.contantsWidth) * 0.38,
                      height: Config.contentSize * 0.55,
                      child: Column(
                        children: [
                          _text(Config.titlePortfolio, Config.fontColor),
                          Container(
                            width: (Config.contantsWidth) * 0.38,
                            height: Config.contentSize * 0.3,
                            margin: const EdgeInsets.only(top: 15),
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5.0,
                                crossAxisSpacing: 5.0,
                                childAspectRatio: 2 / 0.6,
                              ),
                              itemCount: projects.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: _portfolioButton(
                                    index,
                                    projects[index].icon,
                                    projects[index].title,
                                    projects[index].stack.toString(),
                                  ),
                                );
                              },
                            ),
                          ),
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: FittedBox(
                                    child: _text(Config.titleExperience,
                                        Config.fontColor),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 0.5,
                                    color: Config.bodyLineColor,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: (Config.contantsWidth) * 0.38,
                            height: Config.contentSize * 0.15,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 5.0,
                                crossAxisSpacing: 5.0,
                                childAspectRatio: 4 / 4,
                              ),
                              padding: const EdgeInsets.only(top: 10),
                              itemCount: experiences.length,
                              itemBuilder: (context, index) {
                                return _experienceTile(
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
                        ],
                      ),
                    ),
                    _linkOpen('Github Source, HYOMIN CHOI',
                        'https://github.com/pshyomin/pshyomin.github.io', 8),
                  ],
                ),
              ),
              Container(
                width: (Config.contantsWidth) * 0.6,
                height: Config.contentSize,
                decoration: BoxDecoration(
                  color: Config.backGroundSubColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                child: Detail(
                  icon: projects[selectedIndex].icon,
                  title: projects[selectedIndex].title,
                  project: projects[selectedIndex].project,
                  stackTags: projects[selectedIndex].stack!,
                  github: projects[selectedIndex].github,
                  google: projects[selectedIndex].google,
                  apple: projects[selectedIndex].apple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _linkButton(String svgAsset, String url) {
    return IconButton(
      onPressed: () => _openUrl(url),
      icon: SvgPicture.asset(
        svgAsset,
      ),
    );
  }

  Widget _link2Button(String svgAsset, String url) {
    return MaterialButton(
      onPressed: () => _openUrl(url),
      color: Colors.grey.shade100,
      padding: const EdgeInsets.all(3),
      elevation: 0.0,
      hoverElevation: 0.2,
      shape: const CircleBorder(),
      child: SvgPicture.asset(
        svgAsset,
        width: 21,
        height: 18,
      ),
    );
  }

  Widget _profileSkills(List<String> skills) {
    return Wrap(
      children: skills
          .map(
            (e) => _tagTile(e),
          )
          .toList(),
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

  Widget _profileTextWidget(String text,
      [double size = 12, bool email = false]) {
    return email == false
        ? RichText(
            text: TextSpan(
              text: text,
              style: TextStyle(
                color: Config.fontColor,
                fontSize: size,
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
              ),
            ),
          )
        : _profileEmail(text, size);
  }

  Widget _profileEmail(String email, double size) {
    return RichText(
      text: TextSpan(
        text: '${Config.titleEmail} : ',
        style: TextStyle(
          color: Config.fontColor,
          fontSize: size,
          fontWeight: FontWeight.w500,
          letterSpacing: 2,
        ),
        children: <TextSpan>[
          TextSpan(
            text: email,
            style: TextStyle(
              color: Config.fontColor,
              decoration: TextDecoration.underline,
              fontSize: size,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                String? encodeQueryParameters(Map<String, String> params) {
                  return params.entries
                      .map((MapEntry<String, String> e) =>
                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                      .join('&');
                }

                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: email,
                  query: encodeQueryParameters(<String, String>{
                    'subject': Config.emailSubject,
                  }),
                );

                if (!await launchUrl(emailLaunchUri)) {
                  throw Exception();
                }
              },
          ),
        ],
      ),
    );
  }

  Widget _portfolioButton(int index, Widget icon,
      [String title = 'title', String stackTag = 'tags']) {
    bool isSelected = index == selectedIndex ? true : false;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected == true
              ? Config.lineSelectColor
              : Config.lineNotSelectColor,
          width: isSelected == true ? 2.0 : 0.5,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            margin: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 145,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    style: TextStyle(
                      color: Config.fontColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: stackTag
                            .replaceFirst('[', '')
                            .replaceFirst(']', ''),
                        style: TextStyle(
                          color: Config.fontColor,
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2,
                        ),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _experienceTile(Widget icon, String title, String contents,
      String dateTime, List<String> stacks,
      [String googleUrl = '', String appleUrl = '']) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Config.lineNotSelectColor, width: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _text(contents, Config.fontLightColor, 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 14,
                height: 14,
                margin: const EdgeInsets.only(right: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade200,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: icon,
                ),
              ),
              _text(title, Config.fontTitleColor, 14),
            ],
          ),
          _text(dateTime, Config.fontLightColor, 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _experienceStacks(stacks),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    googleUrl == ''
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                            child: _link2Button(
                                'assets/Google_Play.svg', googleUrl),
                          ),
                    appleUrl == ''
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                            child: _link2Button('assets/Apple.svg', appleUrl),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tagTile(String text) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade200,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Config.fontColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _tagExperience(String text) {
    return Container(
      margin: const EdgeInsets.fromLTRB(3, 0, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 10,
            color: Config.fontLightColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _linkOpen(String title, String link, double size) {
    return RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(
          color: Config.fontLightColor,
          decoration: TextDecoration.underline,
          fontSize: size,
          fontWeight: FontWeight.w500,
          letterSpacing: 2,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () async {
            final url = Uri.parse(link);
            if (!await launchUrl(url)) {
              throw Exception('$url');
            }
          },
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
