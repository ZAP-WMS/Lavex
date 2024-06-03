import 'package:flutter/material.dart';
import 'package:lavex/common/custom_text.dart';
import 'package:lavex/utils/colors.dart';
import 'package:lavex/utils/string.dart';
import 'package:lavex/view/presentation/Invoice/createinvoice/create_invoice.dart';
import 'package:lavex/widgets/custom_scaffold.dart';

class CreateInvoiceList extends StatelessWidget {
  const CreateInvoiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: createInvoice.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 15, crossAxisCount: 3, childAspectRatio: 1.5),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateInvoice()));
                },
                child: cards('img', createInvoice[index], index, context));
          },
        ),
      ),
    );
  }

  Widget cards(String img, String title, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width * 0.2,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                  color: greyColor,
                  blurRadius: 3.0,
                  spreadRadius: 3.0,
                  offset:
                      const Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: CTextBlack(
              title,
            ),
          ),
        ],
      ),
    );
  }
}
