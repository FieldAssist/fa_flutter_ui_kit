import 'package:fa_flutter_ui_kit/design.dart';
import 'package:flutter/material.dart';

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

  static const _icons = <String, FaIconAsset>{
    'package2': FaIcons.package2,
    'addAPhoto': FaIcons.addAPhoto,
    'download': FaIcons.download,
    'factCheck': FaIcons.factCheck,
    'arrowOutward': FaIcons.arrowOutward,
    'verified': FaIcons.verified,
  };

  String _seedName = 'MT 2.0';

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FaTheme.light(seed: _seeds[_seedName]!),
      child: Builder(builder: _buildGallery),
    );
  }

  Widget _buildGallery(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
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
                for (final tone in FaTone.values) ...[
                  FaPill(label: tone.name, tone: tone),
                  FaPill(label: tone.name, tone: tone, size: FaPillSize.md),
                ],
              ],
            ),
          ),
          _Section(
            title: 'Icons',
            child: Wrap(
              spacing: FaSpace.x12,
              runSpacing: FaSpace.x12,
              children: [
                for (final entry in _icons.entries)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIconTile(icon: entry.value),
                      const SizedBox(height: FaSpace.x4),
                      Text(entry.key, style: text.caption),
                    ],
                  ),
              ],
            ),
          ),
          _Section(
            title: 'Activity card',
            child: Row(
              children: [
                Expanded(
                  child: FaCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const FaIconTile(icon: FaIcons.package2),
                            const Spacer(),
                            FaIconCircleButton(
                              icon: FaIcons.arrowOutward,
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: FaSpace.x12),
                        Text(
                          'Opening Stock',
                          style: text.cardTitle
                              .copyWith(color: colors.textPrimary),
                        ),
                        const SizedBox(height: FaSpace.x2),
                        Text(
                          'Enter opening quantities',
                          style: text.caption
                              .copyWith(color: colors.textSecondary),
                        ),
                        const SizedBox(height: FaSpace.x12),
                        const FaPill(
                          label: 'Not Started',
                          size: FaPillSize.md,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _Section(
            title: 'Progress',
            child: Row(
              children: [
                for (final value in [0.0, 0.5, 1.0]) ...[
                  FaProgressRing(
                    value: value,
                    label: Text('${(value * 100).round()}%', style: text.s12.w600),
                  ),
                  const SizedBox(width: FaSpace.x16),
                ],
              ],
            ),
          ),
          _Section(
            title: 'Surface roles',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Swatch('canvas', colors.canvas),
                _Swatch('surface', colors.surface),
                _Swatch('surfaceAlt', colors.surfaceAlt),
                _Swatch('border', colors.border),
                _Swatch('icon', colors.icon),
                _Swatch('brand', colors.brand),
                _Swatch('brandDeep', colors.brandDeep),
              ],
            ),
          ),
          _Section(
            title: 'Type grid',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('14 / w600 — cardTitle', style: text.cardTitle),
                Text('14 / w400 — body', style: text.body),
                Text('14 / w600 — bodyStrong', style: text.bodyStrong),
                Text('12 / w500 — pillLabel', style: text.pillLabel),
                Text('11 / w400 — caption', style: text.caption),
              ],
            ),
          ),
          _Section(
            title: 'Gradients',
            child: Column(
              children: [
                _GradientBar(
                  'headerBackdrop',
                  context.faGradients.headerBackdrop,
                ),
                const SizedBox(height: FaSpace.x8),
                _GradientBar(
                  'primaryAction',
                  context.faGradients.primaryAction,
                ),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: FaSpace.x16),
      child: FaCard(
        padding: const EdgeInsets.all(FaSpace.x16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.faText.sectionTitle),
            const SizedBox(height: FaSpace.x12),
            child,
          ],
        ),
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
