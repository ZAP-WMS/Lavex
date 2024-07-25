import 'package:flutter/material.dart';
import '../utils/get_size.dart';
import 'app_decoration.dart';

class CTextWhite extends StatelessWidget {
  String mTitle;
  bool? mBold;
  double? mSize;

  CTextWhite(this.mTitle, {this.mBold = false, this.mSize = 18});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.mTitle,
      style: AppStyles.getTextStyleWhite(
          this.mBold!,
          getSize(
            this.mSize!,
            context,
          )),
    );
  }
}

class CTextBlack extends StatelessWidget {
  String mTitle;
  bool? mBold;
  double? mSize;

  CTextBlack(this.mTitle, {this.mBold = false, this.mSize = 18});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.mTitle,
        textAlign: TextAlign.center,
        style: AppStyles.getTextStyleBlack(
            this.mBold!,
            getSize(
              this.mSize!,
              context,
            )),
      ),
    );
  }
}

class CTextRed extends StatelessWidget {
  String mTitle;
  bool? mBold;
  double? mSize;

  CTextRed(this.mTitle, {this.mBold = false, this.mSize = 18});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.mTitle,
      style: AppStyles.getTextStyleRed(
          this.mBold!,
          getSize(
            this.mSize!,
            context,
          )),
    );
  }
}
