import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lavex/common/custom_text.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/utils/style.dart';
import 'package:lavex/view/presentation/homepage/home_page.dart';
import 'package:lavex/widgets/custom_button.dart';
import 'package:lavex/widgets/custom_scaffold.dart';
import 'package:lavex/widgets/custom_spacebar.dart';
import '../../../widgets/custom_textform.dart';
import '../../../widgets/drop_downTextField.dart';

class ReportPage extends StatelessWidget {
  ReportPage({super.key});

  TextEditingController fromTextController = TextEditingController();
  List<String> reports = [
    'Challan Report',
    'Challan Returns',
    'Rate Report',
    'Ananlysis Report',
    'Gst Report',
    'Stock Report',
    'Production Report',
    'Raw material consummations report',
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
    points = [
      PricePoint(1000, 500),
      PricePoint(2000, 1000),
      PricePoint(3000, 2000),
      PricePoint(4000, 3000),
    ];
    return CommonScaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'From',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                horizontalSpace(10),
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'To date',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                horizontalSpace(50),
                CustomButton(text: 'Download Excel', onPressed: () {}),
                horizontalSpace(20),
                CustomButton(text: 'Download Pdf', onPressed: () {})
              ],
            ),
            verticalSpace(10),
            Divider(),
            Align(
                alignment: Alignment.centerLeft,
                child: CTextBlack('Over Due Outstanding Report',
                    mSize: 18, mBold: false)),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'From',
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
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Client Name:',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Area:',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
              ],
            ),
            Divider(),
            verticalSpace(10),
            Row(
              children: [
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Invoice Type',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                horizontalSpace(50),
                CustomButton(text: 'Download Excel', onPressed: () {}),
                horizontalSpace(20),
                CustomButton(text: 'Download Pdf', onPressed: () {})
              ],
            ),
            verticalSpace(10),
            const Divider(),
            verticalSpace(10),
            CTextBlack('Supplier Payment Report', mSize: 18, mBold: false),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'From',
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
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Invoice Type:',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Area:',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
              ],
            ),
            verticalSpace(10),
            Row(children: [
              CustomButton(text: 'Download Excel', onPressed: () {}),
              horizontalSpace(10),
              CustomButton(text: 'Download Pdf', onPressed: () {})
            ]),
            verticalSpace(10),
            Divider(),
            verticalSpace(10),
            CTextBlack('Sales Report', mSize: 18, mBold: false),
            verticalSpace(10),
            CTextBlack('Area Wise', mSize: 16, mBold: false),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'From',
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
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Client Name:',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Area:',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
              ],
            ),
            verticalSpace(10),
            CustomField(
                width: 300,
                height: 40,
                name: clientTxt,
                controller: fromTextController,
                style: normalTextStyle,
                isreadOnly: false,
                isSuffixIcon: false,
                validator: (value) {}),
            verticalSpace(10),
            CustomButton(width: 150, text: 'Download Pdf', onPressed: () {}),
            Divider(),
            CTextBlack('Product Wise', mSize: 16, mBold: false),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'From',
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
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Client Name:',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Area:',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
              ],
            ),
            verticalSpace(10),
            CustomField(
                width: 300,
                height: 40,
                name: 'Product Name',
                controller: fromTextController,
                style: normalTextStyle,
                isreadOnly: false,
                isSuffixIcon: false,
                validator: (value) {}),

            verticalSpace(10),
            CustomButton(width: 150, text: 'Download Pdf', onPressed: () {}),
            verticalSpace(10),
            CTextBlack('Customer Wise', mSize: 16, mBold: false),
            verticalSpace(10),
            Row(
              children: [
                CustomButton(text: 'Download Excel', onPressed: () {}),
                horizontalSpace(10),
                CustomButton(text: 'Download Pdf', onPressed: () {}),
              ],
            ),
            verticalSpace(10),
            Divider(),
            verticalSpace(10),
            CTextBlack('Ledger Report', mSize: 16, mBold: false),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'From Year',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'To Year',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Client Name:',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Suppllier Name:',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
              ],
            ),
            verticalSpace(10),
            Row(
              children: [
                CustomButton(text: 'Download Excel', onPressed: () {}),
                horizontalSpace(10),
                CustomButton(text: 'Download Pdf', onPressed: () {}),
              ],
            ),
            verticalSpace(10),
            Divider(),
            verticalSpace(10),
            CTextBlack('Purchase Report', mSize: 16, mBold: false),
            verticalSpace(10),
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
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Suppllier Name:',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
              ],
            ),
            verticalSpace(10),
            Row(
              children: [
                CustomButton(
                    width: 150, text: 'Download Excel', onPressed: () {}),
                horizontalSpace(10),
                CustomButton(
                    width: 150, text: 'Download Pdf', onPressed: () {}),
              ],
            ),
            verticalSpace(10),
            const Divider(), verticalSpace(10),
            CTextBlack('Cubic Sale Report', mSize: 16, mBold: false),
            verticalSpace(10),
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
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Suppllier Name:',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
              ],
            ),
            verticalSpace(10),
            Row(
              children: [
                CustomButton(
                    width: 150, text: 'Download Excel', onPressed: () {}),
                horizontalSpace(10),
              ],
            ),
            verticalSpace(10),
            const Divider(),
            verticalSpace(10),
            CTextBlack('Cubic Purchase Report', mSize: 16, mBold: false),
            verticalSpace(10),
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
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Suppllier Name:',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
              ],
            ),
            verticalSpace(10),
            Row(
              children: [
                CustomButton(
                    width: 150, text: 'Download Excel', onPressed: () {}),
              ],
            ),

            verticalSpace(10), const Divider(), verticalSpace(10),
            CTextBlack('Product Report', mSize: 16, mBold: false),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Company Name:',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
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
              ],
            ),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Product Name:',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Brand Name',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
                CustomField(
                    width: 300,
                    height: 40,
                    name: 'Invoice Type',
                    controller: fromTextController,
                    style: normalTextStyle,
                    isreadOnly: false,
                    isSuffixIcon: false,
                    validator: (value) {}),
              ],
            ),
            verticalSpace(10),
            Row(
              children: [
                CustomButton(
                    width: 150, text: 'Download Excel', onPressed: () {}),
                horizontalSpace(10),
                CustomButton(
                    width: 150, text: 'Download Excel', onPressed: () {}),
                horizontalSpace(10),
                CustomButton(
                    width: 250,
                    text: 'Download Excel(Month Wise)',
                    onPressed: () {}),
              ],
            ),
            verticalSpace(10),
            const Divider(),
            verticalSpace(10),
            Row(
              children: [
                Container(
                  width: 200,
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
                    width: 150, text: 'Download Excel', onPressed: () {}),
                horizontalSpace(10),
              ],
            ),
            verticalSpace(10),
            Divider(),
            verticalSpace(10),
            // CTextBlack('Challan Report', mSize: 16, mBold: false),
            // verticalSpace(10),
            // Row(
            //   children: [
            //     CustomButton(
            //         width: 150, text: 'Download Excel', onPressed: () {}),
            //     horizontalSpace(10),
            //     CustomButton(
            //         width: 150, text: 'Download Excel', onPressed: () {}),
            //     horizontalSpace(10),
            //   ],
            // ),
            // const Divider(),
            // CTextBlack('Sales Return', mSize: 16, mBold: false),
            // verticalSpace(10),
            // Row(
            //   children: [
            //     CustomButton(
            //         width: 150, text: 'Download Excel', onPressed: () {}),
            //     horizontalSpace(10),
            //     CustomButton(
            //         width: 150, text: 'Download Excel', onPressed: () {}),
            //     horizontalSpace(10),
            //   ],
            // ),
            // const Divider(),
            // CTextBlack('Rate Report', mSize: 16, mBold: false),
            // verticalSpace(10),
            // Row(
            //   children: [
            //     CustomButton(
            //         width: 150, text: 'Download Excel', onPressed: () {}),
            //     horizontalSpace(10),
            //     CustomButton(
            //         width: 150, text: 'Download Excel', onPressed: () {}),
            //     horizontalSpace(10),
            //   ],
            // ),
            // const Divider(),
            // CTextBlack('Analysis Report', mSize: 16, mBold: false),
            // verticalSpace(10),
            // Row(
            //   children: [
            //     CustomButton(
            //         width: 150, text: 'Download Excel', onPressed: () {}),
            //     horizontalSpace(10),
            //     CustomButton(
            //         width: 150, text: 'Download Excel', onPressed: () {}),
            //     horizontalSpace(10),
            //   ],
            // ),
            // const Divider(),
            // CTextBlack('Stock Report', mSize: 16, mBold: false),
            // verticalSpace(10),
            // Row(
            //   children: [
            //     CustomButton(
            //         width: 150, text: 'Download Excel', onPressed: () {}),
            //     horizontalSpace(10),
            //     CustomButton(
            //         width: 150, text: 'Download Excel', onPressed: () {}),
            //     horizontalSpace(10),
            //   ],
            // ),
            // const Divider(),
            // CTextBlack('Production Report', mSize: 16, mBold: false),
            // verticalSpace(10),
            // Row(
            //   children: [
            //     CustomButton(
            //         width: 150, text: 'Download Excel', onPressed: () {}),
            //     horizontalSpace(10),
            //     CustomButton(
            //         width: 150, text: 'Download Excel', onPressed: () {}),
            //     horizontalSpace(10),
            //   ],
            // ),
            // const Divider(),
            // CTextBlack('Raw material consummations report',
            //     mSize: 16, mBold: false),
            // verticalSpace(10),
            // Row(
            //   children: [
            //     CustomButton(
            //         width: 150, text: 'Download Excel', onPressed: () {}),
            //     horizontalSpace(10),
            //     CustomButton(
            //         width: 150, text: 'Download Excel', onPressed: () {}),
            //     horizontalSpace(10),
            //   ],
            // ),

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
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
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
                        bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                        leftTitles: AxisTitles(
                            sideTitles:
                                SideTitles(reservedSize: 40, showTitles: true)),
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
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
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
                        bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                        leftTitles: AxisTitles(
                            sideTitles:
                                SideTitles(reservedSize: 40, showTitles: true)),
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
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
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
                        bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                        leftTitles: AxisTitles(
                            sideTitles:
                                SideTitles(reservedSize: 40, showTitles: true)),
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
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
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
                        bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                        leftTitles: AxisTitles(
                            sideTitles:
                                SideTitles(reservedSize: 40, showTitles: true)),
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
