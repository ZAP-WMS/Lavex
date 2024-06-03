import 'package:get/get_instance/src/bindings_interface.dart';
import '../dependency/binding_dependency.dart';

class CreateInvoiceBinding extends Bindings {
  @override
  void dependencies() {
    bindingInvoiceController();
  }
}
