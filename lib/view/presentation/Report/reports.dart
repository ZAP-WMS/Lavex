import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/common/custom_text.dart';
import 'package:lavex/utils/colors.dart';
import 'package:lavex/utils/style.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import '../../../widgets/custom_textform.dart';
import '../../../widgets/drop_downTextField.dart';
import '../../controller/report_controller.dart';

class ReportPage extends GetView<ReportController> {
  ReportPage({super.key});

  TextEditingController fromTextController = TextEditingController();
  List<String> reports = [
    'Challan Report',
    'Sales Returns',
    'Rate Report',
    'Ananlysis Report',
    'Gst Report',
    'Stock Report',
    'Production Report',
    'Raw material consummations report',
  ];

  List<String> reportsTypes = [
    'Movement report',
    'Over due outstanding report',
    'Supplier Payment Report',
    'Sales Reports Area Wise',
    'Sales Reports Product Wise',
    'Ledger Report',
    'Purchase Reports',
    'Cubic Sale Report',
    'Cubic Purchase Report',
    'Product Report'
  ];

  List<String> invoices = [
    'Show only paid, unpaid invoices',
    'Show only paid invoices',
    'Show only unpaid invoices',
    'Show only partially paid invoices',
  ];
  List<PricePoint> points = [];

  @override
  Widget build(BuildContext context) {
    final ReportController reportController = Get.put(ReportController());
    points = [
      PricePoint(1000, 500),
      PricePoint(2000, 1000),
      PricePoint(3000, 2000),
      PricePoint(4000, 3000),
    ];
    return CommonScaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: greyColor)),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 250,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: blackColor)),
                      child: DropdownTextField<String>(
                        items: reportsTypes,
                        hintText: 'Select Reports',
                        itemAsString: (item) => item,
                        onChanged: (value) {
                          print('Selected: $value');
                          reportController.onItemSelected(value);
                          print('Selected: $value');
                          print('Selected: $value');
                        },
                      ),
                    ),
                    verticalSpace(10),
                  ],
                ),
                Obx(() {
                  // Use Obx to update the UI based on the selected fields
                  return Wrap(
                    direction: Axis.horizontal,
                    children: reportController.fields.map((field) {
                      if (field == 'Client Name' || field == 'Supplier Name') {
                        // Render dropdown for Client Name
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CTextBlack(
                                field,
                                mBold: true,
                                mSize: 14,
                              ),
                              Container(
                                width: 250,
                                height: 35,
                                child: DropdownTextField<String>(
                                  items: reportsTypes,
                                  hintText: field,
                                  itemAsString: (item) => item,
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        // Render TextField for other fields
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: CustomField(
                              width: 300,
                              height: 35,
                              name: field,
                              controller: fromTextController,
                              style: normalTextStyle,
                              isreadOnly: false,
                              isSuffixIcon: false,
                              validator: (value) {}),
                        );
                      }
                    }).toList(),
                  );
                }),
                verticalSpace(10),
                Row(children: [
                  CustomButton(text: 'Download Excel', onPressed: () {}),
                  horizontalSpace(10),
                  CustomButton(text: 'Download Pdf', onPressed: () {})
                ]),
                Divider(thickness: 2, color: greyColor),
                verticalSpace(10),
                Row(
                  children: [
                    Container(
                      width: 300,
                      height: 40,
                      child: DropdownTextField<String>(
                        items: reports,
                        hintText: 'Reports',
                        itemAsString: (item) => item,
                        onChanged: (value) {
                          print('Selected: $value');
                        },
                      ),
                    ),
                    horizontalSpace(10),
                    CustomButton(
                        width: 150, text: 'Download Excel', onPressed: () {}),
                    horizontalSpace(10),
                    CustomButton(
                        width: 150, text: 'Download Pdf', onPressed: () {}),
                    horizontalSpace(10),
                  ],
                ),
                verticalSpace(15),
                Divider(thickness: 2, color: greyColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomField(
                        width: 300,
                        height: 40,
                        name: 'From date',
                        controller: fromTextController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {}),
                    CustomField(
                        width: 300,
                        height: 40,
                        name: 'To date',
                        controller: fromTextController,
                        style: normalTextStyle,
                        isreadOnly: false,
                        isSuffixIcon: false,
                        validator: (value) {}),
                    Container(
                      width: 300,
                      height: 40,
                      child: DropdownTextField<String>(
                        items: invoices,
                        hintText: 'Invoices',
                        itemAsString: (item) => item,
                        onChanged: (value) {
                          print('Selected: $value');
                        },
                      ),
                    ),
                  ],
                ),
                verticalSpace(10),
                Row(
                  children: [
                    SizedBox(
                      height: 350,
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: BarChart(
                          BarChartData(
                            barGroups: _chartGroups(),
                            borderData: FlBorderData(
                                border: const Border(
                                    bottom: BorderSide(width: 1.0),
                                    left: BorderSide())),
                            gridData: FlGridData(show: true),
                            titlesData: FlTitlesData(
                              bottomTitles:
                                  AxisTitles(sideTitles: _bottomTitles),
                              leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                      reservedSize: 40, showTitles: true)),
                              topTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                showTitles: true,
                              )),
                              rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 350,
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: LineChart(
                            LineChartData(
                              lineBarsData: _lineBarsData(),
                              borderData: FlBorderData(
                                  border: const Border(
                                      bottom: BorderSide(width: 1.0),
                                      left: BorderSide())),
                              gridData: FlGridData(show: true),
                              titlesData: FlTitlesData(
                                bottomTitles:
                                    AxisTitles(sideTitles: _bottomTitles),
                                leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                        reservedSize: 40, showTitles: true)),
                                topTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                  showTitles: true,
                                )),
                                rightTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 350,
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: LineChart(
                            LineChartData(
                              lineBarsData: _lineBarsData(),
                              borderData: FlBorderData(
                                  border: const Border(
                                      bottom: BorderSide(width: 1.0),
                                      left: BorderSide())),
                              gridData: FlGridData(show: true),
                              titlesData: FlTitlesData(
                                bottomTitles:
                                    AxisTitles(sideTitles: _bottomTitles),
                                leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                        reservedSize: 40, showTitles: true)),
                                topTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                  showTitles: true,
                                )),
                                rightTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: BarChart(
                            BarChartData(
                              barGroups: _chartGroups(),
                              borderData: FlBorderData(
                                  border: const Border(
                                      bottom: BorderSide(width: 1.0),
                                      left: BorderSide())),
                              gridData: FlGridData(show: true),
                              titlesData: FlTitlesData(
                                bottomTitles:
                                    AxisTitles(sideTitles: _bottomTitles),
                                leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                        reservedSize: 40, showTitles: true)),
                                topTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                  showTitles: true,
                                )),
                                rightTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ]),
        ),
      ),
    ));
  }

  List<LineChartBarData> _lineBarsData() {
    return [
      LineChartBarData(
        spots: [
          FlSpot(0, 1),
          FlSpot(1, 3),
          FlSpot(2, 10),
          FlSpot(3, 7),
          FlSpot(4, 12),
          FlSpot(5, 13),
          FlSpot(6, 17),
        ],
        isCurved: true,
        //    colors: [Colors.blue],
        barWidth: 4,
        isStrokeCapRound: true,
        belowBarData: BarAreaData(show: false),
      ),
    ];
  }

  List<BarChartGroupData> _chartGroups() {
    return points
        .map((point) => BarChartGroupData(x: point.x.toInt(), barRods: [
              BarChartRodData(
                  width: 50,
                  toY: point.y,
                  borderRadius: BorderRadius.circular(0)),
            ]))
        .toList();
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1000:
              text = 'invoice';
              break;
            case 2000:
              text = 'pro-forma';
              break;
            case 3000:
              text = 'debit-note';
              break;
            case 4000:
              text = 'credit-note';
              break;
          }

          return Text(text);
        },
      );
}

class PricePoint {
  final double x;
  final double y;

  PricePoint(this.x, this.y);
}
