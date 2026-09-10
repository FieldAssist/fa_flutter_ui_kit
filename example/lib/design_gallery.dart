import 'package:fa_flutter_ui_kit/design.dart';
import 'package:flutter/material.dart';

/// Gallery for the Modern Trade 2.0 design system.
///
/// Doubles as the proof that branding flows through the tokens: switching the
/// seed re-tints the header, the brand pill and every brand-derived role,
/// while success/warning/danger stay put.
class DesignGalleryPage extends StatefulWidget {
  const DesignGalleryPage({super.key});

  @override
  State<DesignGalleryPage> createState() => _DesignGalleryPageState();
}

class _DesignGalleryPageState extends State<DesignGalleryPage> {
  static const _seeds = <String, Color>{
    'MT 2.0': FaTheme.defaultSeed,
    'Teal': Color(0xFF00695C),
    'Magenta': Color(0xFFB651B4),
    'Navy': Color(0xFF002E6C),
  };

  String _seedName = 'MT 2.0';

  @override
  Widget build(BuildContext context) {
    // The tokens ride on ThemeData, so swapping them is a theme swap — exactly
    // what a host app does when company branding arrives.
    return Theme(
      data: FaTheme.light(seed: _seeds[_seedName]!),
      child: Builder(builder: _buildGallery),
    );
  }

  Widget _buildGallery(BuildContext context) {
    return FaScaffold(
      header: FaTopNav(
        title: 'Design System',
        subtitle: 'Modern Trade 2.0',
        leading: FaNavAction(
          icon: Icons.arrow_back,
          semanticLabel: 'Back',
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(FaSpace.x16),
        children: [
          _Section(
            title: 'Brand seed',
            child: Wrap(
              spacing: FaSpace.x8,
              children: [
                for (final entry in _seeds.entries)
                  ChoiceChip(
                    label: Text(entry.key),
                    selected: _seedName == entry.key,
                    onSelected: (_) => setState(() => _seedName = entry.key),
                  ),
              ],
            ),
          ),
          _Section(
            title: 'Tones',
            child: Wrap(
              spacing: FaSpace.x8,
              runSpacing: FaSpace.x8,
              children: [
                for (final tone in FaTone.values)
                  FaPill(
                    label: tone.name,
                    tone: tone,
                    leading: const Icon(Icons.circle),
                  ),
              ],
            ),
          ),
          _Section(
            title: 'Surface roles',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Swatch('canvas', context.faColors.canvas),
                _Swatch('surface', context.faColors.surface),
                _Swatch('surfaceAlt', context.faColors.surfaceAlt),
                _Swatch('border', context.faColors.border),
                _Swatch('brand', context.faColors.brand),
                _Swatch('brandDeep', context.faColors.brandDeep),
              ],
            ),
          ),
          _Section(
            title: 'Type grid',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('16 / w600 — cardTitle', style: context.faText.cardTitle),
                Text('14 / w400 — body', style: context.faText.body),
                Text('14 / w600 — bodyStrong', style: context.faText.bodyStrong),
                Text('12 / w500 — pillLabel', style: context.faText.pillLabel),
                Text('11 / w400 — caption', style: context.faText.caption),
              ],
            ),
          ),
          _Section(
            title: 'Gradients',
            child: Column(
              children: [
                _GradientBar('headerBackdrop', context.faGradients.headerBackdrop),
                const SizedBox(height: FaSpace.x8),
                _GradientBar('primaryAction', context.faGradients.primaryAction),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: FaSpace.x16),
      padding: const EdgeInsets.all(FaSpace.x16),
      decoration: BoxDecoration(
        color: context.faColors.surface,
        borderRadius: BorderRadius.circular(FaRadius.xxl),
        border: Border.all(color: context.faColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.faText.sectionTitle),
          const SizedBox(height: FaSpace.x12),
          child,
        ],
      ),
    );
  }
}

class _Swatch extends StatelessWidget {
  const _Swatch(this.name, this.color);

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: FaSpace.x8),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(FaRadius.md),
              border: Border.all(color: context.faColors.border),
            ),
          ),
          const SizedBox(width: FaSpace.x12),
          Text(name, style: context.faText.body),
        ],
      ),
    );
  }
}

class _GradientBar extends StatelessWidget {
  const _GradientBar(this.name, this.gradient);

  final String name;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(FaRadius.lg),
      ),
      child: Text(
        name,
        style: context.faText.pillLabel.copyWith(color: context.faColors.onBrand),
      ),
    );
  }
}
