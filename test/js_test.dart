import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_js/json_dynamic_widget_plugin_js.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('should return valid JS code execution result', () async {
    JsonJsPlugin.bind(JsonWidgetRegistry.instance);
    final result =
        JsonWidgetRegistry.instance.processArgs('\${js("1 + 1;")}', {});
    expect(result.value, 2);
  });
}
