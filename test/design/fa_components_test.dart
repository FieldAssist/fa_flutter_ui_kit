import 'package:fa_flutter_core/fa_flutter_core.dart'
    show Shimmer, SvgAssetLoader, SvgPicture;
import 'package:fa_flutter_ui_kit/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_helpers.dart';

final _defaults = FaColors.fromSeed(FaTheme.defaultSeed);

BoxDecoration _decorationIn(WidgetTester tester, Type owner) => tester
    .widget<DecoratedBox>(
      find
          .descendant(of: find.byType(owner), matching: find.byType(DecoratedBox))
          .first,
    )
    .decoration as BoxDecoration;

SvgPicture _svgIn(WidgetTester tester) =>
    tester.widget<SvgPicture>(find.byType(SvgPicture));

// Returns the pending result inside a record: an async function returning the
// future itself would wait for the dialog to close.
Future<({Future<FaDialogAction?> action})> _openDialog(
  WidgetTester tester, {
  String? secondaryLabel,
}) async {
  late Future<FaDialogAction?> action;
  await tester.pumpWidget(
    kitHost(
      Builder(
        builder: (context) => Center(
          child: GestureDetector(
            onTap: () => action = FaDialog.show(
              context,
              icon: FaIcons.warning,
              title: 'Resume Inward?',
              message: 'You have unsaved entries.',
              primaryLabel: 'Resume',
              secondaryLabel: secondaryLabel,
            ),
            child: const Text('open'),
          ),
        ),
      ),
    ),
  );
  await tester.tap(find.text('open'));
  await tester.pumpAndSettle();
  return (action: action);
}

