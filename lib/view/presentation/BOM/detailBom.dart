import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/getallBom.dart';
import '../../../utils/style.dart';
import '../../../widgets/custom_scaffold.dart';

class DetailBom extends StatelessWidget {
  DetailBom({Key? key}) : super(key: key);
  Allbom bom = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print(bom);
    return CommonScaffold(
      body: Body(bom),
    );
  }

  Widget Body(Allbom bom) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ready Material",
              style: tableheader,
            ),
            Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Name: ",
                        style: normalTextStyle,
                      ),
                      Text(
                        "${bom.readyStock!.name.toString()}",
                        style: normalTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Brand: ",
                        style: normalTextStyle,
                      ),
                      Text(
                        "${bom.readyStock!.brand.toString()}",
                        style: normalTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "QtyType: ",
                        style: normalTextStyle,
                      ),
                      Text(
                        "${bom.readyStock!.qtyType.toString()}",
                        style: normalTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Qty: ",
                        style: normalTextStyle,
                      ),
                      Text(
                        "${bom.readyStock!.qty.toString()}",
                        style: normalTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Price: ",
                        style: normalTextStyle,
                      ),
                      Text(
                        "${bom.readyStock!.price.toString()}",
                        style: normalTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Total: ",
                        style: normalTextStyle,
                      ),
                      Text(
                        "${(bom.readyStock!.price! * bom.readyStock!.qty!)}",
                        style: normalTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Text(
              "Raw Material",
              style: tableheader,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: bom.raw!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Name: ",
                            style: normalTextStyle,
                          ),
                          Text(
                            "${bom.raw![index].name.toString()}",
                            style: normalTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Brand: ",
                            style: normalTextStyle,
                          ),
                          Text(
                            "${bom.raw![index].brand.toString()}",
                            style: normalTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "QtyType: ",
                            style: normalTextStyle,
                          ),
                          Text(
                            "${bom.raw![index].qtyType.toString()}",
                            style: normalTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Qty: ",
                            style: normalTextStyle,
                          ),
                          Text(
                            "${bom.raw![index].qty.toString()}",
                            style: normalTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Price: ",
                            style: normalTextStyle,
                          ),
                          Text(
                            "${bom.raw![index].price.toString()}",
                            style: normalTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Total: ",
                            style: normalTextStyle,
                          ),
                          Text(
                            "${(bom.raw![index].price! * bom.raw![index].qty!)}",
                            style: normalTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
