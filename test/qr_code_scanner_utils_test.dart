import 'package:flutter_test/flutter_test.dart';
import 'package:fa_flutter_ui_kit/src/widgets/qr_code_scanner/qr_utils.dart';

void main() {
  group('extractUPIID', () {
    test('extracts UPI ID from standard URI format', () {
      const input = 'upi://pay?pa=user@bank&pn=User&mc=1234';
      expect(extractUPIID(input), 'user@bank');
    });

    test('extracts UPI ID when it is at the end of the string', () {
      const input = 'upi://pay?pa=user@bank';
      expect(extractUPIID(input), 'user@bank');
    });

    test('returns original string when ?pa= is missing', () {
      const input = 'user@bank';
      expect(extractUPIID(input), 'user@bank');
    });

    test('handles empty UPI ID in URI', () {
      const input = 'upi://pay?pa=&pn=User';
      expect(extractUPIID(input), '');
    });

    test('handles empty UPI ID at end of string', () {
      const input = 'upi://pay?pa=';
      expect(extractUPIID(input), '');
    });

    test('handles parameters before pa correctly', () {
      const input = 'upi://pay?pn=User&pa=user@bank&mc=1234';
      expect(extractUPIID(input), 'user@bank');
    });

    test('handles parameters before pa correctly without following parameters', () {
      const input = 'upi://pay?pn=User&pa=user@bank';
      expect(extractUPIID(input), 'user@bank');
    });

    test('handles malicious input that caused crash previously', () {
      // The crash happened because indexOf('&') was searching from start,
      // finding an ampersand *before* ?pa=, leading to end < start.
      const input = 'upi://pay?foo=bar&pa=user@bank';
      // In old code:
      // start = indexOf('?pa=') + 4 -> points to 'u'
      // end = indexOf('&') -> points to '&' after 'bar'
      // end < start -> crash
      // In new code:
      // start = indexOf('?pa=') + 4 -> points to 'u'
      // end = indexOf('&', start) -> -1
      // returns substring(start) -> 'user@bank'
      expect(extractUPIID(input), 'user@bank');
    });

    test('handles multiple pa parameters (takes first)', () {
      const input = 'upi://pay?pa=first@bank&pa=second@bank';
      expect(extractUPIID(input), 'first@bank');
    });

    test('handles no query parameters at all', () {
      const input = 'upi://pay';
      expect(extractUPIID(input), 'upi://pay');
    });
  });
}