void main() {
  group('FaPill', () {
    testWidgets('paints tint and ink from the tone it is given',
        (tester) async {
      await tester.pumpWidget(
        kitHost(
          const Center(child: FaPill(label: 'Verified', tone: FaTone.success)),
        ),
      );

      expect(_decorationIn(tester, FaPill).color, _defaults.status.success.tint);
      expect(
        tester.widget<Text>(find.text('Verified')).style?.color,
        _defaults.status.success.ink,
      );
    });

    testWidgets('re-tints a brand-toned pill when the company is branded',
        (tester) async {
      const seed = Color(0xFF00695C);

      await tester.pumpWidget(
        kitHost(
          const Center(child: FaPill(label: 'Draft', tone: FaTone.brand)),
          seed: seed,
        ),
      );

      expect(tester.widget<Text>(find.text('Draft')).style?.color, seed);
    });

    testWidgets('tints a leading glyph with the tone ink', (tester) async {
      await tester.pumpWidget(
        kitHost(
          const Center(
            child: FaPill(
              label: 'Verified',
              tone: FaTone.success,
              leading: Icon(Icons.verified),
            ),
          ),
        ),
      );

      expect(
        IconTheme.of(tester.element(find.byType(Icon))).color,
        _defaults.status.success.ink,
      );
    });

    testWidgets('falls back to MT defaults when the theme has no tokens',
        (tester) async {
      await tester.pumpWidget(
        kitHost(
          const Center(child: FaPill(label: 'Verified', tone: FaTone.success)),
          seed: null,
        ),
      );

      expect(_decorationIn(tester, FaPill).color, const Color(0xFFE9FFE8));
    });

    testWidgets('gives the medium size extra horizontal room', (tester) async {
      await tester.pumpWidget(
        kitHost(
          const Center(
            child: FaPill(label: 'Not Started', size: FaPillSize.md),
          ),
        ),
      );

      final padding = tester
          .widget<Padding>(
            find
                .descendant(
                  of: find.byType(FaPill),
                  matching: find.byType(Padding),
                )
                .first,
          )
          .padding;
      expect(padding, const EdgeInsets.symmetric(horizontal: 10, vertical: 4));
    });
  });

  group('FaSvgIcon', () {
    testWidgets('lays out at the icon\'s own size', (tester) async {
      await tester.pumpWidget(
        kitHost(const Center(child: FaSvgIcon(FaIcons.download))),
      );

      expect(tester.getSize(find.byType(FaSvgIcon)), const Size(13, 13));
    });

    testWidgets('tints a tintable icon with the ambient icon colour',
        (tester) async {
      const ink = Color(0xFF123456);

      await tester.pumpWidget(
        kitHost(
          const Center(
            child: IconTheme(
              data: IconThemeData(color: ink),
              child: FaSvgIcon(FaIcons.package2),
            ),
          ),
        ),
      );

      expect(
        _svgIn(tester).colorFilter,
        const ColorFilter.mode(ink, BlendMode.srcIn),
      );
    });

    testWidgets('keeps a multi-colour icon untinted', (tester) async {
      await tester.pumpWidget(
        kitHost(const Center(child: FaSvgIcon(FaIcons.addAPhoto))),
      );

      expect(_svgIn(tester).colorFilter, isNull);
    });

    testWidgets('loads the SVG from the kit package', (tester) async {
      await tester.pumpWidget(
        kitHost(const Center(child: FaSvgIcon(FaIcons.verified))),
      );

      final loader = _svgIn(tester).bytesLoader as SvgAssetLoader;
      expect(loader.assetName, 'assets/icons/verified.svg');
      expect(loader.packageName, 'fa_flutter_ui_kit');
    });
  });

  group('FaIconTile', () {
    testWidgets('is a 40 point square', (tester) async {
      await tester.pumpWidget(
        kitHost(const Center(child: FaIconTile(icon: FaIcons.package2))),
      );

      expect(tester.getSize(find.byType(FaIconTile)), const Size.square(40));
    });

    testWidgets('fills with the tone tint and inks the glyph', (tester) async {
      await tester.pumpWidget(
        kitHost(
          const Center(
            child: FaIconTile(icon: FaIcons.package2, tone: FaTone.accent),
          ),
        ),
      );

      expect(
        _decorationIn(tester, FaIconTile).color,
        _defaults.status.accent.tint,
      );
      expect(
        _svgIn(tester).colorFilter,
        ColorFilter.mode(_defaults.status.accent.ink, BlendMode.srcIn),
      );
    });
  });

  group('FaIconCircleButton', () {
    testWidgets('keeps the icon tile height so a card row does not grow',
        (tester) async {
      await tester.pumpWidget(
        kitHost(
          Center(
            child: FaIconCircleButton(
              icon: FaIcons.arrowOutward,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(
        tester.getSize(find.byType(FaIconCircleButton)).height,
        FaIconTile.size,
      );
    });

    testWidgets('reports a tap', (tester) async {
      var taps = 0;
      await tester.pumpWidget(
        kitHost(
          Center(
            child: FaIconCircleButton(
              icon: FaIcons.arrowOutward,
              onTap: () => taps++,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(FaIconCircleButton));

      expect(taps, 1);
    });

    testWidgets('draws a neutral circle behind the glyph', (tester) async {
      await tester.pumpWidget(
        kitHost(
          Center(
            child: FaIconCircleButton(
              icon: FaIcons.arrowOutward,
              onTap: () {},
            ),
          ),
        ),
      );

      final decoration = _decorationIn(tester, FaIconCircleButton);
      expect(decoration.shape, BoxShape.circle);
      expect(decoration.color, _defaults.status.neutral.tint);
    });
  });

  group('FaButton', () {
    testWidgets('fills with the brand and inks the label on-brand',
        (tester) async {
      await tester.pumpWidget(
        kitHost(Center(child: FaButton(label: 'Resume', onTap: () {}))),
      );

      expect(_decorationIn(tester, FaButton).color, _defaults.brand);
      expect(
        tester.widget<Text>(find.text('Resume')).style?.color,
        _defaults.onBrand,
      );
    });

    testWidgets('outlines with the brand over its tint', (tester) async {
      await tester.pumpWidget(
        kitHost(
          Center(
            child: FaButton(
              label: 'Proceed',
              variant: FaButtonVariant.outlined,
              onTap: () {},
            ),
          ),
        ),
      );

      final decoration = _decorationIn(tester, FaButton);
      expect(decoration.color, _defaults.status.brand.tint);
      expect(decoration.border, Border.all(color: _defaults.brand));
      expect(
        tester.widget<Text>(find.text('Proceed')).style?.color,
        _defaults.brand,
      );
    });

    testWidgets('inks a trailing icon like its label', (tester) async {
      await tester.pumpWidget(
        kitHost(
          Center(
            child: FaButton(
              label: 'Proceed',
              variant: FaButtonVariant.outlined,
              trailingIcon: FaIcons.arrowOutward,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(
        _svgIn(tester).colorFilter,
        ColorFilter.mode(_defaults.brand, BlendMode.srcIn),
      );
    });

    for (final (size, height) in [
      (FaButtonSize.regular, 44.0),
      (FaButtonSize.compact, 30.0),
    ]) {
      testWidgets('is $height points tall at ${size.name} size',
          (tester) async {
        await tester.pumpWidget(
          kitHost(
            Center(
              child: FaButton(label: 'Proceed', size: size, onTap: () {}),
            ),
          ),
        );

        expect(tester.getSize(find.byType(FaButton)).height, height);
      });
    }

    testWidgets('stretches to a tight width', (tester) async {
      await tester.pumpWidget(
        kitHost(
          Center(
            child: SizedBox(
              width: 300,
              child: FaButton(label: 'Resume', onTap: () {}),
            ),
          ),
        ),
      );

      expect(tester.getSize(find.byType(FaButton)).width, 300);
    });

    testWidgets('reports a tap', (tester) async {
      var taps = 0;
      await tester.pumpWidget(
        kitHost(
          Center(child: FaButton(label: 'Resume', onTap: () => taps++)),
        ),
      );

      await tester.tap(find.byType(FaButton));

      expect(taps, 1);
    });

    testWidgets('fills a danger tone with its solid colour', (tester) async {
      await tester.pumpWidget(
        kitHost(
          Center(
            child: FaButton(
              label: 'Checkout',
              tone: FaTone.danger,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(
        _decorationIn(tester, FaButton).color,
        _defaults.status.danger.solid,
      );
    });

    testWidgets('outlines a danger tone over its tint', (tester) async {
      await tester.pumpWidget(
        kitHost(
          Center(
            child: FaButton(
              label: 'Checkout',
              tone: FaTone.danger,
              variant: FaButtonVariant.outlined,
              onTap: () {},
            ),
          ),
        ),
      );

      final decoration = _decorationIn(tester, FaButton);
      expect(decoration.color, _defaults.status.danger.tint);
      expect(
        decoration.border,
        Border.all(color: _defaults.status.danger.solid),
      );
    });

    testWidgets('puts a leading icon before the label', (tester) async {
      await tester.pumpWidget(
        kitHost(
          Center(
            child: FaButton(
              label: 'Checkout',
              leadingIcon: FaIcons.logout,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(
        tester.getCenter(find.byType(SvgPicture)).dx,
        lessThan(tester.getCenter(find.text('Checkout')).dx),
      );
    });

    testWidgets('inks a leading icon like its label', (tester) async {
      await tester.pumpWidget(
        kitHost(
          Center(
            child: FaButton(
              label: 'Checkout',
              leadingIcon: FaIcons.logout,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(
        _svgIn(tester).colorFilter,
        ColorFilter.mode(_defaults.onBrand, BlendMode.srcIn),
      );
    });
  });

  group('FaBottomBar', () {
    const action = Key('action');

    Widget bar({double systemInset = 0}) => kitHost(
          MediaQuery(
            data: MediaQueryData(
              padding: EdgeInsets.only(bottom: systemInset),
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: FaBottomBar(child: SizedBox(key: action, height: 44)),
            ),
          ),
        );

    double gapBelowAction(WidgetTester tester) =>
        tester.getBottomLeft(find.byType(FaBottomBar)).dy -
        tester.getBottomLeft(find.byKey(action)).dy;

    testWidgets('paints the surface with a top border', (tester) async {
      await tester.pumpWidget(bar());

      final decoration = _decorationIn(tester, FaBottomBar);
      expect(decoration.color, _defaults.surface);
      expect(
        decoration.border,
        Border(top: BorderSide(color: _defaults.border)),
      );
    });

    testWidgets('lifts its child above the system gesture area',
        (tester) async {
      await tester.pumpWidget(bar(systemInset: 34));

      expect(gapBelowAction(tester), 34);
    });

    testWidgets('keeps a 16 point gap below its child without an inset',
        (tester) async {
      await tester.pumpWidget(bar());

      expect(gapBelowAction(tester), FaSpace.x16);
    });
  });

  group('FaDialog', () {
    testWidgets('shows its title and message', (tester) async {
      await _openDialog(tester);

      expect(find.text('Resume Inward?'), findsOneWidget);
      expect(find.text('You have unsaved entries.'), findsOneWidget);
    });

    testWidgets('completes with primary when the primary action is tapped',
        (tester) async {
      final dialog = await _openDialog(tester);

      await tester.tap(find.text('Resume'));
      await tester.pumpAndSettle();

      expect(await dialog.action, FaDialogAction.primary);
    });

    testWidgets('completes with secondary when the text action is tapped',
        (tester) async {
      final dialog = await _openDialog(tester, secondaryLabel: 'Start Fresh');

      await tester.tap(find.text('Start Fresh'));
      await tester.pumpAndSettle();

      expect(await dialog.action, FaDialogAction.secondary);
    });

    testWidgets('completes with null when dismissed', (tester) async {
      final dialog = await _openDialog(tester);

      await tester.tapAt(const Offset(4, 4));
      await tester.pumpAndSettle();

      expect(await dialog.action, isNull);
    });

    testWidgets('leaves out the text action without a secondary label',
        (tester) async {
      await _openDialog(tester);

      expect(find.byType(TextButton), findsNothing);
    });
  });

  group('FaSkeleton', () {
    testWidgets('shimmers over its placeholder boxes', (tester) async {
      await tester.pumpWidget(
        kitHost(const FaSkeleton(child: FaSkeletonBox(height: 40))),
      );

      expect(
        find.descendant(
          of: find.byType(Shimmer),
          matching: find.byType(FaSkeletonBox),
        ),
        findsOneWidget,
      );
    });

    testWidgets('lays a box out at the size it is given', (tester) async {
      await tester.pumpWidget(
        kitHost(const Center(child: FaSkeletonBox(width: 120, height: 40))),
      );

      expect(tester.getSize(find.byType(FaSkeletonBox)), const Size(120, 40));
    });
  });

  group('FaCard', () {
    testWidgets('draws surface, border, radius and shadow from the tokens',
        (tester) async {
      await tester.pumpWidget(
        kitHost(
          const Center(child: FaCard(child: SizedBox.square(dimension: 50))),
        ),
      );

      final decoration = _decorationIn(tester, FaCard);
      expect(decoration.color, _defaults.surface);
      expect(decoration.border, Border.all(color: _defaults.border));
      expect(decoration.borderRadius, BorderRadius.circular(FaRadius.xxl));
      expect(decoration.boxShadow?.single.color, _defaults.shadow);
    });
  });

  group('FaProgressRing', () {
    testWidgets('centres its label inside the ring', (tester) async {
      await tester.pumpWidget(
        kitHost(
          const Center(child: FaProgressRing(value: 0.6, label: Text('60%'))),
        ),
      );

      expect(
        tester.getCenter(find.text('60%')),
        tester.getCenter(find.byType(FaProgressRing)),
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
        kitHost(
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
        kitHost(
          const FaScaffold(
            header: FaTopNav(title: 'Outlet Details'),
            body: SizedBox(),
          ),
        ),
      );

      expect(
        tester.widget<Text>(find.text('Outlet Details')).style?.color,
        _defaults.onBrand,
      );
    });

    testWidgets('puts arbitrary content between leading and actions',
        (tester) async {
      await tester.pumpWidget(
        kitHost(
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
        kitHost(
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
      await tester.pumpWidget(kitHost(const FaScaffold(body: SizedBox())));

      expect(
        tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor,
        _defaults.canvas,
      );
    });

    testWidgets('lets the backdrop run behind the status bar', (tester) async {
      await tester.pumpWidget(
        kitHost(
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
        kitHost(
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
        kitHost(
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
      await tester.pumpWidget(kitHost(const FaScaffold(body: SizedBox())));

      final region = tester.widget<AnnotatedRegion<SystemUiOverlayStyle>>(
        find.byType(AnnotatedRegion<SystemUiOverlayStyle>),
      );
      expect(region.value.statusBarIconBrightness, Brightness.light);
    });

    testWidgets('darkens status-bar icons when there is no backdrop',
        (tester) async {
      await tester.pumpWidget(
        kitHost(
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
