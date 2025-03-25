import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone_app/presentation/resources/app_constants.dart';

import '../resources/app_colors.dart';
import 'custom_popup_menu_button.dart';
import 'pages/calls_page.dart';
import 'pages/chats_page.dart';
import 'pages/status_page.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  static int currentIndex = 0;
  static const pages = [ChatsPage(), StatusScreen(), CallsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(),
      body: pages[currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      shadowColor: Colors.black,
      title: const Text("WhatsApp"),
      actions: const [Icon(Icons.search), CustomPopupMenuButton(text1: "Setting", text2: "Started", text3: "New Group", text4: "WhatsApp Web")],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: List.generate(
        AppConstants.mainNavBar.length,
        (index) => BottomNavigationBarItem(
          backgroundColor: AppColors.navBarBg,
          label: AppConstants.mainNavBar[index].label,
          icon: SvgPicture.asset(AppConstants.mainNavBar[index].icon, colorFilter: ColorFilter.mode(AppColors.navBarItem, BlendMode.srcIn)),
          activeIcon:
              SvgPicture.asset(AppConstants.mainNavBar[index].activeIcon, colorFilter: ColorFilter.mode(AppColors.navBarActiveItem, BlendMode.srcIn)),
        ),
      ),
    );
  }
}
