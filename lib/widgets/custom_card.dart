import 'package:flutter/material.dart';
import 'package:lavex/common/custom_text.dart';

Widget cards(BuildContext context, String desc, String image, int index) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Flexible(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.height * 0.15,
          child: Image.asset(
            height: 100,
            width: 100,
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Expanded(child: CTextBlack(desc, mBold: true, mSize: 15))
    ],
  );
}
