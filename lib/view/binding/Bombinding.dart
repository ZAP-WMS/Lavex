import 'package:get/get_instance/src/bindings_interface.dart';
import '../controller/bom_additem_controller.dart';

class BomBinding extends Bindings {
  @override
  void dependencies() {
    BomAddItemController();
  }
}
