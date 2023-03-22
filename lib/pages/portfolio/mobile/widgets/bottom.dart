import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/config.dart';
import '../../../../utils/layout_manager.dart';

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LayoutManager layoutManager = LayoutManager(MediaQuery.of(context));
    return FittedBox(
      child: Container(
        width: layoutManager.getWidth(1),
        height: layoutManager.getHeight(0.05),
        alignment: Alignment.center,
        child: _linkOpen('Github Source, HYOMIN CHOI',
            'https://github.com/pshyomin/pshyomin.github.io', 10),
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
}
