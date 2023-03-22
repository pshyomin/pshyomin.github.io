import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/config.dart';

// ignore: must_be_immutable
class Detail extends StatelessWidget {
  late Widget icon;
  late String title;
  late Widget project;
  late List<String> stackTags;
  late String? github;
  late String? google;
  late String? apple;
  Detail(
      {Key? key,
      required this.icon,
      required this.title,
      required this.project,
      required this.stackTags,
      this.github = '',
      this.google = '',
      this.apple = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: (Config.contantsWidth) * 0.55,
          height: 150,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: icon,
                      ),
                    ),
                    SizedBox(
                      height: 64,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Config.fontTitleColor,
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  width: (Config.contantsWidth) * 0.55,
                  height: 40,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    direction: Axis.vertical,
                    spacing: 10,
                    runSpacing: 1,
                    children: stackTags
                        .map(
                          (e) => _tagTile(
                            e,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 360,
          height: 640,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color.fromRGBO(244, 248, 251, 1.0),
              width: 8,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: project,
          ),
        ),
        SizedBox(
          width: (Config.contantsWidth) * 0.4,
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              github != ''
                  ? InkWell(
                      onTap: () => _openUrl(github!),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.all(8),
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                            ),
                          ],
                          color: const Color.fromRGBO(255, 255, 255, 1.0),
                        ),
                        child: SvgPicture.asset(
                          'assets/github.svg',
                        ),
                      ),
                    )
                  : Container(),
              google != ''
                  ? InkWell(
                      onTap: () => _openUrl(google!),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.all(8),
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                            ),
                          ],
                          color: const Color.fromRGBO(255, 255, 255, 1.0),
                        ),
                        child: SvgPicture.asset(
                          'assets/Google_Play.svg',
                        ),
                      ),
                    )
                  : Container(),
              apple != ''
                  ? InkWell(
                      onTap: () => _openUrl(apple!),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.all(8),
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                            ),
                          ],
                          color: const Color.fromRGBO(255, 255, 255, 1.0),
                        ),
                        child: SvgPicture.asset(
                          'assets/Apple.svg',
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tagTile(String tagname) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade200,
      ),
      child: Text(
        tagname,
        style: TextStyle(
          color: Config.fontColor,
          fontWeight: FontWeight.w400,
        ),
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
