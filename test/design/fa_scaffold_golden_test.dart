@Tags(['golden'])
library;

import 'dart:io';

import 'package:fa_flutter_ui_kit/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Loads the packaged Inter faces so goldens show real glyphs rather than the
/// test harness's fallback.
Future<void> _loadInter() async {
  const weights = {
    'Inter-Regular': FontWeight.w400,
    'Inter-Medium': FontWeight.w500,
    'Inter-SemiBold': FontWeight.w600,
    'Inter-Bold': FontWeight.w700,
  };
  for (final entry in weights.entries) {
    final loader = FontLoader('packages/fa_flutter_ui_kit/Inter')
      ..addFont(
        File('assets/fonts/${entry.key}.ttf')
            .readAsBytes()
            .then(ByteData.sublistView),
      );
    await loader.load();
  }
}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await _loadInter();
  });

  testWidgets('MT 2.0 screen header renders the curved brand backdrop',
      (tester) async {
    tester.view
      ..physicalSize = const Size(375 * 3, 812 * 3)
      ..devicePixelRatio = 3
      ..padding = const FakeViewPadding(top: 36 * 3);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        theme: FaTheme.light(),
        home: FaScaffold(
          header: FaTopNav(
            title: 'Outlet Details',
            actions: [FaNavAction(icon: Icons.call, onTap: () {})],
          ),
          body: const _OutletIdentitySample(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(FaScaffold),
      matchesGoldenFile('goldens/mt_outlet_header.png'),
    );
  });
}

/// Mirrors the identity block the MT activities hub draws, using only kit
/// primitives, so the golden covers how they sit together.
class _OutletIdentitySample extends StatelessWidget {
  const _OutletIdentitySample();

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: colors.surface,
                  shape: BoxShape.circle,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors.canvas,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.storefront_outlined,
                    size: 50,
                    color: colors.textTertiary,
                  ),
                ),
              ),
            ),
            const FaPill(
              label: 'Verified',
              tone: FaTone.success,
              leading: Icon(Icons.verified),
            ),
          ],
        ),
        const SizedBox(height: FaSpace.x12),
        Text(
          'Sunshine Smart General Store',
          style: context.faText.screenTitle.copyWith(color: colors.textPrimary),
        ),
        const SizedBox(height: FaSpace.x2),
        Text(
          'ERP ID: FO_OTMS_307099281',
          style:
              context.faText.cardSubtitle.copyWith(color: colors.textSecondary),
        ),
        const SizedBox(height: FaSpace.x24),
        Wrap(
          spacing: FaSpace.x8,
          children: const [
            FaPill(label: 'Completed', tone: FaTone.success),
            FaPill(label: 'Not started', tone: FaTone.neutral),
            FaPill(label: 'In Progress', tone: FaTone.info),
          ],
        ),
      ],
    );
  }
}
