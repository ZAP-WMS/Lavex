import 'package:flutter/material.dart';
import 'package:lavex/widgets/custom_spacebar.dart';

import '../utils/style.dart';

class CustomField extends StatelessWidget {
  TextStyle style;
  final String? image;
  String? name;
  TextEditingController controller = TextEditingController();
  bool isSuffixIcon = false;
  bool isreadOnly = false;
  double? width;
  double? height;
  String? Function(String?)? validator;

  CustomField(
      {super.key,
      required this.controller,
      required this.name,
      required this.style,
      this.image,
      this.validator,
      this.isSuffixIcon = false,
      this.isreadOnly = false,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(textAlign: TextAlign.start, name!, style: smallTextStyle),
          verticalSpace(5),
          SizedBox(
              width: width,
              height: height,
              child: TextFormField(
                  readOnly: isreadOnly,
                  style: const TextStyle(fontSize: 15),
                  controller: controller,
                  textAlignVertical: TextAlignVertical.center,
                  validator: validator!)),
        ],
      ),
    );
  }
}
