import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:lavex/data/model/getcompeny_model.dart';
import 'package:lavex/data/model/my_clients.dart';
import 'package:lavex/datasource/my_clients_datasource.dart';
import 'package:lavex/routes/route_pages.dart';
import 'package:lavex/view/presentation/Companey/update_company.dart';
import 'package:lavex/view/presentation/clients/add_client.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../data/data_source/remote/api_service.dart';
import '../../../data/model/singel_companey.dart';
import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../../../utils/style.dart';
import '../../controller/company_controller.dart';
import '../../controller/my_client_controller.dart';
import 'add_company.dart';

class MyCompaney extends GetView<CompanyController> {
  var controller = Get.put(CompanyController());

  MyCompaney({super.key});
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Company List",
                style: boldTextStyle,
              ),
            ),
            Obx(() {
              return controller.loader.value
                  ? Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.companeydata.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.companeydata[index].name
                                              .toString()
                                              .toUpperCase() ??
                                          "",
                                      style: normalappcolorTextStyle,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                            onTap: () async {
                                              controller.loader.value = false;
                                              controller.data = controller
                                                  .companeydata
                                                  .singleWhere((e) =>
                                                      e.sId ==
                                                      controller
                                                          .companeydata[index]
                                                          .sId);
                                              controller.loader.value = true;
                                              // await controller
                                              //     .fetchsingelCompanie(
                                              //         controller
                                              //             .companeydata[index]
                                              //             .sId
                                              //             .toString())
                                              //     .whenComplete(() {
                                              //   controller.loader.value = true;
                                              // });
                                              Get.toNamed(
                                                  AppRoutes.update_companey,
                                                  arguments: {});
                                            },
                                            child: Icon(Icons.edit)),
                                        InkWell(
                                            onTap: () {
                                              controller.loader.value = false;
                                              controller.DeleteCompaney(
                                                      controller
                                                              .companeydata[
                                                                  index]
                                                              .sId ??
                                                          "")
                                                  .whenComplete(() {
                                                controller.loader.value = true;
                                              });
                                            },
                                            child: Icon(Icons.delete)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );

                            // ;
                          }),
                    )
                  : Center(child: CircularProgressIndicator());
            }),
            InkWell(
              onTap: () => Get.toNamed("/addcompaney"),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Create Company".toString() ?? "",
                    style: boldTextStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
