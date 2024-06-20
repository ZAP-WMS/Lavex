import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/custom_text.dart';
import '../../../data/model/bom_add_item.dart';
import '../../../utils/colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_scaffold.dart';
import '../../../widgets/custom_spacebar.dart';
import '../../../widgets/custom_textform.dart';
import '../../../widgets/drop_downTextField.dart';
import '../../../widgets/icon_with_text.dart';
import '../../controller/bom_additem_controller.dart';

class BomAddItem extends StatelessWidget {
  BomAddItem({super.key});
  TextEditingController paymentController = TextEditingController();
  final BomAddItemController controller = Get.put(BomAddItemController());

  @override
  Widget build(BuildContext context) {
    bool isaddItem =
        controller.bomItems.isNotEmpty && controller.bomItems.last == true;
    List<String> paymentField = [
      'Name',
      'Stock Status',
    ];

    List<String> clients = [
      'Show only paid, unpaid invoices',
      'Show only paid invoices',
      'Show only unpaid invoices',
      'Show only partially paid invoices',
    ];
    return CommonScaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            direction: Axis.horizontal,
            children: paymentField.asMap().entries.map((entry) {
              //    int index = entry.key;
              String field = entry.value;
              if (field == 'Name' || field == 'Stock Status') {
                // Render dropdown for Client Name
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CTextBlack(field, mBold: true, mSize: 14),
                      SizedBox(
                        width: 300,
                        height: 35,
                        child: DropdownTextField<String>(
                            items: clients,
                            hintText: field,
                            itemAsString: (item) => item,
                            onChanged: (value) {}),
                      ),
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomField(
                    width: 300,
                    height: 35,
                    name: field,
                    controller: paymentController,
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
                  ),
                );
              }
            }).toList(),
          ),
          verticalSpace(10),
          Row(children: [
            CustomButton(text: 'Download Excel', onPressed: () {}),
            horizontalSpace(10),
            CustomButton(text: 'Download Pdf', onPressed: () {})
          ]),
          verticalSpace(15),
          CTextBlack('WareHouse Product Details'),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: greyColor)),
            child: Obx(
              () => DataTable(
                  columnSpacing: 30,
                  columns: const <DataColumn>[
                    DataColumn(
                        label: Text('Item', textAlign: TextAlign.center)),
                    DataColumn(
                        label:
                            Text('Quantity Type', textAlign: TextAlign.center)),
                    DataColumn(
                        label: Text('Quantity', textAlign: TextAlign.center)),
                    DataColumn(
                        label: Text('Action', textAlign: TextAlign.center)),
                  ],
                  rows: [
                    DataRow(
                        cells: List.generate(4, (index) {
                      return DataCell(Container(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        width: 200,
                        child: index == 3
                            ? GestureDetector(
                                onTap: () {
                                  final BomAddItemModel newItem =
                                      BomAddItemModel(
                                          title: '',
                                          quantityType: 'quantityType',
                                          quantity: 1,
                                          action: 'action');
                                  controller.addItem(newItem);
                                },
                                child: CTextBlack('Remove Row',
                                    mSize: 15, mBold: false))
                            : TextFormField(
                                decoration: const InputDecoration(),
                                onChanged: (value) {
                                  // Handle onChanged event
                                },
                              ),
                      ));
                    }))
                  ]..addAll(controller.bomItems.asMap().entries.map((entry) {
                      int indexx = entry.key;
                      BomAddItemModel item = entry.value;
                      bool isLastItem =
                          indexx == controller.bomItems.length - 1;
                      print('isLast$item $isLastItem');
                      return DataRow(cells: [
                        DataCell(Container(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          width: 200,
                          child: TextFormField(
                            controller: paymentController,
                            // initialValue: item.item.toString(),
                            onChanged: (value) {
                              //        _itemNameController.text = value;
                              // Update the item name when user changes it
                            },
                          ),
                        )),
                        DataCell(Container(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          width: 200,
                          child: TextFormField(
                            controller: paymentController,
                            //    initialValue: item.brand.toString(),
                            onChanged: (value) {
                              // Update the brand when user changes it
                            },
                          ),
                        )),
                        DataCell(Container(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          width: 200,
                          child: TextFormField(
                            controller: paymentController,
                            //    initialValue: item.quantity.toString(),
                            onChanged: (value) {
                              // Update the quantity when user changes it
                            },
                          ),
                        )),
                        DataCell(Container(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            width: 200,
                            child: CTextBlack('Remove Row',
                                mSize: 15, mBold: false))),
                      ]);
                    }).toList())),
            ),
          ),
          IconWithText(
            iconData: Icons.add,
            text: 'Add Item',
            onPressed: () {
              // Add new item to the cartItems list
              BomAddItemModel newItem = BomAddItemModel(
                  title: 'title',
                  quantityType: 'quantityType',
                  quantity: 1,
                  action: 'action');
              controller.addItem(newItem);
            },
          ),
        ],
      ),
    ));
  }
}
