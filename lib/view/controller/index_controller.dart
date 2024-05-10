import 'package:get/get.dart';

class IndexController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int newIndex) {
    currentIndex.value = newIndex;
  }
}
