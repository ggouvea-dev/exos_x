import 'package:exos_utils/exos_utils.dart';
import 'package:test/test.dart';

void main() {
  group('Validate format extension', () {
    final date = DateTime(2022, 12, 01, 10, 5, 25);

    test('Validate ddMMyyyy', () {
      final formatedDate = date.format(DateTimeFormat.ddMMyyyy);
      expect(formatedDate, '01/12/2022');
    });
    test('Validate ddMMyyyy with time ( hour, minute, second )', () {
      final formatedDate = date.format(DateTimeFormat.ddMMyyyy, includeTime: true);
      expect(formatedDate, '01/12/2022 10:05:25');
    });
    test('Validate yyyyMMdd', () {
      final formatedDate = date.format(DateTimeFormat.yyyyMMdd);
      expect(formatedDate, '2022/12/01');
    });
    test('Validate yyyyMMdd with time ( hour, minute, second )', () {
      final formatedDate = date.format(DateTimeFormat.yyyyMMdd, includeTime: true);
      expect(formatedDate, '2022/12/01 10:05:25');
    });
    test('Validate yyyyddMM', () {
      final formatedDate = date.format(DateTimeFormat.yyyyddMM);
      expect(formatedDate, '2022/01/12');
    });
    test('Validate yyyyddMM with time ( hour, minute, second )', () {
      final formatedDate = date.format(DateTimeFormat.yyyyddMM, includeTime: true);
      expect(formatedDate, '2022/01/12 10:05:25');
    });
  });
  group('Validate parseBrDate', () {
    final validDate = '01/12/2022';
    final invalidDate = '01/15/2022 10:05';
    test('Validate valid date', () {
      final parsedDate = parseBrDate(validDate);
      expect(parsedDate, DateTime(2022, 12, 01));
    });
    test('Should throw formatException', () {
      expect(() => parseBrDate(invalidDate), throwsFormatException);
    });
  });
  group('Validate parseBrDateTime', () {
    final validDate = '01/12/2022 10:05:25';
    final invalidDate = '01/15/2022 10:05';
    test('Validate valid date', () {
      final parsedDate = parseBrDateTime(validDate);
      expect(parsedDate, DateTime(2022, 12, 01, 10, 5, 25));
    });
    test('Should throw exception', () {
      expect(() => parseBrDateTime(invalidDate), throwsFormatException);
    });
  });
}
