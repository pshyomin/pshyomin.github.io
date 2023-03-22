import 'package:bloc/bloc.dart';

class CalculatorCubit extends Cubit<String> {
  CalculatorCubit() : super('');

  String num1 = '0';
  String num2 = '0';
  String _operand = '';
  String _result = '';

  bool isResult = false;

  void refresh() => emit(output);

  String get output => _result == '' ? equation : _result;
  String get equation =>
      isResult == false ? (num1 != '0' ? num1 : '') : (num2 != '0' ? num2 : '');

  void manager(String text) {
    if (text == 'AC' || text == '±' || text == '%' || text == '.') {
      function(text);
    } else if (text == '+' ||
        text == '-' ||
        text == 'x' ||
        text == '÷' ||
        text == '=') {
      operand(text);
    } else {
      integer(text);
    }
  }

  void function(String text) {
    if (num1 == '0') {
      return;
    }
    if (_result != '') {
      condense();
    }

    if (text == 'AC') {
      ac();
    } else if (text == '±') {
      sign();
    } else if (text == '%') {
      percent();
    } else if (text == '.') {
      decimal();
    }
    isResult = false;
    refresh();
  }

  void operand(String text) {
    if (num1 == '0') {
      return;
    }
    if (text == '=') {
      return calculator();
    }
    if (_result != '') {
      condense();
    }

    _operand = text;
    isResult = true;
    refresh();
  }

  void integer(String text) {
    if (_operand == '' && !isResult) {
      num1 = (num1 == '0') ? text : num1 + text;
    } else {
      num2 = (num2 == '0') ? text : num2 + text;
    }
    refresh();
  }

  void ac() {
    num1 = '0';
    num2 = '0';
    _operand = '';
    _result = '';
    isResult = false;
    refresh();
  }

  void percent() {
    if (num2 != '0' && !num2.contains('.')) {
      num2 = (double.parse(num2) / 100).toString();
    } else if (num1 != '0' && !num1.contains('.')) {
      num1 = (double.parse(num1) / 100).toString();
    }
    refresh();
  }

  void sign() {
    if (num2 != '0') {
      num2 = (num2.contains('-') ? num2.substring(1) : '-$num2');
    } else if (num1 != '0') {
      num1 = (num1.contains('-') ? num1.substring(1) : '-$num1');
    }
    refresh();
  }

  void decimal() {
    if (num2 != '0' && !num2.contains('.')) {
      num2 = '$num2.';
    } else if (num1 != '0' && !num1.contains('.')) {
      num1 = '$num1.';
    }
    refresh();
  }

  void condense() {
    num1 = state;
    num2 = '0';
    _result = '';
    _operand = '';
    isResult = true;
    refresh();
  }

  void calculator() {
    double? result;

    if (_operand == '' || num2 == '0') {
      return;
    }

    if (_operand == '+') {
      result = (double.parse(num1) + double.parse(num2));
    } else if (_operand == '-') {
      result = (double.parse(num1) - double.parse(num2));
    } else if (_operand == 'x') {
      result = (double.parse(num1) * double.parse(num2));
    } else if (_operand == '÷') {
      result = (double.parse(num1) / double.parse(num2));
    }

    String sResult = result.toString();

    while ((sResult.contains('.') && sResult.endsWith('0')) ||
        sResult.endsWith('.')) {
      sResult = sResult.substring(0, sResult.length - 1);
    }

    _result = sResult;
    refresh();
  }
}
