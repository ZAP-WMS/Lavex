import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/add_companie_model.dart';
import 'package:lavex/data/model/singel_companey.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_scaffold.dart';

import '../../../utils/colors.dart';
import '../../../utils/style.dart';
import '../../../widgets/custom_spacebar.dart';
import '../../../widgets/custom_textform.dart';
import '../../controller/company_controller.dart';

class UpdateCompaney extends StatelessWidget {
  final Singelcompeney data;

  final TextEditingController pannumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  var controller = Get.put(CompanyController());
  final _key = GlobalKey<FormState>();

  UpdateCompaney(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
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
    double formWidth = MediaQuery.of(context).size.width * 0.2;
    return CommonScaffold(
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: "mobile",
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
                        name: "gstNumber",
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
                        name: "panNumber",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomField(
                        width: formWidth,
                        height: 50,
                        name: "email",
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
                        name: "website",
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
                        name: "stateCode",
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
                        name: "bankDetail",
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
                  children: [
                    CustomButton(
                        text: 'Add Companey',
                        onPressed: () {
                          if (_key.currentState!.validate()) {
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
                            // UpdateCompaneyModel UpdateCompaneyModel =
                            //     UpdateCompaneyModel(CompaneyData: CompaneyData);

                            var data = addcompeney(
                                name: Companey_name_Controller.text,
                                bulstat: Bulstat_Controller.text,
                                registrationAddress:
                                    reqistra_Address_Controller.text,
                                city: cityController.text,
                                accountPerson: acc_per_Controller.text);

                            //   ApiServices().UpdateCompaney(data);
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
    ));
  }
}
