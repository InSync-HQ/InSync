import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:insync/utils/constants.dart';
import 'package:insync/view/profile/darkmode_overlay.dart';
import 'package:stacked_themes/stacked_themes.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    // getName();
  }

  void getName() async {
    var response = await Dio().get(
      'https://insync-backend-2022.herokuapp.com/user/fetchById',
    );
    print("👇👇👇");
    print(response.data.toString());
    print("👆👆👆");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          ListTile(
            leading: const Image(
              image: AssetImage("assets/avatar.png"),
            ),
            title: const Text("Welcome"),
            subtitle: Text(
              "Hayat Tamboli",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).listTileTheme.iconColor,
              ),
            ),
          ),
          const SizedBox(height: 36),
          ProfileTile(
            title: "Edit Profile",
            leadIcon: FeatherIcons.user,
            onTap: () {
              Navigator.of(context).pushNamed("/editprofile");
            },
          ),
          const ProfileTile(
            title: "Change Intrests",
            leadIcon: FeatherIcons.edit2,
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: Icon(
              FeatherIcons.moon,
              color: Theme.of(context).listTileTheme.iconColor,
              size: 24,
            ),
            title: const Text(
              "Theme",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            subtitle: getThemeManager(context).isDarkMode
                ? const Text("Dark mode")
                : const Text("Light mode"),
            trailing: const Icon(FeatherIcons.chevronRight),
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return const DarkModeOverlay();
                },
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                ),
              );
            },
          ),
          ProfileTile(
            title: "About us",
            leadIcon: FeatherIcons.info,
            onTap: () {
              Navigator.of(context).pushNamed("/aboutus");
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TextButton(
              child: Text(
                "Log out",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onPressed: () {
                Constants.logoutPref();
                Navigator.pushNamed(context, '/authorization');
              },
            ),
          ),
          const Spacer(),
          const Center(
            child: Text(
              "v1.0",
              style: TextStyle(color: Color(0xff959CAB)),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key? key,
    required this.title,
    required this.leadIcon,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Function()? onTap;
  final IconData leadIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      leading: Icon(
        leadIcon,
        color: Theme.of(context).listTileTheme.iconColor,
        size: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
      trailing: const Icon(FeatherIcons.chevronRight),
      onTap: onTap,
    );
  }
}
