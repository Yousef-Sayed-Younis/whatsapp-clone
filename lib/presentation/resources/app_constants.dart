import 'app_icons.dart';

class AppConstants {
  AppConstants._();

  static const double appBarHeight = 56;

  // Main View Bottom Nav Bar
  static const List<({String icon, String label, String activeIcon})> mainNavBar = [
    (label: "Updates", icon: AppIcons.updates, activeIcon: AppIcons.updatesFill),
    (label: "Calls", icon: AppIcons.calls, activeIcon: AppIcons.callsFill),
    (label: "Communities", icon: AppIcons.communities, activeIcon: AppIcons.communitiesFill),
    (label: "Chats", icon: AppIcons.chats, activeIcon: AppIcons.chatsFill),
    (label: "Settings", icon: AppIcons.settings, activeIcon: AppIcons.settingsFill),
  ];
}
