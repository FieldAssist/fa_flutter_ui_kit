import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class IntegratedSearchTextField extends StatefulWidget {
  const IntegratedSearchTextField({
    required this.searchFieldLabel,
    this.keyboardType,
    this.textInputAction,
    this.onSubmitted,
    this.prefixIcon,
    this.bgColor,
    this.onTap,
    this.elevation,
    this.autoFocus,
    this.searchThroughMic = false,
    this.onMicTap,
    required this.queryTextController,
    this.showCrossbutton = false,
    this.borderRadius = 5,
    this.trailing,
    Key? key,
  }) : super(key: key);

  final double? elevation;
  final Color? bgColor;
  final Icon? prefixIcon;
  final String searchFieldLabel;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String query)? onSubmitted;
  final TextEditingController queryTextController;
  final VoidCallback? onTap;
  final bool? autoFocus;
  final bool showCrossbutton;
  final bool searchThroughMic;
  final VoidCallback? onMicTap;
  final double borderRadius;

  // [REQ-177] Optional widget rendered beside the search field (e.g. a filter button).
  // Null by default, so every existing consumer's widget tree is unchanged.
  final Widget? trailing;

  // final SearchListBloc _searchListBloc=SearchListBloc();

  @override
  _IntegratedSearchTextFieldState createState() =>
      _IntegratedSearchTextFieldState();
}

class _IntegratedSearchTextFieldState extends State<IntegratedSearchTextField> {
  stt.SpeechToText speech = stt.SpeechToText();
  String recognizedText = '';
  FlutterTts _flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    final searchCard = Card(
      elevation: widget.elevation ?? 0,
      child: TextField(
        onTap: widget.onTap,
        controller: widget.queryTextController,
        style: TextStyle(color: Colors.black),
        autofocus: widget.autoFocus ?? true,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.bgColor,
          prefixIcon: widget.prefixIcon,
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          hintText: widget.searchFieldLabel,
          suffixIcon: Row(
            children: <Widget>[
              if (widget.showCrossbutton)
                Container(
                  width: 18,
                  height: 18,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: InkWell(
                    onTap: widget.queryTextController.clear,
                    child: Icon(
                      Icons.close,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              if (widget.searchThroughMic)
                SizedBox(
                  width: 20,
                  child: IconButton(
                    onPressed: widget.onMicTap ??
                        () async {
                          await _speakPrompt();
                          await Future.delayed(
                            const Duration(seconds: 1),
                          );
                          var available = await speech.initialize();
                          if (available) {
                            await speech.listen(
                              onResult: (result) {
                                setState(() {
                                  print(widget.queryTextController.text);
                                  recognizedText = result.recognizedWords;
                                  widget.queryTextController.text =
                                      recognizedText;
                                });
                                if (result.finalResult) {
                                  speech.stop();
                                }
                              },
                            );
                          }
                        },
                    icon: Icon(Icons.mic),
                  ),
                ),
            ],
          ),
          suffixIconConstraints: BoxConstraints(
            maxHeight: 38,
            maxWidth: 38,
          ),
          hintStyle: TextStyle(
            color: Colors.black26,
          ),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: widget.trailing == null
          ? searchCard
          : Row(
              children: <Widget>[
                Expanded(child: searchCard),
                widget.trailing!,
              ],
            ),
    );
  }

  Future<void> _speakPrompt() async {
    await _flutterTts.speak('Please speak now.');
  }
}
