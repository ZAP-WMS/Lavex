import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  String? title;
  String? subtitle;
  TextStyle? titlestyle;
  TextStyle? subtitleStyle;
  RichTextWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.titlestyle,
      required this.subtitleStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text.rich(
          TextSpan(text: title, style: titlestyle, children: <InlineSpan>[
        TextSpan(text: subtitle, style: subtitleStyle),
      ])),
    );
  }
}
