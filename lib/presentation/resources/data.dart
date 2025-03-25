import 'package:flutter/material.dart';

import 'app_colors.dart';

List chatDetailsTiles = [mediaTypes, additions, shareInfo, additionalShareInfo];

final List<({IconData icon, String media, String number})> callsTypes = [
  (icon: Icons.phone, media: "Audio", number: ""),
  (icon: Icons.video_call, media: "Video", number: ""),
  (icon: Icons.search, media: "Search", number: ""),
];

final List<({String number, String media, IconData icon})> mediaTypes = [
  (icon: Icons.notifications_outlined, media: "Media, Links and docs", number: "509"),
  (icon: Icons.star_border_outlined, media: "Starred Messages", number: "5")
];

final List<({String media, IconData icon, String number})> contactDetails = [(icon: Icons.person_pin, media: "Media, Links and docs", number: "")];

final List<({String media, IconData icon, String number})> commonGroup = [
  (icon: Icons.add_circle_outline, media: "Create group with Mai", number: ""),
  (icon: Icons.group_add_outlined, media: "Problem solving mat", number: "")
];
final List<({String media, IconData icon, String? number})> additions = [
  (icon: Icons.notifications_outlined, media: "Notifications", number: ''),
  (icon: Icons.star_border_outlined, media: "wallPaper", number: ''),
  (icon: Icons.star_border_outlined, media: "Save to photo", number: 'Default'),
];

final List<({String media, Color color})> shareInfo = [
  (media: "Share contact", color: AppColors.green),
  (media: "Add to Favorites", color: AppColors.green),
  (media: "Add to list", color: AppColors.green),
  (media: "Export chat", color: AppColors.green),
  (media: "Clear chat", color: AppColors.pink),
];

final List<({Color color, String media})> additionalShareInfo = [
  (media: "Block Mai ", color: AppColors.pink),
  (media: "Report Mai", color: AppColors.pink),
];
