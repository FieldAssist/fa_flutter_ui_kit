import 'package:fa_flutter_ui_kit/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FaColorRamp', () {
    test('returns the hand-tuned Figma ramp for the MT 2.0 brand seed', () {
      final ramp = FaColorRamp.fromSeed(FaTheme.defaultSeed);

      expect(ramp, same(FaColorRamp.blue));
      expect(ramp.s900, const Color(0xFF153885));
    });

    test('anchors a derived ramp on the seed itself', () {
      const seed = Color(0xFF00695C);

      final ramp = FaColorRamp.fromSeed(seed);

      expect(ramp.s600, seed);
    });

    test('derives a ramp that runs light to dark', () {
      final ramp = FaColorRamp.fromSeed(const Color(0xFF00695C));

      expect(
        HSLColor.fromColor(ramp.s50).lightness,
        greaterThan(HSLColor.fromColor(ramp.s500).lightness),
      );
      expect(
        HSLColor.fromColor(ramp.s500).lightness,
        greaterThan(HSLColor.fromColor(ramp.s950).lightness),
      );
    });

    test('keeps the seed hue across a derived ramp', () {
      const seed = Color(0xFF00695C);

      final ramp = FaColorRamp.fromSeed(seed);

      expect(
        HSLColor.fromColor(ramp.s200).hue,
        closeTo(HSLColor.fromColor(seed).hue, 0.5),
      );
    });
  });

  group('FaColors', () {
    test('takes brand roles from the seed', () {
      const seed = Color(0xFF00695C);

      final colors = FaColors.fromSeed(seed);

      expect(colors.brand, seed);
      expect(colors.status.brand.ink, seed);
    });

    test('keeps success and danger fixed regardless of branding', () {
      final branded = FaColors.fromSeed(const Color(0xFF00695C));
      final defaulted = FaColors.fromSeed(FaTheme.defaultSeed);

      expect(branded.status.success.ink, defaulted.status.success.ink);
      expect(branded.status.danger.ink, defaulted.status.danger.ink);
    });

    test('keeps the accent tone fixed regardless of branding', () {
      final branded = FaColors.fromSeed(const Color(0xFF00695C));

      expect(branded.status.accent.tint, FaColorRamp.violet.s50);
    });

    test('matches the MT 2.0 canvas and verified-pill values by default', () {
      final colors = FaColors.fromSeed(FaTheme.defaultSeed);

      expect(colors.canvas, const Color(0xFFF5F6FA));
      expect(colors.status.success.tint, const Color(0xFFE9FFE8));
      expect(colors.status.success.ink, const Color(0xFF008400));
    });

    test('matches the MT 2.0 card border, neutral glyph and ring green', () {
      final colors = FaColors.fromSeed(FaTheme.defaultSeed);

      expect(colors.border, const Color(0xFFE2E8F0));
      expect(colors.icon, const Color(0xFF374151));
      expect(colors.status.success.solid, const Color(0xFF48C054));
    });

    test('resolves every tone', () {
      final status = FaColors.fromSeed(FaTheme.defaultSeed).status;

      for (final tone in FaTone.values) {
        expect(status.of(tone), isA<FaStatusRamp>());
      }
    });
  });

  group('FaText', () {
    const tokens = FaText();

    test('turns Figma pixel line-heights into Flutter multipliers', () {
      expect(tokens.s14.w400.fontSize, 14);
      expect(tokens.s14.w400.height, closeTo(21 / 14, 0.001));
      expect(tokens.s12.w500.height, closeTo(16 / 12, 0.001));
    });

    test('varies weight at a fixed size', () {
      expect(tokens.s14.w400.fontWeight, FontWeight.w400);
      expect(tokens.s14.w600.fontWeight, FontWeight.w600);
      expect(tokens.s14.w400.fontSize, tokens.s14.w600.fontSize);
    });

    test('resolves Inter from this package so a host app need not ship it', () {
      expect(tokens.body.fontFamily, 'packages/fa_flutter_ui_kit/Inter');
    });

    test('leaves the family unprefixed when the host app owns the font', () {
      const hostOwned = FaText(fontFamily: 'Poppins', fontPackage: null);

      expect(hostOwned.body.fontFamily, 'Poppins');
    });

    test('maps semantic aliases onto grid entries', () {
      expect(tokens.navTitle, tokens.s16.w500);
      expect(tokens.pillLabel, tokens.s12.w500);
      expect(tokens.cardTitle, tokens.s14.w600);
    });
  });

  group('FaGradients', () {
    test('runs the header gradient dark to brand, top to bottom', () {
      final gradients = FaGradients.fromSeed(FaTheme.defaultSeed);

      expect(gradients.headerBackdrop.colors.first, FaColorRamp.blue.s900);
      expect(gradients.headerBackdrop.colors.last, FaColorRamp.blue.s600);
      expect(gradients.headerBackdrop.begin, Alignment.topCenter);
      expect(gradients.headerBackdrop.end, Alignment.bottomCenter);
    });

    test('seeds the call-to-action gradient but keeps its accent stops', () {
      const seed = Color(0xFF00695C);

      final gradients = FaGradients.fromSeed(seed);

      expect(gradients.primaryAction.colors.first, seed);
      expect(gradients.primaryAction.colors.last, const Color(0xFFFF559B));
    });
  });
}
