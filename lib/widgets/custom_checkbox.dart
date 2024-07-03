import 'package:flutter/material.dart';

class MyCheckbox extends StatelessWidget {
  bool? checkedvalue;
  String? titleName;
  final ValueChanged<bool?>? onChanged;
  double? width;
  MyCheckbox(
      {super.key,
      this.checkedvalue = false,
      required this.titleName,
      required this.onChanged,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Text(titleName!),
        value: checkedvalue,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
