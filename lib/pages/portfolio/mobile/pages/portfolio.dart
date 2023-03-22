import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../models/portfolio/portfolio_model.dart' as model;
import '../../../../utils/config.dart';
import '../../../../utils/layout_manager.dart';

class Portfolio extends StatelessWidget {
  Portfolio({Key? key}) : super(key: key);

  final List<model.Portfolio> projects = Config.portfolios;

  @override
  Widget build(BuildContext context) {
    LayoutManager layoutManager = LayoutManager(MediaQuery.of(context));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: _text(Config.titlePortfolio, Config.fontColor),
        ),
        Container(
          width: layoutManager.width,
          height: projects.length * 120,
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => projects[index].project),
                  );
                },
                child: _portfolioButton(
                  layoutManager,
                  index,
                  projects[index].icon,
                  projects[index].title,
                  projects[index].stack.toString(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _portfolioButton(LayoutManager layoutManager, int index, Widget icon,
      [String title = 'title', String stackTag = 'tags']) {
    return Container(
      width: layoutManager.getWidth(0.9),
      height: 80,
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Config.lineSelectColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: icon,
            ),
          ),
          Expanded(
            child: Container(
              width: layoutManager.getWidth(0.62),
              margin: const EdgeInsets.fromLTRB(10, 0, 3, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textTitle(title),
                  RichText(
                    text: TextSpan(
                      text:
                          stackTag.replaceFirst('[', '').replaceFirst(']', ''),
                      style: TextStyle(
                        color: Config.fontColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                      ),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textTitle(String text) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        color: Config.fontColor,
        fontSize: 21,
        fontWeight: FontWeight.w700,
        letterSpacing: 2,
      ),
      overflow: TextOverflow.ellipsis,
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
}
