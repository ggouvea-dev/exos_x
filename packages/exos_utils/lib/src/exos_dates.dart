extension Dates on DateTime {
  String format(DateTimeFormat dateTimeFormat, {separator = "/", includeTime = false}) {
    final day = _safeIntToString(this.day);
    final month = _safeIntToString(this.month);
    late String result;
    switch (dateTimeFormat) {
      case DateTimeFormat.ddMMyyyy:
        result = '$day$separator$month$separator$year';
        break;
      case DateTimeFormat.yyyyMMdd:
       result = '$year$separator$month$separator$day';
       break;
      case DateTimeFormat.yyyyddMM:
        result = '$year$separator$day$separator$month';
        break;
    }
    if (!includeTime) return result;
    return result + _getTime();
  }

  String _safeIntToString(int value) {
    return value >= 10 ? value.toString() : '0$value';
  }

  String _getTime() {
    final hour = _safeIntToString(this.hour);
    final minute = _safeIntToString(this.minute);
    final second = _safeIntToString(this.second);

    return ' $hour:$minute:$second';
  }
}

enum DateTimeFormat {
  ddMMyyyy,
  yyyyMMdd,
  yyyyddMM
}