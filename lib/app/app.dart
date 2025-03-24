import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_app/presentation/resources/theme.dart';

import '../presentation/resources/routes.dart';

class WhatsappClone extends StatelessWidget {
  const WhatsappClone({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return GetMaterialApp(
          theme: AppTheme.getTheme(),
          debugShowCheckedModeBanner: false,
          getPages: RouteGenerator.getRoute(),
          initialRoute: NamedRoutes.chatScreen,
        );
      },
    );
  }
}
