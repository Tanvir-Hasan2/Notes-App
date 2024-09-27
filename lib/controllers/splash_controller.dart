import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_app/ui/pages/home_page.dart';
import 'package:note_app/ui/pages/login.dart';
import '../../routes/route.dart';

class SplashController extends GetxController {
  final box = GetStorage();
  chooseScreen() {
    var value = box.read('user');
    if (value == null) {
      Get.off(Login());
    } else {
      Get.off(HomePage());
    }
  }

  @override
  void onInit() {
    Timer(Duration(seconds: 3), () => chooseScreen());
    super.onInit();
  }
}
