import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  ButtonIcon({required this.iconData, required this.onPress});
  final IconData iconData;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Color(0xFF06C46B),
        ),
        child: IconButton(
          onPressed: onPress,
          icon: Icon(
            iconData,
            color: Colors.white,
            size: 25.0,
          ),
        ),
      ),
    );
  }
}
