import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';

import '../auth/data/lists/status_list.dart';
import '../main/custom_popup_menu_button.dart';
import '../resources/app_colors.dart';

class NewChatSelection extends StatelessWidget {
  final bool isGroup;
  final List<Contact> contacts;
  const NewChatSelection({super.key, required this.isGroup, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      appBar: _buildAppBar(),
      backgroundColor: AppColors.secondBackground,
      floatingActionButton: isGroup ? _buildFloatingActionButton() : null,
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        // Get.off(() => ChatScreen(imageUrl: selectedImage!, name: selectedContact!));
        // ModelStatus(name: selectedContact!, image: selectedImage!, time: "");
      },
      backgroundColor: AppColors.secondaryColor,
      child: const Icon(Icons.arrow_forward, color: Colors.white),
    );
  }

  Widget _buildBody() {
    return ListView.separated(
      itemCount: contacts.length,
      padding: const EdgeInsets.symmetric(vertical: 10),
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, index) => ListTile(
        leading: CircleAvatar(radius: 30, backgroundImage: NetworkImage(listStatus[index].image)),
        subtitle: Text(contacts[index].phones.isNotEmpty ? contacts[index].phones.first.number : "No Phones"),
        title: Text(contacts[index].displayName, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 22)),
        onTap: () {
          if (isGroup) {
            // Get.off(() => ChatScreen(imageUrl: selectedImage!, name: selectedContact!));
            // ModelStatus(name: selectedContact!, image: selectedImage!, time: "");
          } else {
            // Get.offNamed(NamedRoutes.chatScreen, arguments: Chat.newChat(isGroup, participantsId));
          }
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        elevation: 2,
        shadowColor: Colors.black,
        backgroundColor: AppColors.secondBackground,
        title: const Text("Select Contact", style: TextStyle(fontWeight: FontWeight.w500)),
        actions: const [Icon(Icons.search), CustomPopupMenuButton(text1: "Report", text2: "Block", text3: "Clear chat", text4: "Export chat")]);
  }
}

class StatusList {
  final String name;
  final String image;

  StatusList({required this.name, required this.image});
}
