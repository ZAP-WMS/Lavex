import 'package:flutter/material.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import '../../../widgets/custom_textform.dart';

class EditTable extends StatelessWidget {
  EditTable({super.key});

  final TextEditingController _controller = TextEditingController();
  List<String> editableField = [
    'Name',
    'Qty',
    'Qty Type',
    'Item Code',
    'Store',
    'Manufacturer',
    'Brand',
    'Quantity Type',
    'Law Quantity',
    'Price',
    'GST %',
    'HSN Code',
    'Category',
    'Quantity',
    'Stock Status',
    'Currency',
    'Status',
  ];
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        body: Column(
      children: [
        Wrap(
          direction: Axis.horizontal,
          children: editableField.asMap().entries.map((entry) {
            int index = entry.key;
            String field = entry.value;
            // if (field == 'Qty Type' ||
            //     field == 'Store' ||
            //     field == 'Manufacturer' ||
            //     field == 'Brand' ||
            //     field == 'Quantity Type' ||
            //     field == 'GST %' ||
            //     field == 'Stock Status' ||
            //     field == 'Currency' ||
            //     field == 'Status') {
            // Render dropdown for Client Name
            return Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomField(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 35,
                          name: field,
                          controller: _controller,
                          style:
                              const TextStyle(), // Define your normalTextStyle here
                          isreadOnly: false,
                          isSuffixIcon: false,
                          validator: (value) {
                            // Define your validator logic here
                            if (value == null || value.isEmpty) {
                              return 'Please enter $field';
                            }
                            return null;
                          },
                        ))
                  ],
                ));

            //}
            //  else {
            //   return Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: CustomField(
            //       width: 300,
            //       height: 35,
            //       name: field,
            //       controller: _controller,
            //       style: TextStyle(), // Define your normalTextStyle here
            //       isreadOnly: false,
            //       isSuffixIcon: false,
            //       validator: (value) {
            //         // Define your validator logic here
            //         if (value == null || value.isEmpty) {
            //           return 'Please enter $field';
            //         }
            //         return null;
            //       },
            //     ),
            //   );
            // }
          }).toList(),
        ),
      ],
    ));
  }
}
