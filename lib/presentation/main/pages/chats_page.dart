import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_icons.dart';
import '../../resources/routes.dart';
import 'widgets/animated_title_bar.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  static List<Contact> contacts = [];

  Future<void> _getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      contacts = await FlutterContacts.getContacts(withProperties: true);
    }
  }

  @override
  void initState() => {_getContacts(), super.initState()};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedTitleBar(
        hasLeading: true,
        pageTitle: "Chats",
        actions: [
          IconButton.filled(
            onPressed: () {},
            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppColors.darkGrey)),
            icon: SvgPicture.asset(AppIcons.cameraFill, colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn)),
          ),
          IconButton.filled(
            onPressed: () {},
            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppColors.primary)),
            icon: SvgPicture.asset(AppIcons.plusNew, colorFilter: ColorFilter.mode(AppColors.darkBg, BlendMode.srcIn)),
          ),
        ],
        bodyDelegate: SliverChildBuilderDelegate(
          childCount: 50,
          (_, index) => ListTile(
            minTileHeight: 76.5,
            onTap: () => Get.toNamed(NamedRoutes.chatScreen),
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            subtitle: Text("Hello New User", style: TextStyle(fontSize: 14, color: AppColors.grey)),
            leading: CircleAvatar(radius: 28, backgroundColor: AppColors.white, child: FlutterLogo()),
            trailing: Column(children: [Text("23:45", style: TextStyle(fontSize: 14, color: AppColors.grey))]),
            title: Text("Yousef Sayed", style: TextStyle(fontSize: 16, color: AppColors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
