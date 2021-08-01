import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget(
      {required this.title, required this.defaultVals, required this.row});

  final String title;
  final int defaultVals;
  final Widget row;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xFF111428),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white54,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                defaultVals.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          row,
        ],
      ),
    );
  }
}
