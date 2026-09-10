import 'package:fa_flutter_ui_kit/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Wraps [child] in an app whose theme carries the tokens, unless [seed] is
/// null — which exercises the "host app forgot to wire FaTheme" path.
Widget _host(Widget child, {Color? seed = FaTheme.defaultSeed}) => MaterialApp(
      theme: seed == null
          ? ThemeData(useMaterial3: false)
          : FaTheme.light(seed: seed),
      home: child,
    );

Color? _decorationColorOf(WidgetTester tester, Finder container) =>
    (tester.widget<Container>(container).decoration as BoxDecoration?)?.color;

void main() {
  group('FaPill', () {
    testWidgets('paints tint and ink from the tone it is given',
        (tester) async {
      await tester.pumpWidget(
        _host(const Center(child: FaPill(label: 'Verified', tone: FaTone.success))),
      );

      final expected = FaColors.fromSeed(FaTheme.defaultSeed).status.success;
      expect(
        _decorationColorOf(tester, find.byType(Container)),
        expected.tint,
      );
      expect(
        tester.widget<Text>(find.text('Verified')).style?.color,
        expected.ink,
      );
    });

    testWidgets('re-tints a brand-toned pill when the company is branded',
        (tester) async {
      const seed = Color(0xFF00695C);

      await tester.pumpWidget(
        _host(
          const Center(child: FaPill(label: 'Draft', tone: FaTone.brand)),
          seed: seed,
        ),
      );

      expect(tester.widget<Text>(find.text('Draft')).style?.color, seed);
    });

    testWidgets('tints a leading glyph with the tone ink', (tester) async {
      await tester.pumpWidget(
        _host(
          const Center(
            child: FaPill(
              label: 'Verified',
              tone: FaTone.success,
              leading: Icon(Icons.verified),
            ),
          ),
        ),
      );

      final ink = FaColors.fromSeed(FaTheme.defaultSeed).status.success.ink;
      expect(tester.widget<Icon>(find.byType(Icon)).color, isNull);
      expect(
        IconTheme.of(tester.element(find.byType(Icon))).color,
        ink,
      );
    });

    testWidgets('falls back to MT defaults when the theme has no tokens',
        (tester) async {
      await tester.pumpWidget(
        _host(
          const Center(child: FaPill(label: 'Verified', tone: FaTone.success)),
          seed: null,
        ),
      );

      expect(
        _decorationColorOf(tester, find.byType(Container)),
        const Color(0xFFE9FFE8),
      );
    });
  });

  group('FaTopNav', () {
    test('reserves the height measured from the MT 2.0 file', () {
      const nav = FaTopNav(title: 'Outlet Details');

      expect(nav.preferredSize.height, 65);
    });

    testWidgets('renders title, subtitle and actions', (tester) async {
      await tester.pumpWidget(
        _host(
          FaScaffold(
            header: FaTopNav(
              title: 'Outlet Details',
              subtitle: 'FO_OTMS_307099281',
              leading: FaNavAction(icon: Icons.arrow_back, onTap: () {}),
              actions: [FaNavAction(icon: Icons.call, onTap: () {})],
            ),
            body: const SizedBox(),
          ),
        ),
      );

      expect(find.text('Outlet Details'), findsOneWidget);
      expect(find.text('FO_OTMS_307099281'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.byIcon(Icons.call), findsOneWidget);
    });

    testWidgets('draws its content in the on-brand colour', (tester) async {
      await tester.pumpWidget(
        _host(
          const FaScaffold(
            header: FaTopNav(title: 'Outlet Details'),
            body: SizedBox(),
          ),
        ),
      );

      expect(
        tester.widget<Text>(find.text('Outlet Details')).style?.color,
        FaColors.fromSeed(FaTheme.defaultSeed).onBrand,
      );
    });

    testWidgets('puts arbitrary content between leading and actions',
        (tester) async {
      await tester.pumpWidget(
        _host(
          FaScaffold(
            header: FaTopNav.custom(
              child: const Text('search field'),
              actions: [FaNavAction(icon: Icons.tune, onTap: () {})],
            ),
            body: const SizedBox(),
          ),
        ),
      );

      expect(find.text('search field'), findsOneWidget);
      expect(find.byIcon(Icons.tune), findsOneWidget);
    });

    testWidgets('gives nav actions an accessible tap target', (tester) async {
      await tester.pumpWidget(
        _host(
          FaScaffold(
            header: FaTopNav(
              title: 'Outlet Details',
              actions: [FaNavAction(icon: Icons.call, onTap: () {})],
            ),
            body: const SizedBox(),
          ),
        ),
      );

      expect(
        tester.getSize(find.byType(FaNavAction)).height,
        greaterThanOrEqualTo(FaNavAction.minTapTarget),
      );
    });
  });

  group('FaScaffold', () {
    testWidgets('backs the screen with the canvas token', (tester) async {
      await tester.pumpWidget(_host(const FaScaffold(body: SizedBox())));

      expect(
        tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor,
        FaColors.fromSeed(FaTheme.defaultSeed).canvas,
      );
    });

    testWidgets('lets the backdrop run behind the status bar', (tester) async {
      await tester.pumpWidget(
        _host(
          const FaScaffold(
            header: FaTopNav(title: 'Outlet Details'),
            body: SizedBox(),
          ),
        ),
      );

      expect(
        tester.widget<Scaffold>(find.byType(Scaffold)).extendBodyBehindAppBar,
        isTrue,
      );
      expect(tester.getTopLeft(find.byType(ClipPath)).dy, 0);
    });

    testWidgets('spans the backdrop across the screen, not the content',
        (tester) async {
      await tester.pumpWidget(
        _host(
          const FaScaffold(
            header: FaTopNav(title: 'Outlet Details'),
            body: SizedBox(),
          ),
        ),
      );

      expect(
        tester.getSize(find.byType(ClipPath)).width,
        tester.getSize(find.byType(FaScaffold)).width,
      );
    });

    testWidgets('starts body content below the header', (tester) async {
      const bodyKey = Key('body');

      await tester.pumpWidget(
        _host(
          const FaScaffold(
            header: FaTopNav(title: 'Outlet Details'),
            body: SizedBox(key: bodyKey, width: 10, height: 10),
          ),
        ),
      );

      expect(
        tester.getTopLeft(find.byKey(bodyKey)).dy,
        greaterThanOrEqualTo(FaTopNav.height),
      );
    });

    testWidgets('brightens status-bar icons over a brand backdrop',
        (tester) async {
      await tester.pumpWidget(_host(const FaScaffold(body: SizedBox())));

      final region = tester.widget<AnnotatedRegion<SystemUiOverlayStyle>>(
        find.byType(AnnotatedRegion<SystemUiOverlayStyle>),
      );
      expect(region.value.statusBarIconBrightness, Brightness.light);
    });

    testWidgets('darkens status-bar icons when there is no backdrop',
        (tester) async {
      await tester.pumpWidget(
        _host(
          const FaScaffold(backdrop: FaBackdrop.none(), body: SizedBox()),
        ),
      );

      final region = tester.widget<AnnotatedRegion<SystemUiOverlayStyle>>(
        find.byType(AnnotatedRegion<SystemUiOverlayStyle>),
      );
      expect(region.value.statusBarIconBrightness, Brightness.dark);
    });
  });
}
