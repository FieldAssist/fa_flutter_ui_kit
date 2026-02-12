import 'package:flutter_test/flutter_test.dart';
import 'package:fa_flutter_ui_kit/src/widgets/calendar/date_util.dart';

void main() {
  group('DateUtil', () {
    final util = DateUtil();

    test('yearLength returns 0 for year 0 and negative years', () {
      expect(util.yearLength(0), 0);
      expect(util.yearLength(-1), 0);
      expect(util.yearLength(-2023), 0);
    });

    test('yearLength returns 0 for year 1', () {
      expect(util.yearLength(1), 0);
    });

    test('yearLength returns 365 for year 2', () {
      expect(util.yearLength(2), 365);
    });

    test('yearLength correctly calculates days up to year 5 (including one leap year)', () {
      // Years 1, 2, 3 are 365 days. Year 4 is 366 days.
      // Total = 365 * 3 + 366 = 1095 + 366 = 1461
      expect(util.yearLength(5), 1461);
    });

    test('yearLength correctly handles century non-leap year (1900)', () {
        // Just checking consistency, not manual calculation for this one,
        // rely on the benchmark comparison for extensive checks.
        // But we can check a known range.
        // 1900 is not a leap year.
        // so yearLength(1901) - yearLength(1900) should be 365.
        expect(util.yearLength(1901) - util.yearLength(1900), 365);
    });

    test('yearLength correctly handles century leap year (2000)', () {
        // 2000 is a leap year.
        // so yearLength(2001) - yearLength(2000) should be 366.
        expect(util.yearLength(2001) - util.yearLength(2000), 366);
    });

    test('yearLength correctly handles standard leap year (2024)', () {
      // 2024 is a leap year.
      expect(util.yearLength(2025) - util.yearLength(2024), 366);
    });

    test('yearLength correctly handles standard non-leap year (2023)', () {
      // 2023 is not a leap year.
      expect(util.yearLength(2024) - util.yearLength(2023), 365);
    });
  });
}
