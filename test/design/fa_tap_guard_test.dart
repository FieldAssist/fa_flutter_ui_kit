import 'dart:async';

import 'package:fa_flutter_ui_kit/design.dart';
import 'package:fa_flutter_ui_kit/src/design/components/buttons/fa_tap_guard.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_helpers.dart';

class _GuardProbe extends StatefulWidget {
  const _GuardProbe();

  @override
  State<_GuardProbe> createState() => _GuardProbeState();
}

class _GuardProbeState extends State<_GuardProbe> with FaTapGuard {
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

void main() {
  group('FaTapGuard', () {
    Future<_GuardProbeState> pumpGuard(WidgetTester tester) async {
      await tester.pumpWidget(const _GuardProbe());
      return tester.state<_GuardProbeState>(find.byType(_GuardProbe));
    }

    testWidgets('drops a call while the previous action is running',
        (tester) async {
      final guard = await pumpGuard(tester);
      final pending = Completer<void>();
      var runs = 0;

      final first = guard.guardTap(() {
        runs++;
        return pending.future;
      });
      await guard.guardTap(() async => runs++);
      pending.complete();
      await first;

      expect(runs, 1);
    });

    testWidgets('runs the next call once the action has finished',
        (tester) async {
      final guard = await pumpGuard(tester);
      var runs = 0;

      await guard.guardTap(() async => runs++);
      await guard.guardTap(() async => runs++);

      expect(runs, 2);
    });

    testWidgets('releases the guard when the action throws', (tester) async {
      final guard = await pumpGuard(tester);
      var runs = 0;

      await expectLater(
        guard.guardTap(() async {
          runs++;
          throw StateError('boom');
        }),
        throwsStateError,
      );
      await guard.guardTap(() async => runs++);

      // the throw must not leave the button dead
      expect(runs, 2);
    });
  });

  group('guarded buttons', () {
    testWidgets('FaButton drops a tap while its action is still running',
        (tester) async {
      final pending = Completer<void>();
      var taps = 0;
      await tester.pumpWidget(
        kitHost(
          Center(
            child: FaButton(
              label: 'Checkout',
              onTap: () {
                taps++;
                return pending.future;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(FaButton));
      await tester.tap(find.byType(FaButton));
      pending.complete();

      expect(taps, 1);
    });

    testWidgets(
        'FaIconCircleButton drops a tap while its action is still running',
        (tester) async {
      final pending = Completer<void>();
      var taps = 0;
      await tester.pumpWidget(
        kitHost(
          Center(
            child: FaIconCircleButton(
              icon: FaIcons.visibility,
              onTap: () {
                taps++;
                return pending.future;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(FaIconCircleButton));
      await tester.tap(find.byType(FaIconCircleButton));
      pending.complete();

      expect(taps, 1);
    });
  });
}
