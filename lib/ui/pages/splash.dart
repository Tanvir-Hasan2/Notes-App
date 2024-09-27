import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';


class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  final box = GetStorage();

  chooseScreen() {
    var value = box.read('user');
    if (value == null) {
      //Get.off(Login());
      context.go('/login');
    } else {
      context.go('/home');
    }
  }

 @override
  void initState() {
   Timer(Duration(seconds: 3), () => chooseScreen());
    // TODO: implement initState
    super.initState();
  }

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
