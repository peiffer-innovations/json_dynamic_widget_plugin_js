@JS()
library;

import 'dart:js_interop';
import 'package:js/js_util.dart' as js_util;
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
    dynamic result;
    if (isPromise(jsResult)) {
      result = js_util.promiseToFuture(jsResult);
    } else {
      result = jsResult.dartify();
    }
    return result;
  }

  bool isPromise(dynamic jsValue) {
    return js_util.typeofEquals(jsValue, 'object') &&
        js_util.hasProperty(jsValue, 'then') &&
        js_util.getProperty(jsValue, 'then') is Function;
  }
}
