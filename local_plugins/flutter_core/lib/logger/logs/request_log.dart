import 'package:talker/talker.dart';

class RequestLog<T> extends TalkerLog{
  final String url;
  final String method;
  final int number;
  static String get _getKey => 'request_log';
  static AnsiPen get _getPen => AnsiPen()..blue();
  static LogLevel get _getLevel => LogLevel.debug;
  @override
  String? get title => T.toString();
  @override
  String? get key => _getKey;
  @override
  AnsiPen? get pen => _getPen;
  @override
  LogLevel? get logLevel => _getLevel;

  RequestLog({required this.url, required this.method, required this.number})
      : super('Send');

  @override
  String generateTextMessage({TimeFormat timeFormat = TimeFormat.timeAndSeconds}) {
    return '${displayTitleWithTime(timeFormat: timeFormat)}request #$number | $method $url';
  }
}