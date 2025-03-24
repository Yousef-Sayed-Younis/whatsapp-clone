import 'package:get/get.dart';

import '../auth/login/login_screen.dart';
import '../auth/otp/otp_screen.dart';
import '../auth/profile_screen.dart';
import '../auth/register/register_screen.dart';
import '../chat/chat_details.dart';
import '../chat/chat_screen.dart';
import '../chat/new_chat_selection.dart';
import '../main/main_view.dart';
import '../splash/splash_screen.dart';

class NamedRoutes {
  NamedRoutes._();
  //
  static const String splashScreen = "/";

  static const String otpScreen = "/otp";
  static const String loginScreen = "/login";
  static const String profileScreen = "/profile";
  static const String registerScreen = "/register";

  static const String mainView = "/main";
  static const String chatScreen = "/chat";
  static const String chatDetails = "/chat-details";
  static const String newChatSelection = "/new-chat-selection";
}

class RouteGenerator {
  static List<GetPage> getRoute() {
    return [
      GetPage(name: NamedRoutes.splashScreen, page: () => const SplashScreen()),
      //
      GetPage(name: NamedRoutes.loginScreen, page: () => const LoginScreen()),
      GetPage(name: NamedRoutes.profileScreen, page: () => const ProfileScreen()),
      GetPage(name: NamedRoutes.registerScreen, page: () => const RegisterScreen()),
      GetPage(name: NamedRoutes.otpScreen, page: () => OtpScreen(phone: Get.arguments)),

      GetPage(name: NamedRoutes.chatScreen, page: () => ChatScreen()),
      GetPage(name: NamedRoutes.chatDetails, page: () => ChatDetails()),
      GetPage(name: NamedRoutes.mainView, page: () => const MainView()),
      GetPage(name: NamedRoutes.newChatSelection, page: () => NewChatSelection(contacts: Get.arguments, isGroup: Get.arguments)),
    ];
  }
}
