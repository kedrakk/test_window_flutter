import 'package:flutter/material.dart';
import 'package:window_player/player_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Window Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlayerPage()
    );
  }
}