@JS()
library;

import 'dart:js_interop';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:js_util';
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
      result = promiseToFuture(jsResult);
    } else {
      result = jsResult.dartify();
    }
    return result;
  }

  bool isPromise(dynamic jsValue) {
    return typeofEquals(jsValue, 'object') &&
        hasProperty(jsValue, 'then') &&
        getProperty(jsValue, 'then') is Function;
  }
}