import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/config.dart';
import '../../../../utils/layout_manager.dart';

class AboutMe extends StatelessWidget {
  AboutMe({Key? key}) : super(key: key);

  final List<String> skills = Config.skills;

  @override
  Widget build(BuildContext context) {
    LayoutManager layoutManager = LayoutManager(MediaQuery.of(context));
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: layoutManager.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: SizedBox(
              width: layoutManager.width,
              child: Column(
                children: [
                  _text(Config.titleAboutMe, Config.fontColor),
                  Container(
                    width: layoutManager.width,
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 68,
                          backgroundColor: Config.bodyLineColor,
                          child: CircleAvatar(
                            foregroundImage:
                                Image.asset(Config.profilePhoto).image,
                            backgroundColor: Colors.grey.shade200,
                            radius: 64,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: _profileTextWidget(
                                      '${Config.titleName} : ${Config.profileName}',
                                      16),
                                ),
                                FittedBox(
                                  child: _profileTextWidget(
                                      '${Config.titleBirthDate} : ${Config.profileBirthDate}',
                                      16),
                                ),
                                FittedBox(
                                  child: _profileTextWidget(
                                      '${Config.titleResidence} : ${Config.profileResidence}',
                                      16),
                                ),
                                FittedBox(
                                  child: _profileTextWidget(
                                      Config.profileEmail, 16, true),
                                ),
                                Container(
                                  width: layoutManager.getWidth(0.58),
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _linkButton('assets/github.svg',
                                          Config.profileGithub),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Divider(
                            thickness: 0.2,
                            indent: layoutManager.getWidth(0.07),
                            endIndent: layoutManager.getWidth(0.07),
                            color: Config.bodyLineColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: layoutManager.getWidth(0.65),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          child: _profileSkills(skills),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: _profileTextWidget(Config.profileAboutMe, 15),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: Divider(
                            thickness: 0.5,
                            indent: layoutManager.getWidth(0.05),
                            endIndent: layoutManager.getWidth(0.05),
                            color: Config.bodyLineColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
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

  Widget _profileSkills(List<String> skills) {
    return Wrap(
      children: skills
          .map(
            (e) => _tagTile(e),
          )
          .toList(),
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

  Widget _linkButton(String svgAsset, String url) {
    return IconButton(
      iconSize: 32,
      onPressed: () => _openUrl(url),
      icon: SvgPicture.asset(
        svgAsset,
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
