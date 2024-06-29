import 'dart:io' as io;
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:universal_html/html.dart';
import '../../widgets/Loading_file.dart';

class ReportController extends GetxController {
  var selectedItem = ''.obs;

  var fields = <String>[].obs;
  BuildContext? context;
  ProgressDialog? pr;
  List<int> pdfData = [];

  @override
  void onInit() {
    // pr = ProgressDialog(context!,
    //     customBody:
    //         Container(height: 200, width: 100, child: const LoadingFile()));
    super.onInit();
  }

  // Function to handle the change in dropdown selection
  void onItemSelected(String? value) {
    selectedItem.value = value ?? '';
    if (selectedItem.value == 'Movement report') {
      fields.value = ['From date', 'To date'];
    } else if (selectedItem.value == 'Over due outstanding report') {
      fields.value = [
        'From date',
        'To date',
        'Client Name',
        'Area',
        'Invoice Type'
      ];
    } else if (selectedItem.value == 'Supplier Payment Report') {
      fields.value = [
        'From date',
        'To date',
        'Supplier Name',
      ];
    } else if (selectedItem.value == 'Sales Reports Area Wise') {
      fields.value = [
        'From date',
        'To date',
        'Invoice Type',
        'Area',
        'Client Name',
      ];
    } else if (selectedItem.value == 'Supplier Payment Report') {
      fields.value = [
        'From date',
        'To date',
        'Invoice Type',
        'Area',
        'Product Name',
      ];
    } else if (selectedItem.value == 'Ledger Report') {
      fields.value = [
        'From Year',
        'To Year',
        'Client Name',
        'Supplier Name',
      ];
    } else if (selectedItem.value == 'Purchase Report') {
      fields.value = [
        'From date',
        'To date',
        'Client Name',
      ];
    } else if (selectedItem.value == 'Cubic Purchase Report') {
      fields.value = [
        'From date',
        'To date',
        'Supplier Name',
      ];
    } else if (selectedItem.value == 'Product Report') {
      fields.value = [
        'Company Name',
        'From date',
        'To date',
        'Product Name',
        'Brand Name',
        'Invoice Type'
      ];
    }
  }

  Future<void> generateDailyPDF() async {
    final pdf = pw.Document();

    final fontData1 =
        await rootBundle.load('assets/fonts/IBMPlexSans-Medium.ttf');
    final fontData2 =
        await rootBundle.load('assets/fonts/IBMPlexSans-Bold.ttf');
    final ttfMedium = pw.Font.ttf(fontData1);
    final ttfBold = pw.Font.ttf(fontData2);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(
              'This is a blank PDF',
              style: pw.TextStyle(font: ttfMedium, fontSize: 24),
            ),
          );
        },
      ),
    );

    // Save the PDF as bytes
    final Uint8List bytes = await pdf.save();

    // Convert the bytes to a blob and create an anchor element
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'example.pdf')
      ..click();

    // Cleanup the object URL
    html.Url.revokeObjectUrl(url);
  }
}
