/// Parses a [String] returned from JSF into a corresponding Dart type.
///
/// This function attempts to convert JS-like string values into
/// appropriate Dart native types:
///
/// - `"true"` / `"false"` → `bool`
/// - `"123"` → `int`
/// - `"45.67"` → `double`
/// - `"null"` / `"undefined"` / `null` → `null`
///
/// All other values are returned as-is (i.e., as [String]).
///
/// ### Examples:
/// ```dart
/// stringToDartType("true");        // -> true (bool)
/// stringToDartType("123");         // -> 123 (int)
/// stringToDartType("45.6");        // -> 45.6 (double)
/// stringToDartType("null");        // -> null
/// stringToDartType("undefined");   // -> null
/// stringToDartType("hello");       // -> "hello" (String)
/// ```
///
/// [input] The string to parse, possibly `null`.
///
/// Returns a Dart value of type `bool`, `int`, `double`, `null`, or `String`.
dynamic stringToDartType(String? input) {
  if (input == null || input.trim().toLowerCase() == 'undefined') {
    return null;
  }

  final lower = input.trim().toLowerCase();

  // Parse boolean
  if (lower == 'true') return true;
  if (lower == 'false') return false;

  // Parse null
  if (lower == 'null') return null;

  // Parse int
  final intVal = int.tryParse(input);
  if (intVal != null) return intVal;

  // Parse double
  final doubleVal = double.tryParse(input);
  if (doubleVal != null) return doubleVal;

  // Default: return as-is (string)
  return input;
}
