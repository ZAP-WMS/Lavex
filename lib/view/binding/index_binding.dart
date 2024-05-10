import 'package:get/get_instance/src/bindings_interface.dart';
import '../dependency/binding_dependency.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    bindingIndexController();
  }
}
