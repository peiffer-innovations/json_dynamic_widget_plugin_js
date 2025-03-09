@JS()
library;

import 'dart:js_interop';

import '../js_service.dart';

@JS('window.eval')
external JSAny? eval(String arg);

final JsService instance = WebJsService();

class WebJsService implements JsService {
  @override
  dynamic evaluate(String command) {
    final jsResult = eval(command);
    if (jsResult == null) {
      return null;
    }
    return jsResult.dartify();
  }
}
