import 'package:flutter/foundation.dart';
import 'package:json_dynamic_widget_plugin_js/src/components/functions/js/service/js_service.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart' as app;

// Usage: flutter drive --driver=integration_test/driver.dart --target=integration_test/js_service_test.dart -d linux

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  printDebugDivider();

  group('JS_Service Tests', () {
    setUpAll(() async {
      app.main();
      printDebugInfo("");
      printDebugDivider();
    });

    testWidgets('Int Test', (WidgetTester tester) async {
      await tester.pumpAndSettle();
      expect(JsService.instance.evaluate('123'), 123);
      expect(JsService.instance.evaluate('-456'), -456);
      expect(JsService.instance.evaluate('0'), 0);
      expect(JsService.instance.evaluate('123 + 100'), 223);
    });

    testWidgets('BigInt Test', (WidgetTester tester) async {
      await tester.pumpAndSettle();
      expect(
        JsService.instance.evaluate('123456789123456789123456789n * 2n'),
        BigInt.tryParse("246913578246913578246913578"),
      );
      expect(
        JsService.instance.evaluate(
          '(123456789123456789123456789n * 2n).toString()',
        ),
        "246913578246913578246913578",
      );
    });

    testWidgets('Double Test', (WidgetTester tester) async {
      await tester.pumpAndSettle();
      expect(JsService.instance.evaluate('123.45'), 123.45);
      expect(JsService.instance.evaluate('-456.78'), -456.78);
      expect(JsService.instance.evaluate('0.0'), 0.0);
      expect(JsService.instance.evaluate('1.23 + 3.45'), 4.68);
      expect(JsService.instance.evaluate('-1 - 55.5'), -56.5);
    });

    testWidgets('Bool Test', (WidgetTester tester) async {
      await tester.pumpAndSettle();
      expect(JsService.instance.evaluate('true'), true);
      expect(JsService.instance.evaluate('false'), false);
      expect(JsService.instance.evaluate('3 == 3'), true);
      expect(JsService.instance.evaluate('3 == 8'), false);
      expect(JsService.instance.evaluate('true || false'), true);
    });

    testWidgets('String Test', (WidgetTester tester) async {
      await tester.pumpAndSettle();
      expect(JsService.instance.evaluate('"hello"'), 'hello');
      expect(JsService.instance.evaluate('"123abc"'), '123abc');
      expect(JsService.instance.evaluate('"  spaced  "'), '  spaced  ');
    });

    testWidgets('Null Test', (WidgetTester tester) async {
      await tester.pumpAndSettle();
      expect(JsService.instance.evaluate('null'), null);
      expect(JsService.instance.evaluate('undefined'), null);
      expect(JsService.instance.evaluate('  undefined  '), null);
    });
  });

  tearDownAll(() {
    printDebugDivider();
    printDebugInfo("");
  });
}

printDebugInfo(String info) {
  if (kDebugMode) {
    print(info);
  }
}

printDebugDivider() {
  printDebugInfo(
    "---------------------------------------------------------------",
  );
}
