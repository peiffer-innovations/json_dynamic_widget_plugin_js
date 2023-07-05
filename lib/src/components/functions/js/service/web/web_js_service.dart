@JS()
library js;

import 'dart:js_interop';

import 'package:js/js_util.dart' as js_util;

import '../js_service.dart';

@JS('window.eval')
external dynamic eval(dynamic arg);

final JsService instance = WebJsService();

class WebJsService implements JsService {
  @override
  dynamic evaluate(String command) {
    var result = eval(command);
    if (isPromise(result)) {
      result = js_util.promiseToFuture(result);
    }
    return result;
  }

  bool isPromise(dynamic jsValue) {
    return js_util.typeofEquals(jsValue, 'object') &&
        js_util.hasProperty(jsValue, 'then') &&
        js_util.getProperty(jsValue, 'then') is Function;
  }
}
