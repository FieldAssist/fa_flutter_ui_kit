import 'package:flutter/material.dart';

import 'config/ui_common_colors.dart';
import 'config/ui_common_texts.dart';
import 'voice_search/voice_search_sheet.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    required this.onChanged,
    this.hintText,
    super.key,
  });

  final void Function(String) onChanged;
  final String? hintText;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 40,
      ),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        controller: _controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          fillColor: UiCommonColors.kBackgroundWhiteColor,
          isDense: true,
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            color: UiCommonColors.kLightGrey,
            size: 20,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.mic_none,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () => _showVoiceSheet(context),
          ),
          hintText: widget.hintText ?? UiCommonTexts().kSearchProducts,
          hintStyle: TextStyle(fontSize: 13, color: UiCommonColors.kBlack),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  void _showVoiceSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: UiCommonColors.kTransparent,
      builder: (_) => VoiceSearchSheet(
        onResult: (words) {
          _controller.text = words;
          _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: words.length),
          );
          widget.onChanged(words);
        },
      ),
    );
  }
}
