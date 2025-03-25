import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/app_colors.dart';
import 'controller.dart';
import 'otp_custom.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({super.key, required this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  static GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Enter OTP Code", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        leading: IconButton(onPressed: () => Get.back, icon: const Icon(Icons.arrow_back, color: AppColors.secondaryColor)),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Code has been sent to +${(widget.phone.isEmpty) ? "0125469873" : widget.phone}", textAlign: TextAlign.center),
              _buildOtpShape(context),
              ElevatedButton(
                onPressed: () async {},
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondaryColor),
                child: const Text("verify", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildOtpShape(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.sizeOf(context).height / 7,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        spacing: 2,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OTP(last: false, first: true, phoneController: c1),
          OTP(last: false, first: false, phoneController: c2),
          OTP(last: false, first: false, phoneController: c3),
          OTP(last: false, first: false, phoneController: c4),
          OTP(last: false, first: false, phoneController: c5),
          OTP(last: true, first: false, phoneController: c6)
        ],
      ),
    );
  }
}
