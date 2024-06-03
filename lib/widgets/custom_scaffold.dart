import 'package:flutter/material.dart';
import '../common/custom_text.dart';
import '../utils/colors.dart';
import '../utils/string.dart';
import 'custom_spacebar.dart';

class CommonScaffold extends StatelessWidget {
  final Widget body;

  CommonScaffold({required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: redColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                horizontalSpace(10),
                DropdownButton(
                    value: 'Change Company',
                    items: [
                      DropdownMenuItem(
                        value: 'Change Company',
                        child: CTextWhite('Change Company', mSize: 12),
                      ),
                    ],
                    onChanged: (value) {}),
                horizontalSpace(25),
                Row(
                  children: [
                    Icon(Icons.settings, color: whiteColor),
                    horizontalSpace(10),
                    CTextWhite(settingText, mSize: 14),
                    horizontalSpace(10),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 200,
                      height: 60,
                      child: TextField(
                        onChanged: (value) {
                          // Filter data based on the entered value
                        },
                        decoration: const InputDecoration(
                            hintText: 'Search...',
                            prefixIcon: Icon(Icons.search)),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                DropdownButton(
                    value: 'Change Language',
                    items: [
                      DropdownMenuItem(
                        value: 'Change Language',
                        child: CTextWhite(adminProfileText, mSize: 12),
                      ),
                    ],
                    onChanged: (value) {}),
                horizontalSpace(15),
                CTextWhite(adminProfileText, mSize: 12),
                horizontalSpace(15),
                CTextWhite(logoutText, mSize: 12),
                horizontalSpace(15),
              ],
            )
          ],
        ),
      ),
      body: body,
    );
  }
}
