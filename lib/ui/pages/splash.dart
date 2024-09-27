import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/splash_controller.dart';

class Splash extends StatelessWidget {
  final _controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/icons/logo.png',
          width: 100.w,
        ),
      ),
    );
  }
}
