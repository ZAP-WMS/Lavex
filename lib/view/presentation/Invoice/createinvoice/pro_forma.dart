import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/common/custom_text.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/credit_note.dart';
import 'package:lavex/data/model/debit_note.dart';
import 'package:lavex/data/model/proforma_invoice.dart';
import 'package:lavex/datasource/create_invoice_datasource.dart';
import 'package:lavex/utils/colors.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/view/controller/cartItem_controller.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_checkbox.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import 'package:lavex/widgets/custom_textform.dart';
import 'package:lavex/widgets/cutom_textformfield.dart';
import 'package:lavex/widgets/icon_with_text.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../data/model/cart_item.dart';
import '../../../../data/model/get_client_model.dart';
import '../../../../data/model/invoice.dart';
import '../../../../utils/style.dart';
import '../../../controller/my_client_controller.dart';
import '../myinvoice/myInvoice..dart';

class PromaForm extends GetView<CartController> {
  String? pageTitle;
  final List<CartItem>? cartItems;
  PromaForm({super.key, this.cartItems, this.pageTitle});

  final TextEditingController clientController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController invoiceController = TextEditingController();
  final TextEditingController shortCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController increaseInvoiceController =
      TextEditingController();
  final TextEditingController toShippedController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController invoiceDateController = TextEditingController();
  final TextEditingController forToShippedController = TextEditingController();
  final TextEditingController stateCodeController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController selectedCurrencyController =
      TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController poNoController = TextEditingController();
  final TextEditingController maturityDateController = TextEditingController();
  final TextEditingController delieveryChallanController =
      TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();
  final TextEditingController paymentMethodController = TextEditingController();
  final TextEditingController toInvoiceNumberController =
      TextEditingController();
  final TextEditingController fromdateController = TextEditingController();

