import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/add_companie_model.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_scaffold.dart';

import '../../../utils/colors.dart';
import '../../../utils/style.dart';
import '../../../widgets/custom_spacebar.dart';
import '../../../widgets/custom_textform.dart';
import '../../controller/company_controller.dart';

class AddCompaney extends StatelessWidget {
  final TextEditingController Companey_name_Controller =
      TextEditingController();
  final TextEditingController Bulstat_Controller = TextEditingController();
  final TextEditingController reqistra_Address_Controller =
      TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController acc_per_Controller = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  var controller = Get.put(CompanyController());
  final _key = GlobalKey<FormState>();

  AddCompaney({super.key});
  @override
  Widget build(BuildContext context) {
    double formWidth = MediaQuery.of(context).size.width * 0.2;
    return CommonScaffold(
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: greyColor)),
              child: Obx(
                () => controller.loader.value
                    ? Form(
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
                                      name: "Companey name",
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
                                      name: "registrationAddress",
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
                                      name: "city",
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
                                      name: "accountPerson",
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
                                ],
                              ),
                              verticalSpace(10),
                              Row(
                                children: [
                                  CustomButton(
                                      text: 'Add Companey',
                                      onPressed: () async {
                                        if (_key.currentState!.validate()) {
                                          controller.loader.value = false;
                                          // String firstCreditlimitText =
                                          //     firstCreditController.text.isNotEmpty
                                          //         ? firstCreditController.text
                                          //         : '0';

                                          // String secondcreditlimitText =
                                          //     secondCreditController.text.isNotEmpty
                                          //         ? secondCreditController.text
                                          //         : '0';

                                          // int firstcreditValue =
                                          //     int.parse(firstCreditlimitText);
                                          // int secondcreditValue =
                                          //     int.parse(secondcreditlimitText);

                                          // CompaneyData CompaneyData = CompaneyData(
                                          //     Companey: CompaneyController.text,
                                          //     CompaneyShortCode: CompaneyShortCodeController.text,
                                          //     area: areaController.text,
                                          //     email: emailIdController.text,
                                          //     contactNo: contactNumberController.text,
                                          //     firstcreditLimit: firstcreditValue,
                                          //     frcreditLtDays: firstCreditController.text,
                                          //     secondcreditLimit: secondcreditValue,
                                          //     sdCrlmDays: secondlimitdaysController.text,
                                          //     accPerson: accountablePersonController.text,
                                          //     state: stateCodeController.text,
                                          //     country: countryController.text,
                                          //     shipTo: shipToController.text,
                                          //     grade: gradeController.text,
                                          //     gstNumber: gstNumberController.text,
                                          //     location: locationController.text,
                                          //     pincode: pinController.text,
                                          //     mobile: mobileNumberController.text,
                                          //     panNumber: panNumberController.text,
                                          //     city: cityController.text,
                                          //     stateCode: stateCodeController.text,
                                          //     beneficiary: beneficiaryController.text);
                                          // AddCompaneyModel addCompaneyModel =
                                          //     AddCompaneyModel(CompaneyData: CompaneyData);

                                          var data = addcompeney(
                                              name:
                                                  Companey_name_Controller.text,
                                              bulstat: Bulstat_Controller.text,
                                              registrationAddress:
                                                  reqistra_Address_Controller
                                                      .text,
                                              city: cityController.text,
                                              accountPerson:
                                                  acc_per_Controller.text);

                                          await controller
                                              .addCompaney(data)
                                              .whenComplete(() {
                                            Get.toNamed("/managecompaney");
                                            controller.loader.value = true;
                                          });
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
                        ))
                    : Center(child: CircularProgressIndicator()),
              ),
            )));
  }
}
