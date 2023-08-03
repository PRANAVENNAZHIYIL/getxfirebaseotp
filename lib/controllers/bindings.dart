import 'package:get/get.dart';
import 'package:get_login_firebase/controllers/signin_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Signincontroller>(() => Signincontroller());
  }
}
