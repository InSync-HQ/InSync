import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

BottomNavigationBar buildBottomNavigationBar(
    BuildContext context, void Function(int) onTap, int currentIndex) {
  return BottomNavigationBar(
    onTap: onTap,
    type: BottomNavigationBarType.fixed,
    currentIndex: currentIndex,
    showUnselectedLabels: true,
    selectedFontSize: 14,
    selectedItemColor: Theme.of(context).primaryColor,
    unselectedItemColor: const Color(0xff5C657D).withOpacity(0.5),
    // ignore: prefer_const_literals_to_create_immutables
    items: [
      const BottomNavigationBarItem(
        icon: Icon(FeatherIcons.layers),
        label: 'News',
      ),
      const BottomNavigationBarItem(
        icon: Icon(FeatherIcons.users),
        label: 'Community',
      ),
      const BottomNavigationBarItem(
        icon: Icon(FeatherIcons.smile),
        label: 'Profile',
      ),
    ],
  );
}
