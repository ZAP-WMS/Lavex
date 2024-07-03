import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/data/data_source/remote/api_service.dart';
import 'package:lavex/routes/route_pages.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import 'package:lavex/widgets/rich_text.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../data/model/register_model.dart';
import '../../utils/asset_image.dart';
import '../../utils/colors.dart';
import '../../utils/string.dart';
import '../../utils/style.dart';
import '../../widgets/cutom_textformfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List<GridColumn> buildColumns(BuildContext context) {
    List<GridColumn> columns = [];
    for (String columnName in myClientTableName) {
      columns.add(
        GridColumn(
          columnName: columnName,
          visible: true,
          allowEditing: columnName == 'Add' ||
                  columnName == 'Delete' ||
                  columnName == columnName[0]
              ? false
              : true,
          width: columnName == 'Name' || columnName == 'Client Short-Code'
              ? MediaQuery.of(context).size.width * 0.2
              : MediaQuery.of(context).size.width *
                  0.09, // You can adjust this width as needed
          label: createColumnLabel(
            myClientTableName[myClientTableName.indexOf(columnName)],
          ),
        ),
      );
    }
    return columns;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              LocalAssetImage(
                path: 'assets/login/register.jpg',
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.4,
                color: blackColor,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                  controller: nameController,
                  width: 400,
                  name: 'Enter Name',
                  style: normalTextStyle,
                  isSuffixIcon: false,
                  isreadOnly: false,
                  icon: const Icon(Icons.person),
                  validator: (p0) {}),
              verticalSpace(15),
              CustomTextFormField(
                  controller: emailController,
                  width: 400,
                  name: 'Enter Email Id',
                  style: normalTextStyle,
                  // width: 700,
                  isSuffixIcon: false,
                  isreadOnly: false,
                  icon: Icon(Icons.email_outlined),
                  validator: (p0) {}),
              verticalSpace(15),
              CustomTextFormField(
                  controller: passwordController,
                  width: 400,
                  name: 'Enter Password',
                  style: normalTextStyle,
                  // width: 700,
                  isSuffixIcon: false,
                  isreadOnly: false,
                  icon: const Icon(Icons.lock),
                  validator: (p0) {}),
              verticalSpace(15),
              CustomTextFormField(
                  controller: numberController,
                  name: 'Phone NUmber',
                  width: 400,
                  style: normalTextStyle,
                  // width: 700,
                  isSuffixIcon: false,
                  isreadOnly: false,
                  icon: const Icon(Icons.lock),
                  validator: (p0) {}),
              verticalSpace(15),
              CustomButton(
                  text: 'Sign Up',
                  width: 150,
                  onPressed: () {
                    Data data = Data(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        mobile: '+91${numberController.text}');

                    RegisterModel registerModel = RegisterModel(
                      data: data,
                    );
                    ApiServices().registerUser(registerModel);
                  }),
              verticalSpace(30),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.LOGIN);
                },
                child: RichTextWidget(
                    title: 'Already have an account? ',
                    subtitle: 'Sign In',
                    titlestyle: normalTextStyle,
                    subtitleStyle: normalappcolorTextStyle),
              ),
              verticalSpace(15),
            ],
          )
        ],
      ),
    );
  }
}
