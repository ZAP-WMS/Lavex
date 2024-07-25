import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/add_companie_model.dart';
import 'package:lavex/data/model/getcompeny_model.dart';
import 'package:lavex/data/model/singel_companey.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_scaffold.dart';

import '../../../data/model/update_companie.dart';
import '../../../utils/colors.dart';
import '../../../utils/style.dart';
import '../../../widgets/custom_spacebar.dart';
import '../../../widgets/custom_textform.dart';
import '../../controller/company_controller.dart';

class UpdateCompaney extends StatelessWidget {
  final TextEditingController pannumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  RxString imag = "".obs;

  var controller = Get.find<CompanyController>();
  final _key = GlobalKey<FormState>();

  UpdateCompaney({super.key});

  @override
  Widget build(BuildContext context) {
    final Data data = controller.data;
    final TextEditingController Companey_name_Controller =
        TextEditingController(text: data.name);
    final TextEditingController Bulstat_Controller =
        TextEditingController(text: data.bulstat);
    final TextEditingController reqistra_Address_Controller =
        TextEditingController(text: data.registrationAddress);
    final TextEditingController cityController =
        TextEditingController(text: data.city);
    final TextEditingController acc_per_Controller =
        TextEditingController(text: data.accountPerson);
    final TextEditingController mobileController =
        TextEditingController(text: data.mobile);
    final TextEditingController transtionController =
        TextEditingController(text: data.translationName);
    final TextEditingController statecodeController =
        TextEditingController(text: data.stateCode);
    final TextEditingController pan_numberController =
        TextEditingController(text: data.panNumber);
    final TextEditingController gst_number_Controller =
        TextEditingController(text: data.gstNumber);
    final TextEditingController webController =
        TextEditingController(text: data.website);
    final TextEditingController bankdetailController =
        TextEditingController(text: data.bankDetail);
    final TextEditingController emailController =
        TextEditingController(text: data.email);
    TextEditingController logoController =
        TextEditingController(text: data.chooseLogoFile);
    imag.value = data.chooseLogoFile.toString();
    double formWidth = MediaQuery.of(context).size.width * 0.2;
    return CommonScaffold(
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Obx(
              () => controller.loader.value
                  ? Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: greyColor)),
                      child: Form(
                        key: _key,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomField(
                                      width: formWidth,
                                      height: 50,
                                      name: "Company name",
                                      controller: Companey_name_Controller,
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
                                      name: "Bulstat",
                                      controller: Bulstat_Controller,
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
                                      name: "Registration Address",
                                      controller: reqistra_Address_Controller,
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
                                      name: "City",
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
                              verticalSpace(10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomField(
                                      width: formWidth,
                                      height: 50,
                                      name: "Account Person",
                                      controller: acc_per_Controller,
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
                                      name: "Mobile",
                                      keyboardType: TextInputType.phone,
                                      controller: mobileController,
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
                                      name: "Gst Number",
                                      controller: gst_number_Controller,
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
                                      name: "Email",
                                      controller: emailController,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomField(
                                      width: formWidth,
                                      height: 50,
                                      name: "Website",
                                      controller: webController,
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
                                      name: "StateCode",
                                      controller: statecodeController,
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
                                      name: "BankDetail",
                                      controller: bankdetailController,
                                      style: normalTextStyle,
                                      isreadOnly: false,
                                      isSuffixIcon: false,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'This Field is Required';
                                        }
                                        return null;
                                      }),
                                  InkWell(
                                      onTap: () async {
                                        try {
                                          Uint8List? bytesFromPicker =
                                              await ImagePickerWeb
                                                  .getImageAsBytes();
                                          imag.value =
                                              base64Encode(bytesFromPicker!);
                                          print(imag);
                                        } on Exception catch (e) {
                                          // TODO
                                        }
                                      },
                                      child: Container(
                                        width: formWidth,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.rectangle),
                                        child: Center(
                                            child: Text(
                                          imag.value.isEmpty
                                              ? 'Select logo'
                                              : "Selected",
                                        )),
                                      )),
                                  // CustomButton(
                                  //     text: imag.value.isEmpty
                                  //         ? 'Select logo'
                                  //         : "Selected",
                                  //     onPressed: () async {
                                  //       try {
                                  //         Uint8List? bytesFromPicker =
                                  //             await ImagePickerWeb
                                  //                 .getImageAsBytes();
                                  //         imag.value =
                                  //             base64Encode(bytesFromPicker!);
                                  //         print(imag);
                                  //       } on Exception catch (e) {
                                  //         print(e);
                                  //       }
                                  //     }),
                                ],
                              ),
                              verticalSpace(10),
                              verticalSpace(10),
                              Row(
                                children: [
                                  CustomButton(
                                      text: 'Update Company',
                                      onPressed: () {
                                        controller.loader.value = false;
                                        if (true
                                            //_key.currentState!.validate()
                                            ) {
                                          var update_data = Updatecompeney(
                                              name:
                                                  Companey_name_Controller.text,
                                              bulstat: Bulstat_Controller.text,
                                              registrationAddress:
                                                  reqistra_Address_Controller
                                                      .text,
                                              city: cityController.text,
                                              accountPerson:
                                                  acc_per_Controller.text,
                                              mobile: mobileController.text,
                                              panNumber:
                                                  pan_numberController.text,
                                              gstNumber:
                                                  gst_number_Controller.text,
                                              website: webController.text,
                                              email: emailController.text,
                                              bankDetail:
                                                  bankdetailController.text,
                                              stateCode:
                                                  statecodeController.text,
                                              chooseLogoFile: imag.value);
                                          controller
                                              .updateCompaney(
                                                  update_data, data.sId ?? "")
                                              .whenComplete(() {
                                            controller.loader.value = true;
                                          });
                                          Get.toNamed("/managecompaney");
                                        }
                                      }),
                                  horizontalSpace(10),
                                  CustomButton(
                                      text: cancelTxt,
                                      onPressed: () {
                                        _key.currentState!.reset();
                                      })
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
            )));
  }
}
