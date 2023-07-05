import 'runtime/runtime_js_service.dart' if (dart.library.html) 'web/web_js_service.dart'
    as js_service;

abstract class JsService {
  dynamic evaluate(String command);

  static JsService Get() {
    return js_service.instance;
  }
}
