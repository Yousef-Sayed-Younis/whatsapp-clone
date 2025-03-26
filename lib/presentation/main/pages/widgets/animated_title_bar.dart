import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';

class AnimatedTitleBar extends StatelessWidget {
  final bool hasLeading;
  final String pageTitle;
  final List<Widget> actions;
  final VoidCallback? onLeadingPressed;
  final SliverChildDelegate bodyDelegate;

  const AnimatedTitleBar({
    super.key,
    this.onLeadingPressed,
    this.hasLeading = false,
    this.actions = const [],
    required this.pageTitle,
    required this.bodyDelegate,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: false,
          centerTitle: true,
          actions: actions,
          expandedHeight: 110,
          backgroundColor: Colors.transparent,
          leading: hasLeading
              ? IconButton.filled(
                  onPressed: onLeadingPressed ?? () {},
                  style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppColors.darkGrey)),
                  icon: SvgPicture.asset(AppIcons.meatballs, colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn)),
                )
              : null,
          flexibleSpace: LayoutBuilder(
            builder: (_, constraints) {
              double percent = ((constraints.maxHeight - kToolbarHeight) / (200 - kToolbarHeight)).clamp(0.0, 1.0);
              double horizontalPadding = percent * 20;

              return Stack(
                children: [
                  if (percent < .3435) _buildBlurredBackground(),
                  FlexibleSpaceBar(
                    centerTitle: percent < .5,
                    titlePadding: EdgeInsetsDirectional.only(bottom: 16, start: horizontalPadding),
                    title: Text(pageTitle, style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold)),
                  )
                ],
              );
            },
          ),
        ),
        SliverList(delegate: bodyDelegate)
      ],
    );
  }

  Positioned _buildBlurredBackground() {
    return Positioned.fill(
      child: ClipRect(
        child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), child: ColoredBox(color: AppColors.white.withAlpha(5))),
      ),
    );
  }
}
