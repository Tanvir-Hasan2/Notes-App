import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../business_logic/controllers/auth_controller.dart';
import '../../const/app_colors.dart';
import '../../routes/route.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class Registration extends StatelessWidget {
  Registration({super.key});
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  RxBool _value = false.obs;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Image.asset(
                    'assets/icons/logo.png',
                    width: 40.w,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign Up',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  customFormField(
                      TextInputType.text, _nameController, context, 'Name',
                      (val) {
                    if (val.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                  }, prefixIcon: Icons.person_2_outlined),
                  customFormField(TextInputType.emailAddress, _emailController,
                      context, 'Email', (val) {
                    if (val.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                    if (!val.contains(RegExp(r'\@'))) {
                      return 'enter a valid email address';
                    }
                  }, prefixIcon: Icons.email_outlined),
                  customFormField(TextInputType.text, _passwordController,
                      context, 'Password', (val) {
                    if (val.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                  },
                      prefixIcon: Icons.lock,
                      obscureText: true),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: 200,
                      height: 45,
                      child: customButton(
                        'Sign Up',
                        () {
                          if (_formKey.currentState!.validate()) {
                            Get.find<AuthController>().signUp(
                                _nameController.text,
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                                context);
                          } else {
                            print('failed');
                          }
                        },
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(color: AppColors.grayColor)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(login),
                        text: ' Login',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                  ]))
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
