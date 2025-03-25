import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatsapp_clone_app/presentation/resources/app_icons.dart';

import '../../auth/data/lists/status_list.dart';
import '../../chat/chat_screen.dart';
import '../../chat/new_chat_selection.dart';
import '../../resources/app_colors.dart';
import '../../resources/routes.dart';

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
      // body: _buildBody(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            centerTitle: true,
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
              )
            ],
            expandedHeight: 100,
            flexibleSpace: LayoutBuilder(
              builder: (_, constraints) {
                double percent = (constraints.maxHeight - kToolbarHeight) / (200.0 - kToolbarHeight);
                double horizontalPadding = percent * 20.0; // Adjust padding dynamically

                return FlexibleSpaceBar(
                  centerTitle: percent.isLowerThan(.5),
                  titlePadding: EdgeInsetsDirectional.only(bottom: 16, start: horizontalPadding),
                  title: Text("Chats", style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold)),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
              (_, index) => ListTile(
                minTileHeight: 76.5,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                subtitle: Text("Hello New User", style: TextStyle(fontSize: 14, color: AppColors.grey)),
                leading: CircleAvatar(radius: 28, backgroundColor: AppColors.white, child: FlutterLogo()),
                trailing: Column(children: [Text("23:45", style: TextStyle(fontSize: 14, color: AppColors.grey))]),
                title: Text("Yousef Sayed", style: TextStyle(fontSize: 16, color: AppColors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: MediaQuery.sizeOf(context).height / (1.4).h,
            child: ListView.separated(
              itemCount: 2,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) => _buildListTileHomeBody(index, context),
            ),
          ),
        ],
      ),
    );
  }

  InkWell _buildListTileHomeBody(int index, BuildContext context) {
    return InkWell(
      onTap: () {
        if (listStatus[index].name == "Mai") {
          Get.toNamed(NamedRoutes.chatScreen, arguments: contacts[index].displayName);
        } else {
          Get.to(ChatScreen());
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => ChatScreen(imageUrl: listStatus[index].image, isName: listStatus[index].name)));
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
        // onTap: () => ChatScreen(imageUrl: listStatus[index].image, name: listStatus[index].name),
        title: Text(listStatus[index].name, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
      ),
    );
  }

  FloatingActionButton _buildFloatingButton() {
    return FloatingActionButton(
      backgroundColor: AppColors.secondaryColor,
      child: const Icon(Icons.chat, color: Colors.white),
      onPressed: () => Get.to(() => NewChatSelection(contacts: contacts, isGroup: false)),
    );
  }
}

//ChatScreen(imageUrl: listStatus[index].image, name: listStatus[index].name)
