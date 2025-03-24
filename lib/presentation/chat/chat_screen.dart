import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/routes.dart';
import 'widgets/text_chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  static final textController = TextEditingController();

  static const List<({String text, bool isSender})> _messages = [
    (text: "Perfect. See you then! 🚀", isSender: false),
    (text: "4 PM?", isSender: true),
    (text: "Sold! 😆 What time?", isSender: false),
    (text: "How about that new café downtown? Heard they have amazing pastries. 🍩", isSender: true),
    (text: "Ooo, yes! Where?", isSender: false),
    (text: "Same! Thinking about grabbing a coffee. ☕ Wanna join?", isSender: true),
    (text: "Not much, just chilling. You?", isSender: false),
    (text: "Hey! What's up?", isSender: true),
  ];

  @override
  void dispose() => {textController.dispose(), super.dispose()};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildChatBody(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(48),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AppBar(
            elevation: 0,
            backgroundColor: const Color(0x802A2A2A),
            shape: Border(bottom: BorderSide(color: const Color(0x26FFFFFF), width: 0.5)),
            titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.white),
            leading: GestureDetector(onTap: () => Get.back(), child: SvgPicture.asset(AppIcons.backArrow, fit: BoxFit.scaleDown)),
            title: GestureDetector(
              onTap: () => Get.toNamed(NamedRoutes.chatDetails),
              child: Row(
                spacing: 10,
                children: [CircleAvatar(radius: 18, backgroundColor: AppColors.white, child: FlutterLogo()), Text("Sebastian")],
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: SvgPicture.asset(AppIcons.videoCall)),
              IconButton(onPressed: () {}, icon: SvgPicture.asset(AppIcons.phone)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatBody() {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            reverse: true,
            itemCount: _messages.length,
            padding: const EdgeInsets.symmetric(vertical: 10),
            separatorBuilder: (_, __) => const SizedBox(height: 4),
            itemBuilder: (_, index) => TextChatBubble(message: _messages[index]),
          ),
        ),
        _buildBottomBar(),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Color(0xFF171717), border: Border(top: BorderSide(width: 0.5, color: Color(0xFF393939)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(child: SvgPicture.asset(AppIcons.plus)),
          SizedBox(
            height: 30,
            width: 250,
            child: TextField(
              controller: textController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF2C2C2D),
                contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 9),
                suffixIcon: GestureDetector(child: SvgPicture.asset(AppIcons.sticker, fit: BoxFit.scaleDown)),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)), borderSide: BorderSide(width: 0.5, color: Color(0xFF4B4B4C))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)), borderSide: BorderSide(width: 0.5, color: Color(0xFF4B4B4C))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)), borderSide: BorderSide(width: 0.5, color: Color(0xFF4B4B4C))),
              ),
            ),
          ),
          GestureDetector(onTap: () {}, child: SvgPicture.asset(AppIcons.camera)),
          GestureDetector(onTap: () {}, child: SvgPicture.asset(AppIcons.microphone)),
        ],
      ),
    );
  }
}
