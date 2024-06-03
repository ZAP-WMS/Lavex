import 'package:flutter/material.dart';
import 'package:lavex/common/custom_text.dart';
import 'package:lavex/utils/asset_image.dart';
import 'package:lavex/utils/colors.dart';
import 'package:lavex/widgets/rich_text.dart';

import '../../utils/style.dart';
import '../../widgets/custom_spacebar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CTextBlack('Profile', mSize: 24, mBold: true),
                LocalAssetImage(path: 'assets/login/bell.png')
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person),
                ),
                horizontalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.68,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CTextBlack('Pratyush', mSize: 20, mBold: true),
                          const Icon(
                            Icons.settings,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    CTextBlack('@pratyushpandey', mSize: 15),
                    Row(
                      children: [
                        Icon(Icons.star),
                        RichTextWidget(
                            title: '1200  ',
                            subtitle: 'coins',
                            titlestyle: smallTextStyle,
                            subtitleStyle: smallTextStyle),
                      ],
                    )
                  ],
                ),
              ],
            ),
            verticalSpace(10),
            Row(
              children: [
                CTextBlack('100 ', mSize: 24, mBold: true),
                CTextBlack('followers'),
                horizontalSpace(20),
                CTextBlack('100 ', mSize: 24, mBold: true),
                CTextBlack('followers'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
