import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextStyle style;
  final String? image;
  String? name;
  TextEditingController controller = TextEditingController();
  bool isSuffixIcon = false;
  bool isreadOnly = false;
  double? width;
  double? height;
  Icon? icon;

  String? Function(String?)? validator;
  CustomTextFormField(
      {super.key,
      required this.controller,
      required this.name,
      required this.style,
      this.image,
      this.validator,
      this.isSuffixIcon = false,
      this.isreadOnly = false,
      this.width,
      this.height,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: TextFormField(
              readOnly: isreadOnly,
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  hintText: name,
                  prefixIcon: icon,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 2)),
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              onFieldSubmitted: (value) {
                
              },
              onChanged: (value) {},
              // onChanged: (value) {
              //   saveDataToSharedPreferences(controller.text, value);
              // },
              validator: validator!),
        ),
      ],
    );
  }
}
