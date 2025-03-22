import 'package:test/test.dart';

void main() {
  test("Regex text hilight", () {
    String a = "this is {{A}} sample {{text}} ...";

    var allMatches = RegExp("{{(.*?)}}").allMatches(a);

    var parts = a.split(RegExp("{{(.*?)}}"));

    for (int i = 0; i < allMatches.length; i++) {
      int newIndex = 2 * i + 1;

      String? newDelimiter = allMatches.elementAt(i).group(0);

      if (newDelimiter != null) {
        parts.insert(newIndex, newDelimiter);
      }
    }

    print(parts);
    expect(parts.length, 5);
  });
}
