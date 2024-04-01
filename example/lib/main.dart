import 'package:flutter/material.dart';
import 'index_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      theme: ThemeData(useMaterial3: false),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => IndexScreen(),
      },
    );
  }
}
