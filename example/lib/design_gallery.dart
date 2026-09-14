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
    'lock': FaIcons.lock,
    'visibility': FaIcons.visibility,
    'warning': FaIcons.warning,
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
          const _Section(
            title: 'Activity cards',
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _ActivityCard(
                    icon: FaIcons.package2,
                    title: 'Opening Stock',
                    hint: 'Enter opening quantities',
                    status: FaPill(label: 'Completed', tone: FaTone.success),
                  ),
                ),
                SizedBox(width: FaSpace.x12),
                Expanded(
                  child: Opacity(
                    opacity: FaOpacity.disabled,
                    child: _ActivityCard(
                      icon: FaIcons.lock,
                      tone: FaTone.neutral,
                      title: 'Closing Stock',
                      hint: 'Enter closing quantities',
                      status: FaPill(label: 'Not Started'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _Section(
            title: 'Buttons',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: FaButton(label: 'Resume', onTap: () {}),
                ),
                const SizedBox(height: FaSpace.x12),
                FaButton(
                  label: 'Proceed',
                  variant: FaButtonVariant.outlined,
                  size: FaButtonSize.compact,
                  trailingIcon: FaIcons.arrowOutward,
                  onTap: () {},
                ),
              ],
            ),
          ),
          _Section(
            title: 'Bottom bar',
            child: FaBottomBar(
              child: SizedBox(
                width: double.infinity,
                child: FaButton(
                  label: 'Checkout',
                  tone: FaTone.danger,
                  leadingIcon: FaIcons.logout,
                  onTap: () {},
                ),
              ),
            ),
          ),
          _Section(
            title: 'Dialog',
            child: FaButton(
              label: 'Show dialog',
              variant: FaButtonVariant.outlined,
              onTap: () => FaDialog.show(
                context,
                icon: FaIcons.warning,
                title: 'Resume Inward?',
                message: 'You have unsaved entries. Resume them or start fresh.',
                primaryLabel: 'Resume',
                secondaryLabel: 'Start Fresh',
              ),
            ),
          ),
          const _Section(
            title: 'Skeleton',
            child: FaSkeleton(
              child: Column(
                children: [
                  FaSkeletonBox(height: 72),
                  SizedBox(height: FaSpace.x12),
                  Row(
                    children: [
                      Expanded(child: FaSkeletonBox(height: 140)),
                      SizedBox(width: FaSpace.x12),
                      Expanded(child: FaSkeletonBox(height: 140)),
                    ],
                  ),
                ],
              ),
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
                Text('24 / w600 — dialog title', style: text.s24.w600),
                Text('14 / w600 — cardTitle', style: text.cardTitle),
                Text('14 / w400 — body', style: text.body),
                Text('14 / w600 — bodyStrong', style: text.bodyStrong),
                Text('13 / w400 — dialog text action', style: text.s13.w400),
                Text('12 / w500 — pillLabel', style: text.pillLabel),
                Text('11 / w400 — caption', style: text.caption),
                Text('10 / w400 — card hint', style: text.s10.w400),
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

class _ActivityCard extends StatelessWidget {
  const _ActivityCard({
    required this.icon,
    required this.title,
    required this.hint,
    required this.status,
    this.tone = FaTone.brand,
  });

  final FaIconAsset icon;
  final FaTone tone;
  final String title;
  final String hint;
  final Widget status;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
    return FaCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FaIconTile(icon: icon, tone: tone),
              const Spacer(),
              status,
            ],
          ),
          const SizedBox(height: FaSpace.x10),
          Text(
            title,
            style: text.cardTitle.copyWith(color: colors.textPrimary),
          ),
          const SizedBox(height: FaSpace.x2),
          Text(
            hint,
            style: text.s10.w400.copyWith(color: colors.textSecondary),
          ),
          const SizedBox(height: FaSpace.x10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FaIconCircleButton(icon: FaIcons.visibility, onTap: () {}),
              Flexible(
                child: FaButton(
                  label: 'Proceed',
                  variant: FaButtonVariant.outlined,
                  size: FaButtonSize.compact,
                  trailingIcon: FaIcons.arrowOutward,
                  onTap: () {},
                ),
              ),
            ],
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
