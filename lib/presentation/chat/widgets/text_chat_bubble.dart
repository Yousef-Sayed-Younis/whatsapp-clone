import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/app_assets.dart';
import '../../resources/app_colors.dart';
import 'chat_bubble.dart';

class TextChatBubble extends StatefulWidget {
  final ({bool isSender, String text}) message;
  const TextChatBubble({super.key, required this.message});

  @override
  State<TextChatBubble> createState() => _TextChatBubbleState();
}

class _TextChatBubbleState extends State<TextChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.message.isSender ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        child: CustomPaint(
          painter: ChatBubble(
            color: widget.message.isSender ? Color(0xFF005146) : Color(0xFF363637),
            alignment: widget.message.isSender ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
          ),
          child: Container(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 4),
            constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * .7),
            margin: widget.message.isSender ? const EdgeInsets.fromLTRB(7, 7, 14, 7) : const EdgeInsets.fromLTRB(17, 7, 7, 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildCustomRow(
                  children: [
                    Flexible(
                      child: Text(widget.message.text,
                          textAlign: TextAlign.start, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white)),
                    ),
                    if (widget.message.text.length <= 20)
                      Text("12.00", style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.white.withAlpha(140))),
                    if (widget.message.isSender && widget.message.text.length <= 20) _buildCheckmarkIcon(MessageStatus.read)
                  ],
                ),
                _buildCustomRow(
                  children: [
                    if (widget.message.text.length > 20)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text("12.00", style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.white.withAlpha(140))),
                      ),
                    if (widget.message.isSender && widget.message.text.length > 20) _buildCheckmarkIcon(MessageStatus.read)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildCustomRow({required List<Widget> children}) {
    return Row(
      spacing: 5,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: children,
    );
  }

  Widget _buildCheckmarkIcon(MessageStatus status) {
    return switch (status) {
      MessageStatus.sent => SvgPicture.asset(AppIcons.check, colorFilter: ColorFilter.mode(AppColors.white.withAlpha(89), BlendMode.srcIn)),
      MessageStatus.delivered =>
        SvgPicture.asset(AppIcons.doubleCheck, colorFilter: ColorFilter.mode(AppColors.white.withAlpha(89), BlendMode.srcIn)),
      MessageStatus.read => SvgPicture.asset(AppIcons.doubleCheck, colorFilter: const ColorFilter.mode(Color(0xFF34A0FF), BlendMode.srcIn))
    };
  }
}

enum MessageStatus { sent, delivered, read }
