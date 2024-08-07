import 'package:flutter/material.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/data/model/add_suppllier.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import '../../../utils/colors.dart';
import '../../../utils/style.dart';
import '../../../widgets/custom_spacebar.dart';
import '../../../widgets/custom_textform.dart';

class SuppllierPage extends StatelessWidget {
  SuppllierPage({super.key});

  final TextEditingController suppllierController = TextEditingController();
  final TextEditingController shortCodeController = TextEditingController();
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
      TextEditingController();
  final TextEditingController shipToController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

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
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomField(
                      width: formWidth,
                      height: 50,
                      name: suppllierTxt,
                      controller: suppllierController,
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
                ],
              ),
              verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                ],
              ),
              verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                ],
              ),
              verticalSpace(10),
              verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                ],
              ),
              verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                ],
              ),
              verticalSpace(10),
              Row(
                children: [
                  CustomButton(
                      text: saveEntryTxt,
                      onPressed: () {
                        //  if (_formkey.currentState!.validate()) {
                        SuppllierData suppllierData = SuppllierData(
                            supplier: suppllierController.text,
                            suppShortCode: clientShortCodeController.text,
                            area: areaController.text,
                            email: emailIdController.text,
                            contactNo: contactNumberController.text,
                            // firstcreditLimit: firstcreditValue,
                            // frcreditLtDays: firstCreditController.text,
                            // secondcreditLimit: secondcreditValue,
                            // sdCrlmDays: secondlimitdaysController.text,
                            address: addressController.text,
                            accPerson: accountablePersonController.text,
                            state: stateCodeController.text,
                            country: countryController.text,
                            gstNumber: gstNumberController.text,
                            location: locationController.text,
                            pincode: pinController.text,
                            mobile: mobileNumberController.text,
                            panNumber: panNumberController.text,
                            city: cityController.text,
                            stateCode: stateCodeController.text,
                            beneficiary: beneficiaryController.text);
                        AddSuppllier addSuppllier =
                            AddSuppllier(suppllierData: suppllierData);

                        ApiServices().addSuppllierata(addSuppllier);
                        //   }
                      }),
                  horizontalSpace(10),
                  CustomButton(text: cancelTxt, onPressed: () {})
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
