import 'dart:convert';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_js/json_dynamic_widget_plugin_js.dart';
import 'package:logging/logging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
    if (record.error != null) {
      debugPrint('${record.error}');
    }
    if (record.stackTrace != null) {
      debugPrint('${record.stackTrace}');
    }
  });

  final navigatorKey = GlobalKey<NavigatorState>();

  final registry = JsonWidgetRegistry.instance;
  JsonJsPlugin.bind(registry);

  registry.navigatorKey = navigatorKey;

  final data = JsonWidgetData.fromDynamic(
    json.decode(await rootBundle.loadString('assets/pages/js.json')),
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsWidgetPage(
        data: data,
      ),
      theme: ThemeData.light(),
    ),
  );
}

class JsWidgetPage extends StatelessWidget {
  const JsWidgetPage({
    super.key,
    required this.data,
  });

  final JsonWidgetData data;

  @override
  Widget build(BuildContext context) => data.build(context: context);
}
