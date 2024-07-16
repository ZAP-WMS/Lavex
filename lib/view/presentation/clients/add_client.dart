import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/add_client_model.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_scaffold.dart';

import '../../../routes/route_pages.dart';
import '../../../utils/colors.dart';
import '../../../utils/style.dart';
import '../../../widgets/custom_spacebar.dart';
import '../../../widgets/custom_textform.dart';
import '../../controller/my_client_controller.dart';

class AddClient extends StatelessWidget {
  AddClient({super.key});

  final TextEditingController clientController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController shortCodeController =
      TextEditingController(text: "Cli");
  final TextEditingController gstNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController emailIdController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController firstCreditController = TextEditingController();
  final TextEditingController secondCreditController = TextEditingController();
  final TextEditingController firstlimitdaysController =
      TextEditingController();
  final TextEditingController secondlimitdaysController =
      TextEditingController();
  final TextEditingController panNumberController = TextEditingController();
  final TextEditingController accountablePersonController =
      TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController stateCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController beneficiaryController = TextEditingController();
  final TextEditingController clientShortCodeController =
      TextEditingController(text: "Cli");
  final TextEditingController shipToController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final MyClientController myClientController = Get.put(MyClientController());

  @override
  Widget build(BuildContext context) {
    myClientController.isLoading.value = false;
    double formWidth = MediaQuery.of(context).size.width * 0.2;
    return CommonScaffold(
        body: !myClientController.isLoading.value
            ? Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: greyColor)),
                  child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              CustomField(
                                  width: formWidth,
                                  height: 50,
                                  name: gradeTxt,
                                  controller: gradeController,
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
                                  name: shortCodeTxt,
                                  controller: shortCodeController,
                                  style: normalTextStyle,
                                  isreadOnly: true,
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
                                  name: gstNumerTxt,
                                  controller: gstNumberController,
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
                                  name: locationTxt,
                                  controller: locationController,
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
                                  name: areaTxt,
                                  controller: areaController,
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
                                  name: pincodeTxt,
                                  controller: pinController,
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
                              CustomField(
                                  width: formWidth,
                                  height: 50,
                                  name: emailTxt,
                                  controller: emailIdController,
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
                                  name: mobileNumberTxt,
                                  controller: mobileNumberController,
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
                                  name: contactNumberTxt,
                                  controller: contactNumberController,
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
                                  name: firstCreditLimit,
                                  controller: firstCreditController,
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
                              CustomField(
                                  width: formWidth,
                                  height: 50,
                                  name: secondCreditLimit,
                                  controller: secondCreditController,
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
                                  name: firstCreditLimitdays,
                                  controller: firstlimitdaysController,
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
                                  name: secondCreditLimitdays,
                                  controller: secondlimitdaysController,
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
                                  name: panNumberTxt,
                                  controller: panNumberController,
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
                              CustomField(
                                  width: formWidth,
                                  height: 50,
                                  name: accountablePersonTxt,
                                  controller: accountablePersonController,
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
                            ],
                          ),
                          verticalSpace(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                  name: beneficiaryTxt,
                                  controller: beneficiaryController,
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
                                  name: clientShortCodeTxt,
                                  controller: clientShortCodeController,
                                  style: normalTextStyle,
                                  isreadOnly: true,
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
                                  name: shipToTxt,
                                  controller: shipToController,
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
                            children: [
                              CustomButton(
                                  text: saveClientTxt,
                                  onPressed: () {
                                    myClientController.isLoading.value = true;
                                    if (_formkey.currentState!.validate()) {
                                      String firstCreditlimitText =
                                          firstCreditController.text.isNotEmpty
                                              ? firstCreditController.text
                                              : '0';

                                      String secondcreditlimitText =
                                          secondCreditController.text.isNotEmpty
                                              ? secondCreditController.text
                                              : '0';

                                      int firstcreditValue =
                                          int.parse(firstCreditlimitText);
                                      int secondcreditValue =
                                          int.parse(secondcreditlimitText);

                                      ClientData clientData = ClientData(
                                          client: clientController.text,
                                          clientShortCode:
                                              clientShortCodeController.text,
                                          area: areaController.text,
                                          email: emailIdController.text,
                                          contactNo:
                                              contactNumberController.text,
                                          firstcreditLimit: firstcreditValue,
                                          frcreditLtDays:
                                              firstCreditController.text,
                                          secondcreditLimit: secondcreditValue,
                                          sdCrlmDays:
                                              secondlimitdaysController.text,
                                          accPerson:
                                              accountablePersonController.text,
                                          state: stateCodeController.text,
                                          country: countryController.text,
                                          shipTo: shipToController.text,
                                          grade: gradeController.text,
                                          gstNumber: gstNumberController.text,
                                          location: locationController.text,
                                          pincode: pinController.text,
                                          mobile: mobileNumberController.text,
                                          panNumber: panNumberController.text,
                                          city: cityController.text,
                                          stateCode: stateCodeController.text,
                                          beneficiary:
                                              beneficiaryController.text);
                                      AddClientModel addClientModel =
                                          AddClientModel(
                                              clientData: clientData);
                                      myClientController.isLoading.value = true;
                                      ApiServices()
                                          .addClientData(addClientModel)
                                          .whenComplete(() {
                                        myClientController.isLoading.value =
                                            false;
                                        myClientController.myClientModel
                                            .clear();
                                        myClientController.myClientData();
                                      });
                                      Get.offAndToNamed(AppRoutes.client_List);
                                    }
                                  }),
                              horizontalSpace(10),
                              CustomButton(text: cancelTxt, onPressed: () {})
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Center(child: CircularProgressIndicator()));
  }
}
