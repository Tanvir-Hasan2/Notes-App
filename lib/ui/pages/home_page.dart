import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../business_logic/controllers/auth_controller.dart';
import '../../routes/route.dart';
import '../style/app_styles.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
 final _controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       actions: [
         IconButton(onPressed: (){
             _controller.logout();
             Get.showSnackbar(AppStyles().successSnacBar('Logout successfully'));
             Get.offAndToNamed(login);

         }, icon: Icon(Icons.logout))
       ],
      ),
      body: Center(
        child: Text("This is home page"),
      ),
    );
  }
}
