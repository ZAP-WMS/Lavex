import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CTextWhite extends StatelessWidget {
  String mTitle;
  bool? mBold;
  TextStyle? textStyle;
  double? mSize;

  CTextWhite(this.mTitle,
      {this.textStyle, this.mBold = false, this.mSize = 180});

  @override
  Widget build(BuildContext context) {
    return Text(
      mTitle,
      style: textStyle,
      textAlign: TextAlign.start,
    );
  }
}
