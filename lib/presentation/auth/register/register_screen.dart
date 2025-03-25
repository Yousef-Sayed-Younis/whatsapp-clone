import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../resources/app_colors.dart';
import '../../resources/routes.dart';
import '../base/field_type.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/shareable_widgets_signin_signup.dart';
import 'register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final controller = RegisterController();

  @override
  void dispose() => {controller.dispose(), super.dispose()};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildRegisterBody(),
      backgroundColor: AppColors.backgroundColor,
    );
  }

  Widget _buildRegisterBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Form(
          key: controller.formKey,
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(width: 200.w, height: 200.h),
              const CustomTextAuth(title: "Register To New Account"),
              CustomTextFormField(fieldType: FieldType.username, icon: Icons.person, controller: controller),
              CustomTextFormField(fieldType: FieldType.email, icon: Icons.email_sharp, controller: controller),
              CustomTextFormField(fieldType: FieldType.phone, icon: Icons.phone_android_rounded, controller: controller),
              CustomTextFormField(fieldType: FieldType.password, icon: Icons.person, controller: controller),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  maximumSize: Size.fromHeight(150),
                  backgroundColor: AppColors.buttonsColor,
                ),
                onPressed: () async {
                  if (await controller.authenticate()) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign up successfully")));
                    Get.toNamed(NamedRoutes.loginScreen);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign up Failed")));
                  }
                },
                child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 25.h)),
              ),
              _buildLoginRow()
            ],
          ),
        ),
      ),
    );
  }

  Row _buildLoginRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Already have an account?", style: TextStyle(fontSize: 15.sp)),
      TextButton(
        onPressed: () => Get.offNamed(NamedRoutes.loginScreen),
        child: Text("Login", style: TextStyle(fontSize: 16.sp, color: AppColors.buttonsColor)),
      )
    ]);
  }
}
