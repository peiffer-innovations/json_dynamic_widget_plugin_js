import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_js/src/components/functions/js/service/js_service.dart';

/// The `js` function allows to execute the JavaScript code.
/// The JavaScript code is passed in a string as the first argument of args.
/// The function returns the Future in case of a Promise or it
/// throws an exception in case of an error.
class JsFunction {
  static const JsonWidgetFunction body = _body;
  static const key = 'js';

  static String _body({
    required List<dynamic>? args,
    required JsonWidgetRegistry registry,
  }) {
    {
      try {
        return JsService.instance.evaluate(args?[0] ?? '');
      } catch (e) {
        throw Exception('Error evaluating JS: $e');
      }
    }
  }
}
