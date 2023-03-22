import 'package:flutter/material.dart';
import 'package:portfolio/utils/config.dart';

import 'body.dart';

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
    Config.setisMobile(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: Config.contantsWidth,
              height: Config.contentSize,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Container(
                width: Config.contantsWidth - 5,
                height: Config.contentSize - 5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Config.bodyLineColor,
                    width: 10,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Body(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
