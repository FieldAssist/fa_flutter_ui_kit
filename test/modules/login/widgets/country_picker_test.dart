import 'package:fa_flutter_ui_kit/src/modules/login/widgets/country_picker.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/stream_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// The picker reads its countries from a real asset, which only loads while
/// the test runs real async work.
Future<void> _pumpUntilCountriesLoad(WidgetTester tester) async {
  for (var i = 0;
      i < 40 && find.byType(StreamLoadingWidget).evaluate().isNotEmpty;
      i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 50)),
    );
    await tester.pump();
  }
}

void main() {
  testWidgets(
      'CountryPicker: country name missing from the list → shows the '
      'default +91 country', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: CountryPicker(selectedCountryName: 'DRC(USD)')),
      ),
    );

    await _pumpUntilCountriesLoad(tester);

    expect(find.text('India'), findsOneWidget);
    expect(find.text('+91'), findsOneWidget);
  });
}