  // table controller
  final TextEditingController itemController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  List<GridColumn> columns = [];
  late CreateInvoiceDatasource _createInvoiceDatasource;
  final List<CartItem> _cartdata = [];
  final _formkey = GlobalKey<FormState>();
  final CartController controller = Get.put(CartController());
  final MyClientController myClientController = Get.put(MyClientController());
  @override
  Widget build(BuildContext context) {
    controller.getclientlist();
    double formWidth = MediaQuery.of(context).size.width * 0.2;

    // ignore: use_build_context_synchronously
    _createInvoiceDatasource = CreateInvoiceDatasource(_cartdata, context, '');

    columns.clear();

    for (String columnName in createInvoiceTable) {
      columns.add(
        GridColumn(
          columnName: columnName,
          visible: true,
          allowEditing:
              columnName == 'Total' || columnName == 'Gst' ? false : true,
          width: MediaQuery.of(context).size.width *
              0.09, // You can adjust this width as needed
          label: createColumnLabel(
            createInvoiceTable[createInvoiceTable.indexOf(columnName)],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Obx(
        () => Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: greyColor)),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        CustomField(
                            width: formWidth,
                            height: 50,
                            name: clientTxt,
                            controller: clientController,
                            style: normalTextStyle,
                            isreadOnly: false,
                            isSuffixIcon: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This Field is Required';
                              }
                              return null;
                            }),
                        horizontalSpace(10),
                        customAlertDialog(context, clientController)
                      ],
                    ),
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: addressTxt,
                        controller: addressController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is Required';
                          }
                          return null;
                        }),
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: pageTitle,
                        controller: invoiceController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is Required';
                          }
                          return null;
                        }),
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: cityTxt,
                        controller: cityController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is Required';
                          }
                          return null;
                        }),
                  ],
                ),
                MyCheckbox(
                  titleName: individualTxt,
                  checkedvalue: controller.individualValue.value,
                  onChanged: (value) {
                    controller.toggleCheckedValue('Individual', value);
                  },
                ),
                verticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.individualValue.value
                        ? SizedBox(width: formWidth, height: 50)
                        : CustomField(
                            width: formWidth,
                            height: 50,
                            name: shortCodeTxt,
                            controller: shortCodeController,
                            style: normalTextStyle,
                            isreadOnly: false,
                            isSuffixIcon: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This Field is Required';
                              }
                              return null;
                            }),
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: '$increaseFormaTxt $pageTitle',
                        controller: increaseInvoiceController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is Required';
                          }
                          return null;
                        }),
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: toShipedTxt,
                        controller: toShippedController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is Required';
                          }
                          return null;
                        }),
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: stateTxt,
                        controller: stateController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is Required';
                          }
                          return null;
                        }),
                  ],
                ),
                verticalSpace(10),
                controller.individualValue.value
                    ? SizedBox(width: formWidth, height: 50)
                    : MyCheckbox(
                        titleName: gstregistrationTxt,
                        checkedvalue: controller.gstValue.value,
                        onChanged: (value) {
                          controller.toggleCheckedValue('gst', value);
                        },
                      ),
                verticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: dateTxt,
                        controller: invoiceDateController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is Required';
                          }
                          return null;
                        }),
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: stateCodeTxt,
                        controller: stateCodeController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is Required';
                          }
                          return null;
                        }),
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: dueDateTxt,
                        controller: dueDateController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is Required';
                          }
                          return null;
                        }),
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: forToShipped,
                        controller: forToShippedController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is Required';
                          }
                          return null;
                        }),
                  ],
                ),
                MyCheckbox(
                  width: formWidth,
                  titleName: accountingTxt,
                  checkedvalue: controller.accountingValue.value,
                  onChanged: (value) {
                    controller.toggleCheckedValue('account', value);
                  },
                ),
                verticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: selectedCurrencyTxt,
                        controller: selectedCurrencyController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is Required';
                          }
                          return null;
                        }),
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: countryTxt,
                        controller: countryController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is Required';
                          }
                          return null;
                        }),
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: poTxt,
                        controller: poNoController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is Required';
                          }
                          return null;
                        }),
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: indicatingMaturityTxt,
                        controller: maturityDateController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is Required';
                          }
                          return null;
                        }),
                  ],
                ),
                verticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    pageTitle == 'Invoice'
                        ? CustomField(
                            width: formWidth,
                            height: 50,
                            name: deliveryChallanTxt,
                            controller: delieveryChallanController,
                            style: normalTextStyle,
                            isreadOnly: false,
                            isSuffixIcon: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This Field is Required';
                              }
                              return null;
                            })
                        : Container(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyCheckbox(
                      width: formWidth,
                      titleName: indicatingMaturityTxt,
                      checkedvalue: controller.maturityValue.value,
                      onChanged: (value) {
                        controller.toggleCheckedValue('maturity', value);
                      },
                    ),
                  ],
                ),
                controller.maturityValue.value
                    ? CustomField(
                        width: formWidth,
                        height: 50,
                        name: maturityTxt,
                        controller: maturityDateController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is Required';
                          }
                          return null;
                        })
                    : Container(),
                SizedBox(
                  height: 50,
                  width: formWidth,
                ),
                verticalSpace(10),
                SfDataGrid(
                  allowEditing: true,
                  editingGestureType: EditingGestureType.tap,
                  gridLinesVisibility: GridLinesVisibility.both,
                  headerGridLinesVisibility: GridLinesVisibility.both,
                  selectionMode: SelectionMode.single,
                  navigationMode: GridNavigationMode.cell,
                  columnWidthMode: ColumnWidthMode.auto,
                  source: _createInvoiceDatasource,
                  columns: columns,
                ),
                IconWithText(
                  iconData: Icons.add,
                  text: 'Add Item',
                  onPressed: () {
                    // Add new item to the cartItems list

                    _cartdata.add(CartItem(
                        item: 'item',
                        brand: 'Lavex',
                        quantity: 10,
                        gst: 18.00,
                        price: 15,
                        total: 150.00));
                    // controller.addItem(newItem);
                    _createInvoiceDatasource.buildDataGridRows();
                    _createInvoiceDatasource.updateDatagridSource();
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: formWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CTextBlack(
                              invoiceAmountTxt,
                              mSize: 14,
                            ),
                            const Text('0.00 INR')
                          ],
                        ),
                        verticalSpace(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CTextBlack(
                              discountTxt,
                              mSize: 14,
                            ),
                            Row(
                              children: [
                                CustomTextFormField(
                                    width: 50,
                                    height: 30,
                                    controller: discountController,
                                    name: '0.00',
                                    validator: (p0) {},
                                    style: normalTextStyle),
                                const Text('0.00 INR')
                              ],
                            )
                          ],
                        ),
                        verticalSpace(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CTextBlack(
                              taxIncludeTxt,
                              mSize: 14,
                            ),
                            const Text('0.00 INR')
                          ],
                        ),
                        verticalSpace(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CTextBlack(
                              grandTotalTxt,
                              mSize: 16,
                            ),
                            const Text('0.00 INR')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: CTextBlack(remarkTxt, mSize: 15, mBold: true)),
                    CustomTextFormField(
                      width: double.infinity,
                      name: '',
                      controller: remarkController,
                      style: normalTextStyle,
                      validator: (value) {},
                    ),
                    verticalSpace(20),
                    Row(
                      children: [
                        CTextBlack(paymentMethodTxt, mSize: 14, mBold: true),
                        horizontalSpace(20),
                        CustomTextFormField(
                          width: 250,
                          height: 30,
                          controller: paymentMethodController,
                          name: '',
                          style: normalTextStyle,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This Field is Required';
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ],
                ),
                verticalSpace(20),
                CustomButton(
                    width: 200,
                    text: createTxt,
                    onPressed: () {
                     // _loader.showLoading();
                      if (_formkey.currentState!.validate()) {
                        String invoiceText = invoiceController.text.isNotEmpty
                            ? invoiceController.text
                            : '0';
                        String quantityText = quantityController.text.isNotEmpty
                            ? quantityController.text
                            : '0';
                        String priceText = priceController.text.isNotEmpty
                            ? priceController.text
                            : '0';
                        String gstText = gstController.text.isNotEmpty
                            ? gstController.text
                            : '0';

                        String poText = poNoController.text.isNotEmpty
                            ? poNoController.text
                            : '0';

                        int invoiceNo = int.parse(invoiceText);
                        // int poNo = int.parse(poText);
                        int quantity = int.parse(quantityText);
                        double price = double.parse(priceText);
                        int gst = int.parse(gstText);
                        int poNo = int.parse(poText);
                        if (pageTitle == 'Pro-forma') {
                          ProformaItem itemdata = ProformaItem(
                              name: clientController.text,
                              brand: 'brandController.text',
                              quantity: quantity,
                              price: price,
                              gst: gst);
                          ProformaData data = ProformaData(
                              individual: controller.individualValue.value,
                              gstRegistration: controller.gstValue.value,
                              gstNumber: gstController.text,
                              selectCurrency: selectedCurrencyController.text,
                              clientDetail: ClientDetail(
                                  client: clientController.text,
                                  address: addressController.text,
                                  city: cityController.text,
                                  country: countryController.text,
                                  stateCode: stateCodeController.text),
                              porfarmaDetail: PorfarmaDetail(
                                  porfarmaNo: invoiceNo,
                                  invoiceDate: invoiceDateController.text,
                                  dueDate: dueDateController.text,
                                  maturityDate: maturityDateController.text,
                                  poNo: poNoController.text,
                                  cashAccounting:
                                      controller.accountingValue.value),
                              shippedDetail: ShippedDetail(
                                  toShipped: toShippedController.text,
                                  forToShipped: forToShippedController.text),
                              item: [itemdata]);

                          ProformaInvoiceModel proformaInvoiceModel =
                              ProformaInvoiceModel(data: data);
                          ApiServices().proFormaData(proformaInvoiceModel);
                        } else if (pageTitle == 'Invoice') {
                          String invoiceText = invoiceController.text.isNotEmpty
                              ? invoiceController.text
                              : '0';
                          String quantityText =
                              quantityController.text.isNotEmpty
                                  ? quantityController.text
                                  : '0';
                          String priceText = priceController.text.isNotEmpty
                              ? priceController.text
                              : '0';
                          String gstText = gstController.text.isNotEmpty
                              ? gstController.text
                              : '0';

                          int invoiceNo = int.parse(invoiceText);
                          // int poNo = int.parse(poText);
                          int quantity = int.parse(quantityText);
                          double price = double.parse(priceText);
                          int gst = int.parse(gstText);
                          InvoiceItem itemdata = InvoiceItem(
                              name: clientController.text,
                              brand: 'brandController.text',
                              quantity: quantity,
                              price: price,
                              gst: gst);
                          InvoiceData data = InvoiceData(
                              individual: controller.individualValue.value,
                              gstRegistration: controller.gstValue.value,
                              gstNumber: gstController.text,
                              selectCurrency: selectedCurrencyController.text,
                              chanlanType: delieveryChallanController.text,
                              invoiceclientDetail: InvoiceclientDetail(
                                  client: clientController.text,
                                  address: addressController.text,
                                  city: cityController.text,
                                  country: countryController.text,
                                  stateCode: stateCodeController.text),
                              invoiceDetail: InvoiceDetail(
                                  invoiceNo: invoiceNo,
                                  invoiceDate: invoiceDateController.text,
                                  dueDate: dueDateController.text,
                                  maturityDate: maturityDateController.text,
                                  poNo: poNo,
                                  cashAccounting:
                                      controller.accountingValue.value),
                              invoiceShippedDetail: InvoiceShippedDetail(
                                  toShipped: toShippedController.text,
                                  forToShipped: forToShippedController.text),
                              invoiceItem: [itemdata]);

                          CreateInvoiceModel createInvoiceModel =
                              CreateInvoiceModel(invoiceData: data);
                          ApiServices().invoiceData(createInvoiceModel);
                        } else if (pageTitle == 'Debit note') {
                          String invoiceText = invoiceController.text.isNotEmpty
                              ? invoiceController.text
                              : '0';
                          String quantityText =
                              quantityController.text.isNotEmpty
                                  ? quantityController.text
                                  : '0';
                          String priceText = priceController.text.isNotEmpty
                              ? priceController.text
                              : '0';
                          String gstText = gstController.text.isNotEmpty
                              ? gstController.text
                              : '0';
                          String toInvoiceNoText =
                              toInvoiceNumberController.text.isNotEmpty
                                  ? toInvoiceNumberController.text
                                  : '0';

                          int invoiceNo = int.parse(invoiceText);
                          // int poNo = int.parse(poText);
                          int quantity = int.parse(quantityText);
                          double price = double.parse(priceText);
                          int gst = int.parse(gstText);
                          int toInvoiceNo = int.parse(toInvoiceNoText);
                          DebitNoteItem itemdata = DebitNoteItem(
                              name: clientController.text,
                              brand: 'brandController.text',
                              quantity: quantity,
                              price: price,
                              gst: gst);
                          DebitNoteData data = DebitNoteData(
                            individual: controller.individualValue.value,
                            gstRegistration: controller.gstValue.value,
                            gstNumber: gstController.text,
                            selectCurrency: selectedCurrencyController.text,
                            suplierDetail: SuplierDetail(
                                suplier: supplierInvoiceNo,
                                address: addressController.text,
                                city: cityController.text,
                                country: countryController.text,
                                stateCode: stateCodeController.text),
                            debitNoteDetail: DebitNoteDetail(
                                debitNoteNo: invoiceNo,
                                toInvoiceNumber: toInvoiceNo,
                                fromDate: fromdateController.text,
                                invoiceDate: invoiceDateController.text,
                                dueDate: dueDateController.text,
                                maturityDate: maturityDateController.text,
                                poNo: poNo,
                                cashAccounting: controller.maturityValue.value),
                            debitNoteItem: [itemdata],
                          );
                          DebitNoteModel debitNoteModel =
                              DebitNoteModel(debitNoteData: data);
                          ApiServices().debitData(debitNoteModel);
                        } else if (pageTitle == 'Credit note') {
                          String invoiceText = invoiceController.text.isNotEmpty
                              ? invoiceController.text
                              : '0';
                          String quantityText =
                              quantityController.text.isNotEmpty
                                  ? quantityController.text
                                  : '0';
                          String priceText = priceController.text.isNotEmpty
                              ? priceController.text
                              : '0';
                          String gstText = gstController.text.isNotEmpty
                              ? gstController.text
                              : '0';
                          String toInvoiceNoText =
                              toInvoiceNumberController.text.isNotEmpty
                                  ? toInvoiceNumberController.text
                                  : '0';

                          int invoiceNo = int.parse(invoiceText);
                          // int poNo = int.parse(poText);
                          int quantity = int.parse(quantityText);
                          double price = double.parse(priceText);
                          int gst = int.parse(gstText);
                          int toInvoiceNo = int.parse(toInvoiceNoText);
                          CreditItem creditItem = CreditItem(
                              name: clientController.text,
                              brand: 'brandController.text',
                              quantity: quantity,
                              price: price,
                              gst: gst);
                          CreditData data = CreditData(
                            individual: controller.individualValue.value,
                            gstRegistration: controller.gstValue.value,
                            gstNumber: gstController.text,
                            selectCurrency: selectedCurrencyController.text,
                            creditclientDetail: CreditclientDetail(
                                client: clientController.text,
                                address: addressController.text,
                                city: cityController.text,
                                country: countryController.text,
                                stateCode: stateCodeController.text),
                            creditNoteDetail: CreditNoteDetail(
                                creditNoteNo: invoiceNo,
                                toInvoiceNumber: toInvoiceNo,
                                fromDate: fromdateController.text,
                                invoiceDate: invoiceDateController.text,
                                dueDate: dueDateController.text,
                                maturityDate: maturityDateController.text,
                                poNo: poNo,
                                cashAccounting: controller.maturityValue.value),
                            creditItem: [creditItem],
                          );
                          CreditNoteModel creditNoteModel =
                              CreditNoteModel(creditData: data);
                          ApiServices().creditData(creditNoteModel);
                        }
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  customAlertDialog(context, TextEditingController controller1) {
    return Container(
        child: Obx(
      () => controller.loader.value
          ? Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: greyColor,
                child: IconButton(
                  icon: const Icon(Icons.search),
                  iconSize: 15,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Select Client From List'),
                            content: SizedBox(
                              width: 500, // Set width to maximum
                              height: 500,
                              child: ListView.builder(
                                itemCount: controller.clientlist.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                      title: Text(controller.clientlist[index]),
                                      onTap: () {
                                        String selectedClient = controller
                                            .clientlist[index]
                                            .toString();
                                        controller1.text = selectedClient;
                                        MyClientModel data = myClientController
                                            .myClientModel
                                            .firstWhere((e) =>
                                                e.client == selectedClient);
                                        // Handle onTap action for each item if needed

                                        addressController.text =
                                            data.area ?? "";

                                        stateController.text = data.state ?? "";
                                        stateCodeController.text =
                                            data.stateCode ?? "";
                                        countryController.text =
                                            data.country ?? "";
                                        cityController.text = data.city ?? "";
                                        shortCodeController.text =
                                            data.clientShortCode ?? "";

                                        Navigator.of(context).pop(
                                            'Item '); // Example: Pop the selected item
                                      });
                                },
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        });
                  },
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    ));
  }

  Widget createColumnLabel(String labelText) {
    return Container(
      alignment: Alignment.center,
      child: Text(labelText,
          overflow: TextOverflow.values.first,
          textAlign: TextAlign.center,
          style: tableheader),
    );
  }
}
