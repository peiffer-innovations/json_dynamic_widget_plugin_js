import 'package:jsf/jsf.dart';

import 'utils.dart';

class JsService {
  JsService._internal() {
    _jsRuntime = JsRuntime();
  }

  static final JsService instance = JsService._internal();

  late final JsRuntime _jsRuntime;

  dynamic evaluate(String command) {
    final result = _jsRuntime.eval(command);
    return stringToDartType(result);
  }
}
