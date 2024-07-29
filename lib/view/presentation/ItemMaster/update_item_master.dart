import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/add_item.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import '../../../common/custom_text.dart';
import '../../../data/model/getitemmodel.dart';
import '../../../data/model/update_itemModel.dart';
import '../../../routes/route_pages.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_spacebar.dart';
import '../../../widgets/custom_textform.dart';
import '../../../widgets/drop_downTextField.dart';
import '../../controller/item_master_controller.dart';

class UpdateItemMaster extends StatelessWidget {
  ItemMasterData itemMasterModel;
  UpdateItemMaster({super.key, required this.itemMasterModel});
  TextEditingController nameController = TextEditingController(text: "Hello");
  TextEditingController qtyController = TextEditingController();
  TextEditingController qtyTypeController = TextEditingController();
  TextEditingController itemCodeController = TextEditingController();
  TextEditingController storeController = TextEditingController();
  TextEditingController manufacturerController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController quantityTypeController = TextEditingController();
  TextEditingController lawQtyController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController hsnCodeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController stockStatusController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  final ItemMasterController itemMasterController =
      Get.put(ItemMasterController());
  Rx<bool> Loader = Rx<bool>(true);
  String name = "";
  List<String> paymentField = [
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
  List<ItemMasterData> Itemraw = [];

  List<String> clients = [
    'Show only paid, unpaid invoices',
    'Show only paid invoices',
    'Show only unpaid invoices',
    'Show only partially paid invoices',
  ];
  String Clients = "";
  List<String> QtyType = [
    'Box',
    'Roll',
    'Pcs',
    'Pkt',
  ];

  String qtyType = "";
  List<String> GST = [
    '10',
    '15',
    '18',
    '24',
  ];
  String gst = "";
  List<String> brand = [
    "Softx",
    "Lavex",
    "Dhadhis",
    "Century",
    "Orient",
    "Orient",
    "Bhageshwari",
    "Pudumjee",
    "Plain",
    "Other",
  ];
  String Brand = "";
  List<String> store = [
    "Unite 1",
    "Unite 2",
  ];

  String Store = "";
  List<String> SS = ['Part', 'ReadyStock', 'Fixasset', 'Raw'];
  RxString SStatus = "".obs;
  @override
  Widget build(BuildContext context) {
    var controller = [
      nameController,
      qtyController,
      qtyTypeController,
      itemCodeController,
      storeController,
      manufacturerController,
      brandController,
      quantityTypeController,
      lawQtyController,
      priceController,
      gstController,
      hsnCodeController,
      categoryController,
      quantityController,
      stockStatusController,
      currencyController,
      statusController,
    ];
    nameController.text = itemMasterModel.name.toString();
    SStatus.value = itemMasterModel.stockStatus.toString();
    Store = itemMasterModel.store.toString();
    Brand = itemMasterModel.brand.toString();
    itemCodeController.text = itemMasterModel.itemCode.toString();
    qtyController.text = itemMasterModel.qty.toString();
    priceController.text = itemMasterModel.price.toString();
    categoryController.text = itemMasterModel.category.toString();
    hsnCodeController.text = itemMasterModel.hsnCode.toString();
    lawQtyController.text = itemMasterModel.lawqty.toString();
    manufacturerController.text = itemMasterModel.manufacturar.toString();
    qtyType = itemMasterModel.qtyType.toString();
    gst = itemMasterModel.gst.toString();
    Itemraw = itemMasterController.itemMasterModel
        .where((f) => f.stockStatus != "ReadyStock")
        .toList();
    return CommonScaffold(
        body: Obx(() => Loader.value
            ? Column(
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    children: paymentField.asMap().entries.map((entry) {
                      int index = entry.key;
                      String field = entry.value;
                      if (field == 'Qty Type' ||
                          field == 'Manufacturer' ||
                          field == 'Quantity Type' ||
                          field == 'Currency' ||
                          field == 'Status') {
                        // Render dropdown for Client Name
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CTextBlack(field, mBold: true, mSize: 14),
                              Container(
                                width: 300,
                                height: 35,
                                child: DropdownTextField<String>(
                                  initialValue: itemMasterModel.qtyType,
                                  items: QtyType,
                                  hintText: field,
                                  itemAsString: (item) => item,
                                  onChanged: (value) {
                                    qtyType = value ?? "";
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (field == 'GST %') {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CTextBlack(field, mBold: true, mSize: 14),
                              Container(
                                width: 300,
                                height: 35,
                                child: DropdownTextField<String>(
                                  initialValue: itemMasterModel.gst.toString(),
                                  items: GST,
                                  hintText: field,
                                  itemAsString: (item) => item,
                                  onChanged: (value) {
                                    gst = value ?? "";
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (field == 'Stock Status') {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CTextBlack(field, mBold: true, mSize: 14),
                              Container(
                                width: 300,
                                height: 35,
                                child: DropdownTextField<String>(
                                  items: SS,
                                  initialValue: SStatus.value,
                                  hintText: field,
                                  itemAsString: (item) => item,
                                  onChanged: (value) {
                                    SStatus.value = value ?? "";
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (field == 'Brand') {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CTextBlack(field, mBold: true, mSize: 14),
                              Container(
                                width: 300,
                                height: 35,
                                child: DropdownTextField<String>(
                                  items: brand,
                                  initialValue: Brand,
                                  hintText: field,
                                  itemAsString: (item) => item,
                                  onChanged: (value) {
                                    Brand = value ?? "";
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (field == 'Store') {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CTextBlack(field, mBold: true, mSize: 14),
                              Container(
                                width: 300,
                                height: 35,
                                child: DropdownTextField<String>(
                                  items: store,
                                  initialValue: Store,
                                  hintText: field,
                                  itemAsString: (item) => item,
                                  onChanged: (value) {
                                    Store = value ?? "";
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SStatus.value != "ReadyStock" &&
                                  field == 'Name'
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CTextBlack(field, mBold: true, mSize: 14),
                                    Container(
                                      width: 300,
                                      height: 35,
                                      child: DropdownTextField<String>(
                                        items:
                                            Itemraw.map((f) => f.name as String)
                                                .toList(),
                                        hintText: field,
                                        initialValue: itemMasterModel.name,
                                        itemAsString: (item) => item,
                                        onChanged: (value) {
                                          name = value ?? "";
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : CustomField(
                                  width: 300,
                                  height: 35,
                                  name: field,
                                  controller: controller[index],
                                  style:
                                      TextStyle(), // Define your normalTextStyle here
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
                    CustomButton(
                        text: 'Add Item',
                        onPressed: () {
                          print(qtyController.text);
                          var data = updateItemMasterModel(
                              name: SStatus.value == "ReadyStock"
                                  ? nameController.text
                                  : name,
                              hsnCode:
                                  int.parse(hsnCodeController.text.toString()),
                              stockStatus: SStatus.value.toString(),
                              category: categoryController.text,
                              store: Store.toString() ?? "",
                              qty: int.parse(qtyController.text.toString()),
                              qtyType: qtyType.toString(),
                              gst: int.parse(gst),
                              lawqty: int.parse(lawQtyController.text),
                              brand: Brand,
                              qtyType2: quantityTypeController.text,
                              price: int.parse(priceController.text));
                          print(data);
                          // Loader(false);
                          ApiServices()
                              .updateItemData(data, itemMasterModel.sId ?? "")
                              .whenComplete(() {
                            itemMasterController.itemMasterData();
                            Loader(true);
                          });
                          // if (check) {
                          //   print("object");
                          //   Get.offAndToNamed(AppRoutes.itemmaster);
                          // }
                        }),
                    horizontalSpace(10),
                    CustomButton(text: 'Cancel', onPressed: () {})
                  ]),
                ],
              )
            : Center(child: CircularProgressIndicator())));
  }
}
