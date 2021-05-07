import 'package:flutter/material.dart';

class MyLinearProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      child: LinearProgressIndicator(
        //TODO: (Samvit) Set value according to progress
        minHeight: 8,
        backgroundColor: Colors.grey
            .shade200, //TODO: (Samvit) Define background color in main theme
      ),
    );
  }
}
