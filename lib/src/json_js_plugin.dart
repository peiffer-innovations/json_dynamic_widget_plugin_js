import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'components/functions/js/js.dart';

class JsonJsPlugin {
  static void bind(JsonWidgetRegistry registry) {
    registry.registerFunction(JsFunction.key, JsFunction.body);
  }
}
