import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seo/seo.dart';

import 'pages/portfolio/web/main.dart' as web;
import 'pages/portfolio/mobile/main.dart' as mobile;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HYOMIN CHOI (Flutter Developer Portfolio)',
        theme: ThemeData(
          fontFamily: 'NotoSansKR',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.blue,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => (MediaQuery.of(context).size.width < 600)
              ? const mobile.Main()
              : const web.Main(),
        },
      ),
    );
  }
}
