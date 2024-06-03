import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavex/routes/route_pages.dart';
import 'package:lavex/utils/colors.dart';

import 'package:lavex/utils/string.dart';
import 'package:lavex/view/presentation/Invoice/createinvoice/create_invoice.dart';
import 'package:lavex/view/presentation/Invoice/myinvoice/myInvoice_home.dart';
import 'package:lavex/view/presentation/clients/my_clients.dart';
import 'package:lavex/view/presentation/homepage/home_page.dart';
import 'package:lavex/view/presentation/item_master.dart';
import 'package:lavex/view/presentation/payments/cash_memo_payments.dart';
import 'package:lavex/view/presentation/payments/my_payments.dart';
import 'package:lavex/view/presentation/payments/my_supplier_payment.dart';
import 'package:lavex/view/presentation/store.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/custom_scaffold.dart';
import '../bom.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pageName = [
      const HomePage(),
      CreateInvoice(),
      const MyHomeInvoice(),
      MyPayments(),
      CashMemoPayments(),
      MySupplierPayment(),
      MyClient(),
      MyClient(),
      MySupplierPayment(),
      MySupplierPayment(),
      BomPage(),
      ItemMaster(),
      StorePage()
    ];
    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: tabTitles.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 6,
              childAspectRatio: 1.1),
          itemBuilder: (context, index) {
            return Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: whiteColor, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pageName[index]));
                  },
                  child: cards(tabTitles[index], menubarIcons[index], index),
                ));
          },
        ),
      ),
    );
  }
}
