import 'package:flutter/material.dart';

import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';
import 'fa_field_label.dart';
import 'fa_text_field.dart';

/// MT 2.0's photo question: an "Attach Image" field that adds one more photo
/// per tap, and a row of thumbnails, each with remove and view buttons.
class FaImagesField extends StatelessWidget {
  const FaImagesField({
    required this.label,
    required this.attachLabel,
    required this.images,
    required this.onView,
    this.onAdd,
    this.onRemove,
    this.isRequired = false,
    this.errorText,
    super.key,
  });

  static const double _thumbSize = 48;
  static const double _badgeSize = 16;
  static const double _badgeIconSize = 12;

  // Figma's 39% black wash, so the badges read on any photo.
  static const double _washOpacity = 0.39;

  final String label;
  final String attachLabel;
  final List<ImageProvider> images;
  final ValueChanged<int> onView;

  /// Null hides the attach field and the remove buttons: a form opened only
  /// to look.
  final VoidCallback? onAdd;
  final ValueChanged<int>? onRemove;

  final bool isRequired;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
    final errorText = this.errorText;
    final onAdd = this.onAdd;
    final danger = colors.status.danger.solid;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FaFieldLabel(label, isRequired: isRequired),
        if (onAdd != null)
          Semantics(
            button: true,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onAdd,
              child: Container(
                constraints:
                    const BoxConstraints(minHeight: FaTextField.minHeight),
                padding: const EdgeInsets.symmetric(horizontal: FaSpace.x12),
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(FaRadius.md),
                  border: Border.all(
                    color: errorText == null ? colors.borderStrong : danger,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        attachLabel,
                        style:
                            text.bodyStrong.copyWith(color: colors.textStrong),
                      ),
                    ),
                    Icon(Icons.attach_file, size: 20, color: colors.icon),
                  ],
                ),
              ),
            ),
          ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(
              left: FaSpace.x12,
              top: FaSpace.x6,
            ),
            child: Text(
              errorText,
              style: text.s12.w400.copyWith(color: danger),
            ),
          ),
        if (images.isNotEmpty) ...[
          const SizedBox(height: FaSpace.x8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var i = 0; i < images.length; i++) ...[
                  if (i > 0) const SizedBox(width: FaSpace.x10),
                  _thumb(context, i),
                ],
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _thumb(BuildContext context, int index) {
    final colors = context.faColors;
    final onRemove = this.onRemove;
    return ClipRRect(
      borderRadius: BorderRadius.circular(FaRadius.chip),
      child: SizedBox.square(
        dimension: _thumbSize,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(image: images[index], fit: BoxFit.cover),
            ColoredBox(
              color: colors.textPrimary.withValues(alpha: _washOpacity),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (onRemove != null) ...[
                  _badge(
                    context,
                    icon: Icons.delete_forever,
                    color: colors.status.danger.solid,
                    onTap: () => onRemove(index),
                  ),
                  const SizedBox(width: FaSpace.x4),
                ],
                _badge(
                  context,
                  icon: Icons.visibility,
                  color: colors.brand,
                  onTap: () => onView(index),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: _badgeSize,
          height: _badgeSize,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(
            icon,
            size: _badgeIconSize,
            color: context.faColors.onBrand,
          ),
        ),
      );
}
