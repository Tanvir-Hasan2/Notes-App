import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/route.dart';

class SplashController extends GetxController {
  final box = GetStorage();
  chooseScreen() {
    var value = box.read('user');
    if (value == null) {
      Get.offAndToNamed(login);
    } else {
      Get.offAndToNamed(home);
    }
  }

  @override
  void onInit() {
    Timer(Duration(seconds: 3), () => chooseScreen());
    super.onInit();
  }
}
