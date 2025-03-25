import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../auth/data/lists/status_list.dart';
import '../chat/new_chat_selection.dart';
import '../resources/app_colors.dart';
import '../resources/routes.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  static List<Contact> contacts = [];
  static DateTime hours = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackground,
      body: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: MediaQuery.sizeOf(context).height / (1.3).h,
            child: ListView.separated(
              itemCount: 2,
              itemBuilder: _buildListTileHomeBody,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => NewChatSelection(contacts: contacts, isGroup: false));
          // Navigator.pushNamed(context, NewChatSelection(isExcit: ""));
        },
        backgroundColor: AppColors.secondaryColor,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  InkWell _buildListTileHomeBody(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        if (listStatus[index].name == "Mai") {
          Get.toNamed(NamedRoutes.chatScreen, arguments: contacts[index].displayName);
        }
      },
      child: ListTile(
        contentPadding: EdgeInsets.only(top: 10.h, right: 5.h),
        leading: CircleAvatar(radius: 30.h, backgroundImage: NetworkImage(listStatus[index].image)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(listStatus[index].time, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
            CircleAvatar(radius: 12.h, backgroundColor: AppColors.secondaryColor, child: const Text("2", style: TextStyle(color: Colors.white)))
          ],
        ),
        title: Text(listStatus[index].name, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

//ChatScreen(imageUrl: listStatus[index].image, name: listStatus[index].name)
