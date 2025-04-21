import 'package:flutter_test/flutter_test.dart';
import 'package:json_dynamic_widget_plugin_js/src/components/functions/js/service/utils.dart';

void main() {
  group('stringToDartType', () {
    test('converts undefined to null', () {
      expect(stringToDartType('undefined'), null);
      expect(stringToDartType('UNDEFINED'), null);
      expect(stringToDartType('  undefined  '), null);
    });

    test('handles null input', () {
      expect(stringToDartType(null), null);
    });

    test('converts boolean strings', () {
      expect(stringToDartType('true'), true);
      expect(stringToDartType('TRUE'), true);
      expect(stringToDartType('false'), false);
      expect(stringToDartType('FALSE'), false);
    });

    test('converts null string', () {
      expect(stringToDartType('null'), null);
      expect(stringToDartType('NULL'), null);
    });

    test('converts integer strings', () {
      expect(stringToDartType('123'), 123);
      expect(stringToDartType('-456'), -456);
      expect(stringToDartType('0'), 0);
    });

    test('converts double strings', () {
      expect(stringToDartType('123.45'), 123.45);
      expect(stringToDartType('-456.78'), -456.78);
      expect(stringToDartType('0.0'), 0.0);
    });

    test('keeps non-convertible strings as-is', () {
      expect(stringToDartType('hello'), 'hello');
      expect(stringToDartType('123abc'), '123abc');
      expect(stringToDartType('  spaced  '), '  spaced  ');
    });
  });
}
