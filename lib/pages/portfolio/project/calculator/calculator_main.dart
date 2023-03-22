import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/calculator/calculator_cubit.dart';
import 'calculator_app.dart';
import 'calculator_observer.dart';

class CalculatorMain extends StatelessWidget {
  const CalculatorMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Bloc.observer = CalculatorObserver();
    return BlocProvider(
      create: (_) => CalculatorCubit(),
      child: const Calculator(),
    );
  }
}
