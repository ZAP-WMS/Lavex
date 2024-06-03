import 'package:get/get.dart';
import 'package:lavex/data/model/my_clients.dart';
import '../../data/data_source/remote/api_service.dart';

class MyClientController extends GetxController {
  var myClientModel = <MyClientModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    myClientData();
    super.onInit();
  }

  void myClientData() async {
    try {
      isLoading(true);
      List<MyClientModel> mydata = await ApiServices().myClient();
      myClientModel.addAll(mydata);
    } finally {
      isLoading(false);
    }
  }
}
