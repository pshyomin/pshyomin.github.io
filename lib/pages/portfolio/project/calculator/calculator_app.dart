import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/utils/config.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../blocs/calculator/calculator_cubit.dart';
import '../../../../utils/calculator/layout_manager.dart';
import 'widgets/calculator_num_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    LayoutManager layoutManager = LayoutManager(
      Config.getisMobile() == false ? null : MediaQuery.of(context),
    );

    return Container(
      width: Config.getisMobile() == true ? layoutManager.width : 360,
      height: Config.getisMobile() == true ? layoutManager.height : 640,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          /*actions: [
            _linkButton(
                'assets/github.png', 'https://github.com/pshyomin/calculator'),
          ],*/
        ),
        body: BlocBuilder<CalculatorCubit, String>(
          builder: (context, state) {
            return Column(
              children: <Widget>[
                Container(
                  width: layoutManager.width,
                  height: layoutManager.getLayoutHeight(0.25),
                  margin: const EdgeInsets.fromLTRB(0, 0, 30, 10),
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: layoutManager.width,
                    height: layoutManager.getLayoutHeight(0.2),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomRight,
                      child: Text(
                        state,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorNumButton(
                        number: 'AC',
                        layoutManager: layoutManager,
                        background: Colors.grey,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                      CalculatorNumButton(
                        number: '±',
                        layoutManager: layoutManager,
                        background: Colors.grey,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                      CalculatorNumButton(
                        number: '%',
                        layoutManager: layoutManager,
                        background: Colors.grey,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                      CalculatorNumButton(
                        number: '÷',
                        layoutManager: layoutManager,
                        background: Colors.orange,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorNumButton(
                        number: '7',
                        layoutManager: layoutManager,
                        background: const Color.fromRGBO(31, 31, 31, 1),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                      CalculatorNumButton(
                        number: '8',
                        layoutManager: layoutManager,
                        background: const Color.fromRGBO(31, 31, 31, 1),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                      CalculatorNumButton(
                        number: '9',
                        layoutManager: layoutManager,
                        background: const Color.fromRGBO(31, 31, 31, 1),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                      CalculatorNumButton(
                        number: 'x',
                        layoutManager: layoutManager,
                        background: Colors.orange,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorNumButton(
                        number: '4',
                        layoutManager: layoutManager,
                        background: const Color.fromRGBO(31, 31, 31, 1),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                      CalculatorNumButton(
                        number: '5',
                        layoutManager: layoutManager,
                        background: const Color.fromRGBO(31, 31, 31, 1),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                      CalculatorNumButton(
                        number: '6',
                        layoutManager: layoutManager,
                        background: const Color.fromRGBO(31, 31, 31, 1),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                      CalculatorNumButton(
                        number: '-',
                        layoutManager: layoutManager,
                        background: Colors.orange,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorNumButton(
                        number: '1',
                        layoutManager: layoutManager,
                        background: const Color.fromRGBO(31, 31, 31, 1),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                      CalculatorNumButton(
                        number: '2',
                        layoutManager: layoutManager,
                        background: const Color.fromRGBO(31, 31, 31, 1),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                      CalculatorNumButton(
                        number: '3',
                        layoutManager: layoutManager,
                        background: const Color.fromRGBO(31, 31, 31, 1),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                      CalculatorNumButton(
                        number: '+',
                        layoutManager: layoutManager,
                        background: Colors.orange,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorNumButton(
                        number: '0',
                        layoutManager: layoutManager,
                        background: const Color.fromRGBO(31, 31, 31, 1),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                      CalculatorNumButton(
                        number: '.',
                        layoutManager: layoutManager,
                        background: const Color.fromRGBO(31, 31, 31, 1),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                      CalculatorNumButton(
                        number: '=',
                        layoutManager: layoutManager,
                        background: Colors.orange,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                        onPressButton: (value) {
                          context.read<CalculatorCubit>().manager(value);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _linkButton(String asset, String url) {
    return FittedBox(
      child: IconButton(
        onPressed: () => _openUrl(url),
        iconSize: 64,
        splashRadius: 32,
        icon: Image.asset(
          asset,
          color: Colors.white,
          colorBlendMode: BlendMode.color,
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
