import 'package:intl/intl.dart';

final class UIFormatter {
  static const String placeholder = '—';

  const UIFormatter._();

  static String display<T>(
    T? value, {
    String placeholder = UIFormatter.placeholder,
    bool Function(T value)? isAbsent,
    String Function(T value)? formatter,
  }) {
    if (value == null) {
      return placeholder;
    }

    if (_isDefaultAbsent(value) || (isAbsent?.call(value) ?? false)) {
      return placeholder;
    }

    final result = formatter?.call(value) ?? value.toString();
    return result.trim().isEmpty ? placeholder : result;
  }

  static String joinNonEmpty(
    Iterable<String> values, {
    int? take,
    String separator = ', ',
    String placeholder = UIFormatter.placeholder,
  }) {
    final filtered = values
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty);

    final visibleValues = take == null
        ? filtered.toList(growable: false)
        : filtered.take(take).toList(growable: false);

    if (visibleValues.isEmpty) {
      return placeholder;
    }

    return visibleValues.join(separator);
  }

  static String positiveNumber<T extends num>(
    T? value, {
    String placeholder = UIFormatter.placeholder,
    String suffix = '',
    String Function(T value)? formatter,
  }) {
    return display(
      value,
      placeholder: placeholder,
      isAbsent: (value) => value <= 0,
      formatter: (value) {
        final text = formatter?.call(value) ?? value.toString();
        return '$text$suffix';
      },
    );
  }

  static String signedNumber<T extends num>(
    T? value, {
    String placeholder = UIFormatter.placeholder,
    Set<num> absentValues = const {0, -1},
    String Function(T value)? formatter,
  }) {
    return display(
      value,
      placeholder: placeholder,
      isAbsent: (value) => absentValues.contains(value),
      formatter: (value) {
        final text = formatter?.call(value) ?? value.toString();
        return value > 0 ? '+$text' : text;
      },
    );
  }

  static String percent(
    double? value, {
    int fractionDigits = 1,
    String suffix = '%',
    String placeholder = UIFormatter.placeholder,
    bool Function(double value)? isAbsent,
  }) {
    return display(
      value,
      placeholder: placeholder,
      isAbsent: isAbsent,
      formatter: (value) =>
          '${(value * 100).toStringAsFixed(fractionDigits)}$suffix',
    );
  }

  static String date(
    int? year,
    int? month,
    int? day, {
    String pattern = 'yyyy-MM-dd',
    String? locale,
    String placeholder = UIFormatter.placeholder,
  }) {
    if (year == null || month == null || day == null) {
      return placeholder;
    }

    try {
      final parsedDate = DateTime(year, month, day);
      if (parsedDate.year != year ||
          parsedDate.month != month ||
          parsedDate.day != day) {
        return placeholder;
      }

      return DateFormat(pattern, locale).format(parsedDate);
    } catch (_) {
      return placeholder;
    }
  }

  static bool _isDefaultAbsent<T>(T value) {
    return switch (value) {
      String text => text.trim().isEmpty,
      Iterable<Object?> items => items.isEmpty,
      _ => false,
    };
  }
}
