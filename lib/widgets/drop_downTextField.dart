import 'package:flutter/material.dart';
import 'package:lavex/utils/colors.dart';
import '../common/custom_text.dart';

class DropdownTextField<T> extends StatefulWidget {
  final List<T> items;
  final String hintText;
  final T? initialValue;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemAsString;

  DropdownTextField({
    required this.items,
    required this.hintText,
    required this.onChanged,
    required this.itemAsString,
    this.initialValue,
  });

  @override
  _DropdownTextFieldState<T> createState() => _DropdownTextFieldState<T>();
}

class _DropdownTextFieldState<T> extends State<DropdownTextField<T>> {
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: greyColor)),
      child: DropdownButton<T>(
        isExpanded: true,
        underline: Container(),
        value: _selectedItem,
        hint: CTextBlack(widget.hintText, mBold: false, mSize: 16),
        items: widget.items.map((T item) {
          return DropdownMenuItem<T>(
            alignment: Alignment.centerLeft,
            value: item,
            child: Text(widget.itemAsString(item)),
          );
        }).toList(),
        onChanged: (T? value) {
          setState(() {
            _selectedItem = value;
          });
          widget.onChanged(value);
        },
      ),
    );
  }
}
