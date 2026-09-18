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

  group('FaTextField', () {
    testWidgets('adds an asterisk to the label of a required field',
        (tester) async {
      final controller = TextEditingController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        kitHost(
          Material(
            child: FaTextField(
              label: 'Customer Name',
              controller: controller,
              isRequired: true,
            ),
          ),
        ),
      );

      expect(
        find.byWidgetPredicate(
          (w) => w is RichText && w.text.toPlainText() == 'Customer Name*',
        ),
        findsOneWidget,
      );
    });

    testWidgets('reports typed text through onChanged', (tester) async {
      final controller = TextEditingController();
      addTearDown(controller.dispose);
      String? typed;

      await tester.pumpWidget(
        kitHost(
          Material(
            child: FaTextField(
              label: 'Invoice Number',
              controller: controller,
              onChanged: (value) => typed = value,
            ),
          ),
        ),
      );
      await tester.enterText(find.byType(TextField), 'INV-1');

      expect(typed, 'INV-1');
    });
  });

  group('FaTextField error', () {
    testWidgets('shows the error text under the field', (tester) async {
      final controller = TextEditingController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        kitHost(
          Material(
            child: FaTextField(
              label: 'Phone Number',
              controller: controller,
              errorText: 'Invalid Phone Number',
            ),
          ),
        ),
      );

      expect(find.text('Invalid Phone Number'), findsOneWidget);
    });
  });

  group('FaSwitch', () {
    testWidgets('reports the flipped value', (tester) async {
      bool? flipped;

      await tester.pumpWidget(
        kitHost(
          Material(
            child: FaSwitch(value: false, onChanged: (v) => flipped = v),
          ),
        ),
      );
      await tester.tap(find.byType(Switch));

      expect(flipped, isTrue);
    });

    testWidgets('paints an on toggle in the brand colour', (tester) async {
      await tester.pumpWidget(
        kitHost(Material(child: FaSwitch(value: true, onChanged: (_) {}))),
      );

      final track =
          tester.widget<Switch>(find.byType(Switch)).trackColor!;

      expect(track.resolve({WidgetState.selected}), _defaults.brand);
    });

    testWidgets('does not report a tap without a handler', (tester) async {
      await tester.pumpWidget(
        kitHost(const Material(child: FaSwitch(value: false, onChanged: null))),
      );
      await tester.tap(find.byType(Switch));

      expect(tester.widget<Switch>(find.byType(Switch)).value, isFalse);
    });
  });

  group('FaChoiceChips', () {
    Future<void> pumpChips(
      WidgetTester tester, {
      String? selected,
      required ValueChanged<String?> onSelected,
    }) =>
        tester.pumpWidget(
          kitHost(
            Material(
              child: FaChoiceChips(
                label: 'Age Group',
                options: const ['15-25', '25-35', '35-40'],
                selected: selected,
                onSelected: onSelected,
              ),
            ),
          ),
        );

    testWidgets('reports the option that was tapped', (tester) async {
      String? picked;

      await pumpChips(tester, onSelected: (v) => picked = v);
      await tester.tap(find.text('25-35'));

      expect(picked, '25-35');
    });

    testWidgets('clears the answer when the chosen option is tapped again',
        (tester) async {
      String? picked = '25-35';

      await pumpChips(tester, selected: '25-35', onSelected: (v) => picked = v);
      await tester.tap(find.text('25-35'));

      expect(picked, isNull);
    });

    testWidgets('fills the chosen chip with the brand colour', (tester) async {
      await pumpChips(tester, selected: '15-25', onSelected: (_) {});

      final chosen = tester.widget<Container>(
        find
            .ancestor(of: find.text('15-25'), matching: find.byType(Container))
            .first,
      );

      expect((chosen.decoration! as BoxDecoration).color, _defaults.brand);
    });

    testWidgets('shows its error text', (tester) async {
      await tester.pumpWidget(
        kitHost(
          Material(
            child: FaChoiceChips(
              label: 'Age Group',
              options: const ['15-25'],
              onSelected: (_) {},
              errorText: 'Please enter a value',
            ),
          ),
        ),
      );

      expect(find.text('Please enter a value'), findsOneWidget);
    });
  });

  group('FaRating', () {
    testWidgets('reports the star that was tapped', (tester) async {
      int? rated;

      await tester.pumpWidget(
        kitHost(
          Material(
            child: FaRating(label: 'Refer us?', onChanged: (v) => rated = v),
          ),
        ),
      );
      await tester.tap(find.byType(IconButton).at(3));

      expect(rated, 4);
    });

    testWidgets('fills every star up to the rating', (tester) async {
      await tester.pumpWidget(
        kitHost(
          Material(
            child: FaRating(label: 'Refer us?', value: 3, onChanged: (_) {}),
          ),
        ),
      );

      expect(find.byIcon(Icons.star_rounded), findsNWidgets(3));
      expect(find.byIcon(Icons.star_border_rounded), findsNWidgets(2));
    });

    testWidgets('clears the rating when its own star is tapped again',
        (tester) async {
      int? rated = 2;

      await tester.pumpWidget(
        kitHost(
          Material(
            child: FaRating(
              label: 'Refer us?',
              value: 2,
              onChanged: (v) => rated = v,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(IconButton).at(1));

      expect(rated, isNull);
    });
  });

  group('FaQtyStepper', () {
    Future<void> pumpStepper(
      WidgetTester tester, {
      required int value,
      int min = 0,
      int? max,
      ValueChanged<int>? onChanged,
    }) =>
        tester.pumpWidget(
          kitHost(
            Material(
              child: Center(
                child: FaQtyStepper(
                  value: value,
                  min: min,
                  max: max,
                  caption: 'Pack',
                  onChanged: onChanged ?? (_) {},
                ),
              ),
            ),
          ),
        );

    testWidgets('steps up by one', (tester) async {
      int? stepped;

      await pumpStepper(tester, value: 2, onChanged: (v) => stepped = v);
      await tester.tap(find.byIcon(Icons.add_rounded));

      expect(stepped, 3);
    });

    testWidgets('steps down by one', (tester) async {
      int? stepped;

      await pumpStepper(tester, value: 2, onChanged: (v) => stepped = v);
      await tester.tap(find.byIcon(Icons.remove_rounded));

      expect(stepped, 1);
    });

    testWidgets('does not step past the maximum', (tester) async {
      int? stepped;

      await pumpStepper(tester, value: 5, max: 5, onChanged: (v) => stepped = v);
      await tester.tap(find.byIcon(Icons.add_rounded));

      expect(stepped, isNull);
    });

    testWidgets('does not step below the minimum', (tester) async {
      int? stepped;

      await pumpStepper(tester, value: 0, onChanged: (v) => stepped = v);
      await tester.tap(find.byIcon(Icons.remove_rounded));

      expect(stepped, isNull);
    });

    testWidgets('shows its caption under the counter', (tester) async {
      await pumpStepper(tester, value: 1);

      expect(find.text('Pack'), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
    });
  });

  group('FaDateField', () {
    Future<void> pumpDateField(
      WidgetTester tester, {
      DateTime? value,
      ValueChanged<DateTime>? onChanged,
    }) =>
        tester.pumpWidget(
          kitHost(
            Material(
              child: FaDateField(
                label: 'Delivery Date',
                hint: 'Select date',
                value: value,
                format: (date) => '${date.day}/${date.month}/${date.year}',
                firstDate: DateTime(2000),
                lastDate: DateTime(2026, 9, 15),
                onChanged: onChanged ?? (_) {},
              ),
            ),
          ),
        );

    testWidgets('shows the hint while no date is set', (tester) async {
      await pumpDateField(tester);

      expect(find.text('Select date'), findsOneWidget);
    });

    testWidgets('shows the set date through format', (tester) async {
      await pumpDateField(tester, value: DateTime(2026, 9, 14));

      expect(find.text('14/9/2026'), findsOneWidget);
    });

    testWidgets('reports the day confirmed in the picker', (tester) async {
      DateTime? picked;
      await pumpDateField(tester, onChanged: (date) => picked = date);

      await tester.tap(find.text('Select date'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // the picker opens on lastDate when nothing is set
      expect(picked, DateTime(2026, 9, 15));
    });
  });

  group('FaImagePickerTile', () {
    Future<void> pumpTile(
      WidgetTester tester, {
      bool hasImage = false,
      bool isUploading = false,
      VoidCallback? onPick,
      VoidCallback? onRemove,
    }) =>
        tester.pumpWidget(
          kitHost(
            Material(
              child: FaImagePickerTile(
                label: 'Document Image',
                hint: 'Add image',
                attachedLabel: 'Image attached',
                hasImage: hasImage,
                isUploading: isUploading,
                onPick: onPick ?? () {},
                onRemove: onRemove ?? () {},
              ),
            ),
          ),
        );

    testWidgets('picks when the empty tile is tapped', (tester) async {
      var picks = 0;
      await pumpTile(tester, onPick: () => picks++);

      await tester.tap(find.text('Add image'));

      expect(picks, 1);
    });

    testWidgets('removes through the close button once attached',
        (tester) async {
      var removals = 0;
      await pumpTile(tester, hasImage: true, onRemove: () => removals++);

      await tester.tap(find.byIcon(Icons.close));

      expect(removals, 1);
    });

    testWidgets('ignores taps while uploading', (tester) async {
      var picks = 0;
      await pumpTile(tester, isUploading: true, onPick: () => picks++);

      await tester.tap(find.byType(CircularProgressIndicator));

      expect(picks, 0);
    });
  });

  group('FaBottomSheet', () {
    Future<void> openSheet(WidgetTester tester) async {
      await tester.pumpWidget(
        kitHost(
          Builder(
            builder: (context) => Center(
              child: GestureDetector(
                onTap: () => FaBottomSheet.show<void>(
                  context,
                  builder: (_) => const FaBottomSheet(
                    title: 'Invoice Details',
                    subtitle: 'All fields are optional',
                    action: Text('Confirm Inward'),
                    child: Text('fields'),
                  ),
                ),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
    }

    testWidgets('shows its title, subtitle, content and action',
        (tester) async {
      await openSheet(tester);

      expect(
        [
          find.text('Invoice Details'),
          find.text('All fields are optional'),
          find.text('fields'),
          find.text('Confirm Inward'),
        ].every((finder) => finder.evaluate().length == 1),
        isTrue,
        reason: 'every sheet part renders once',
      );
    });

    testWidgets('closes when the close button is tapped', (tester) async {
      await openSheet(tester);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(find.text('Invoice Details'), findsNothing);
    });
  });

  group('FaSegmentedTabs', () {
    Future<void> pumpTabs(
      WidgetTester tester, {
      required int selectedIndex,
      required ValueChanged<int> onChanged,
    }) =>
        tester.pumpWidget(
          kitHost(
            Center(
              child: FaSegmentedTabs(
                tabs: const [
                  FaSegmentedTab(label: 'All', count: 4),
                  FaSegmentedTab(label: 'Tracked', count: 2),
                  FaSegmentedTab(label: 'Non Tracked', count: 6),
                ],
                selectedIndex: selectedIndex,
                onChanged: onChanged,
              ),
            ),
          ),
        );

    testWidgets('shows every segment with its count', (tester) async {
      await pumpTabs(tester, selectedIndex: 0, onChanged: (_) {});

      expect(
        ['All', '4', 'Tracked', '2', 'Non Tracked', '6']
            .every((label) => find.text(label).evaluate().length == 1),
        isTrue,
        reason: 'each label and each count renders once',
      );
    });

    testWidgets('reports the index of the segment that was tapped',
        (tester) async {
      final tapped = <int>[];

      await pumpTabs(tester, selectedIndex: 0, onChanged: tapped.add);
      await tester.tap(find.text('Tracked'));

      expect(tapped, [1]);
    });
  });

  group('FaCalendarRange', () {
    // July 2026 starts on a Wednesday, so 12 and 14 appear only once each.
    final july = DateTime(2026, 7, 12);

    Future<void> pumpCalendar(
      WidgetTester tester, {
      required DateTimeRange range,
      required ValueChanged<DateTimeRange> onChanged,
      DateTime? lastDate,
    }) =>
        tester.pumpWidget(
          kitHost(
            Material(
              child: FaCalendarRange(
                range: range,
                firstDate: DateTime(2026),
                lastDate: lastDate ?? DateTime(2026, 12, 31),
                onChanged: onChanged,
                formatMonth: (month) => 'July 2026',
              ),
            ),
          ),
        );

    testWidgets('first tap starts a new range on the tapped day',
        (tester) async {
      DateTimeRange? chosen;

      await pumpCalendar(
        tester,
        range: DateTimeRange(start: july, end: july),
        onChanged: (range) => chosen = range,
      );
      await tester.tap(find.text('16'));

      // a range of one day until a second day closes it
      expect(chosen, DateTimeRange(start: DateTime(2026, 7, 16), end: DateTime(2026, 7, 16)));
    });

    testWidgets('second tap before the first closes the range backwards',
        (tester) async {
      final chosen = <DateTimeRange>[];

      await pumpCalendar(
        tester,
        range: DateTimeRange(start: july, end: july),
        onChanged: chosen.add,
      );
      await tester.tap(find.text('16'));
      await tester.pump();
      await tester.tap(find.text('14'));

      expect(
        chosen.last,
        DateTimeRange(start: DateTime(2026, 7, 14), end: DateTime(2026, 7, 16)),
      );
    });

    testWidgets('a day after lastDate is not selectable', (tester) async {
      DateTimeRange? chosen;

      await pumpCalendar(
        tester,
        range: DateTimeRange(start: july, end: july),
        onChanged: (range) => chosen = range,
        lastDate: DateTime(2026, 7, 15),
      );
      await tester.tap(find.text('16'));

      expect(chosen, isNull);
    });
  });
}
