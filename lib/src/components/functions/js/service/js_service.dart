import 'package:jsf/jsf.dart';

class JsService {
  JsService._internal() {
    _jsRuntime = JsRuntime();
  }

  static final JsService instance = JsService._internal();

  late final JsRuntime _jsRuntime;

  dynamic evaluate(String command) {
    return _jsRuntime.eval(command);
  }
}
