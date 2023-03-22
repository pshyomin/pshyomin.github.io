import 'package:flutter/material.dart';

import '../../../../../utils/calculator/layout_manager.dart';

class CalculatorNumButton extends StatelessWidget {
  final ValueChanged<String> onPressButton;
  final String number;
  final LayoutManager layoutManager;
  final Color background;
  final TextStyle textStyle;
  const CalculatorNumButton(
      {Key? key,
      required this.number,
      required this.layoutManager,
      required this.background,
      required this.textStyle,
      required this.onPressButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isHover = false;
    return Container(
      padding: const EdgeInsets.all(3),
      width: number != '0'
          ? layoutManager.getWidth(0.23)
          : layoutManager.getWidth(0.46),
      height: layoutManager.getLayoutHeight(0.12),
      child: number != '0'
          ? ElevatedButton(
              onPressed: () {
                onPressButton(number);
              },
              onHover: (value) {
                isHover = value;
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
                backgroundColor: isHover == false ? background : Colors.black12,
              ),
              child: Text(
                number,
                style: textStyle,
              ),
            )
          : ElevatedButton(
              onPressed: () {
                onPressButton(number);
              },
              onHover: (value) {
                isHover = value;
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                padding: const EdgeInsets.all(8),
                backgroundColor: isHover == false ? background : Colors.black12,
              ),
              child: Container(
                width: layoutManager.getWidth(0.27),
                alignment: Alignment.centerLeft,
                child: Text(
                  number,
                  style: textStyle,
                ),
              ),
            ),
    );
  }
}
