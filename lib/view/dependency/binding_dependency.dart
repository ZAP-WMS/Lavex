import 'package:get/get.dart';
import 'package:lavex/view/controller/index_controller.dart';

void bindingIndexController() =>
    Get.lazyPut<IndexController>(() => IndexController());
