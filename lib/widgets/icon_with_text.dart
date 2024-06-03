import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback? onPressed;

  IconWithText({required this.iconData, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed, // Call the onPressed callback when tapped
        child: Row(
          children: <Widget>[
            Icon(iconData), // Icon widget
            SizedBox(width: 8), // Add spacing between icon and text
            Text(text), // Text widget
          ],
        ));
  }
}
