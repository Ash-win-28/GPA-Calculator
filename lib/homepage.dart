import 'package:flutter/material.dart';
import 'bodyWidgets.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0D22),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0D22),
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        elevation: 0.0,
      ),
      body: BodyWidgets(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
