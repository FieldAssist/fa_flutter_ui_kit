import 'package:flutter/material.dart';

import '../../icons/fa_icons.dart';
import '../../theme/fa_theme_context.dart';
import '../../tokens/fa_radius.dart';
import '../../tokens/fa_spacing.dart';
import '../icon/fa_svg_icon.dart';
import 'fa_field_label.dart';

/// MT 2.0's single-image input. Empty, it invites a pick; while
/// [isUploading] it shows progress; once [hasImage], it shows [preview] (when
/// the image is on the device) and a remove button, and a tap picks again.
class FaImagePickerTile extends StatelessWidget {
  const FaImagePickerTile({
    required this.label,
    required this.hint,
    required this.attachedLabel,
    required this.hasImage,
    required this.onPick,
    required this.onRemove,
    this.preview,
    this.isUploading = false,
    super.key,
  });

  static const double height = 72;
  static const double _previewSize = 48;

  final String label;

  /// Shown while no image is attached.
  final String hint;

  /// Shown once an image is attached.
  final String attachedLabel;
  final bool hasImage;
  final bool isUploading;
  final ImageProvider? preview;
  final VoidCallback onPick;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    final text = context.faText;
    final brand = colors.status.brand;
    final preview = this.preview;
    final Widget content;
    if (isUploading) {
      content = Center(
        child: SizedBox.square(
          dimension: FaSpace.x24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: colors.brand,
          ),
        ),
      );
    } else if (hasImage) {
      content = Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(FaRadius.sm),
            child: SizedBox.square(
              dimension: _previewSize,
              child: preview == null
                  ? ColoredBox(
                      color: brand.tint,
                      child: Center(
                        child: Icon(Icons.image_outlined, color: brand.ink),
                      ),
                    )
                  : Image(image: preview, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: FaSpace.x12),
          Expanded(
            child: Text(
              attachedLabel,
              style: text.body.copyWith(color: colors.textPrimary),
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: Icon(Icons.close, color: colors.icon),
          ),
        ],
      );
    } else {
      content = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FaSvgIcon(FaIcons.addAPhoto),
          const SizedBox(width: FaSpace.x8),
          Flexible(
            child: Text(
              hint,
              style: text.body.copyWith(color: brand.ink),
            ),
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FaFieldLabel(label),
        Semantics(
          button: true,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: isUploading ? null : onPick,
            child: Container(
              constraints: const BoxConstraints(minHeight: height),
              padding: const EdgeInsetsDirectional.only(
                start: FaSpace.x12,
                end: FaSpace.x4,
              ),
              decoration: BoxDecoration(
                color: hasImage ? colors.surface : brand.tint,
                borderRadius: BorderRadius.circular(FaRadius.md),
                border: Border.all(
                  color: hasImage ? colors.border : brand.border,
                ),
              ),
              child: content,
            ),
          ),
        ),
      ],
    );
  }
}
