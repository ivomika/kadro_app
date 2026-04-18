import 'package:html/parser.dart';

String plainTextFromHtml(String value) {
  final document = parse(value);
  return document.body?.text ?? value;
}
