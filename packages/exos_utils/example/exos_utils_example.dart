import 'package:exos_utils/exos_utils.dart';

void main() {
  // To use this esxtension simply import the package
  // and then use the new provided method ".format()"
  // The DateTimeFormat is required
  final date = DateTime(2022, 12, 01, 10, 5, 25);
  // By default it does not display time
  print(date.format(DateTimeFormat.yyyyMMdd, separator: '-'));
  // The only option rigth now for time is HH:mm:ss
  print(date.format(DateTimeFormat.yyyyMMdd, separator: '-', includeTime: true));
  //Default separator is '/'
  print(date.format(DateTimeFormat.yyyyMMdd));
  //Not sure who will use like that, but here is...
  print(date.format(DateTimeFormat.yyyyddMM));
  // Example as 01/12/2022
  print(date.format(DateTimeFormat.ddMMyyyy));
}
