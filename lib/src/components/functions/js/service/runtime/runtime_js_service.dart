import 'package:flutter_js/flutter_js.dart';

import '../js_service.dart';

final JsService instance = RuntimeJsService();

class RuntimeJsService implements JsService {
  final JavascriptRuntime _jsRuntime = getJavascriptRuntime();

  @override
  dynamic evaluate(String command) {
    final runtimeJsResult = _jsRuntime.evaluate(command);
    var result = runtimeJsResult.rawResult;
    if (runtimeJsResult.isPromise) {
      result = _jsRuntime
          .handlePromise(runtimeJsResult)
          .then((value) => value.rawResult);
    }
    if (runtimeJsResult.isError) {
      throw Exception(runtimeJsResult.rawResult);
    }
    return result;
  }
}
