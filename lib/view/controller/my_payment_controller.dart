import 'package:get/get.dart';
import '../../data/data_source/remote/api_service.dart';
import '../../data/model/my_payments.dart';

class MyPaymentController extends GetxController {
  var paymentModel = <MyPaymentsModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPaymentData();
    super.onInit();
  }

  void fetchPaymentData() async {
    try {
      isLoading(true);
      List<MyPaymentsModel> mydata = await ApiServices().myPaymentData();
      paymentModel.addAll(mydata);
    } finally {
      isLoading(false);
    }
  }
}
