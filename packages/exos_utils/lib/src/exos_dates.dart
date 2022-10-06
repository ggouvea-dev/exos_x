
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

DateTime parseBrDate(String brDate) {
  assert(brDate.contains('/'));
  final splitedDate =_splitBrDate(brDate);
  assert(!splitedDate[2].contains(':'));
  assert(int.parse(splitedDate[1]) <= 12);
  final day = int.parse(splitedDate[0]);
  final month = int.parse(splitedDate[1]);
  final year = int.parse(splitedDate[2]);
  return DateTime(year, month, day);
}

DateTime parseBrDateTime(String brDate) {
  assert(brDate.contains('/') && brDate.contains(':'));
  final splitedDate = _splitBrDateTime(brDate);
  final date = splitedDate[0].split('/');
  final time = splitedDate[1].split(':');
  assert(time.length >= 3);
  final day = int.parse(date[0]);
  final month = int.parse(date[1]);
  final year = int.parse(date[2]);
  final hour = int.parse(time[0]);
  final minute = int.parse(time[1]);
  final second = int.parse(time[2]);
  return DateTime(year, month, day, hour, minute, second);
}

List<String> _splitBrDate(String brDate) {
  final splitedDate = brDate.split('/');
  assert(splitedDate.length == 3);
  return splitedDate;
}

List<String> _splitBrDateTime(String dateTime) {
  final splitedDate = dateTime.split(' ');
  assert(splitedDate.length == 2);
  return splitedDate;
}