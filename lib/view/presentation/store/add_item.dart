import 'package:flutter/material.dart';
import 'package:lavex/common/custom_text.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import 'package:lavex/widgets/custom_textform.dart';
import '../../../utils/string.dart';
import '../../../utils/style.dart';
import '../../../widgets/drop_downTextField.dart';

class AddItem extends StatelessWidget {
  AddItem({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController qtyTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        body: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomField(
                width: 300,
                height: 40,
                name: forUnitTxt,
                controller: nameController,
                style: normalTextStyle,
                isreadOnly: false,
                isSuffixIcon: false,
                validator: (value) {}),
            CustomField(
                width: 300,
                height: 40,
                name: forUnitTxt,
                controller: nameController,
                style: normalTextStyle,
                isreadOnly: false,
                isSuffixIcon: false,
                validator: (value) {}),
            CustomField(
                width: 300,
                height: 40,
                name: forUnitTxt,
                controller: nameController,
                style: normalTextStyle,
                isreadOnly: false,
                isSuffixIcon: false,
                validator: (value) {}),
          ],
        ),
        verticalSpace(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTextBlack(itemCodeTxt, mBold: false, mSize: 15),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: DropdownTextField<String>(
                    items: const ['Option 1', 'Option 2', 'Option 3'],
                    hintText: selectTxt,
                    itemAsString: (item) => item,
                    onChanged: (value) {
                      print('Selected: $value');
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTextBlack(storeTxt, mBold: false, mSize: 15),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: DropdownTextField<String>(
                    items: const ['Option 1', 'Option 2', 'Option 3'],
                    hintText: selectTxt,
                    itemAsString: (item) => item,
                    onChanged: (value) {
                      print('Selected: $value');
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTextBlack(manufactureTxt, mBold: false, mSize: 15),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: DropdownTextField<String>(
                    items: const ['Option 1', 'Option 2', 'Option 3'],
                    hintText: selectTxt,
                    itemAsString: (item) => item,
                    onChanged: (value) {
                      print('Selected: $value');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        verticalSpace(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTextBlack(quantityTypeTxt, mBold: false, mSize: 15),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: DropdownTextField<String>(
                    items: const ['Option 1', 'Option 2', 'Option 3'],
                    hintText: selectTxt,
                    itemAsString: (item) => item,
                    onChanged: (value) {
                      print('Selected: $value');
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTextBlack(lawquantityTypeTxt, mBold: false, mSize: 15),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: DropdownTextField<String>(
                    items: const ['Option 1', 'Option 2', 'Option 3'],
                    hintText: selectTxt,
                    itemAsString: (item) => item,
                    onChanged: (value) {
                      print('Selected: $value');
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTextBlack(priceTxt, mBold: false, mSize: 15),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: DropdownTextField<String>(
                    items: const ['Option 1', 'Option 2', 'Option 3'],
                    hintText: selectTxt,
                    itemAsString: (item) => item,
                    onChanged: (value) {
                      print('Selected: $value');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        verticalSpace(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTextBlack('HSN Code', mBold: false, mSize: 15),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: DropdownTextField<String>(
                    items: const ['Option 1', 'Option 2', 'Option 3'],
                    hintText: selectTxt,
                    itemAsString: (item) => item,
                    onChanged: (value) {
                      print('Selected: $value');
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTextBlack(categoryTypeTxt, mBold: false, mSize: 15),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: DropdownTextField<String>(
                    items: const ['Option 1', 'Option 2', 'Option 3'],
                    hintText: selectTxt,
                    itemAsString: (item) => item,
                    onChanged: (value) {
                      print('Selected: $value');
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTextBlack(quantityTxt, mBold: false, mSize: 15),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: DropdownTextField<String>(
                    items: const ['Option 1', 'Option 2', 'Option 3'],
                    hintText: selectTxt,
                    itemAsString: (item) => item,
                    onChanged: (value) {
                      print('Selected: $value');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        verticalSpace(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTextBlack(currencyTxt, mBold: false, mSize: 15),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: DropdownTextField<String>(
                    items: const ['Option 1', 'Option 2', 'Option 3'],
                    hintText: selectTxt,
                    itemAsString: (item) => item,
                    onChanged: (value) {
                      print('Selected: $value');
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CTextBlack(statusTxt, mBold: false, mSize: 15),
                SizedBox(
                  height: 40,
                  width: 300,
                  child: DropdownTextField<String>(
                    items: const ['Option 1', 'Option 2', 'Option 3'],
                    hintText: selectTxt,
                    itemAsString: (item) => item,
                    onChanged: (value) {
                      print('Selected: $value');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
              width: 300,
            ),
          ],
        ),
        verticalSpace(20),
        Row(
          children: [
            CustomButton(
                text: 'Save Item',
                onPressed: () {
                  // ApiServices().postItemData(AddItemModel(
                  //     forUser: forUser,
                  //     forCompany: forCompany,
                  //     name: nameController.text,
                  //     manufacturerName: manufacturerName,
                  //     itemCode: itemCode,
                  //     quantity: quantity,
                  //     quantityType: quantityType,
                  //     lowQuantity: lowQuantity,
                  //     singlePrice: singlePrice,
                  //     currency: currency,
                  //     gstRate: gstRate,
                  //     hsnCode: hsnCode,
                  //     stockStatus: stockStatus,
                  //     storeId: storeId,
                  //     brandName: brandName,
                  //     category: category,
                  //     storeName: storeName,
                  //     total: total,
                  //     qtySingleP: qtySingleP,
                  //     qtyTypeSingleP: qtyTypeSingleP,
                  //     status: status
                  //     ));
                }),
            horizontalSpace(10),
            CustomButton(text: 'Cancel', onPressed: () {})
          ],
        )
      ],
    ));
  }
}
