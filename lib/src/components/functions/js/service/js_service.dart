import 'package:jsf/jsf.dart';

class JsService {
  JsService._internal() {
    _jsRuntime = JsRuntime();
  }

  static final JsService instance = JsService._internal();

  late final JsRuntime _jsRuntime;

  String evaluate(String command) {
    final result = _jsRuntime.eval(command);
    return result;
  }
}
