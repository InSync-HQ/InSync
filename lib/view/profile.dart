import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:insync/utils/constants.dart';
import 'package:insync/main.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isSwitched = false;
  String visibilityVal = 'Private';
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        visibilityVal = 'Public';
      });
    } else {
      setState(() {
        isSwitched = false;
        visibilityVal = 'Private';
      });
    }
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
              "Dark Mode",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            subtitle: const Text("system prefrence"),
            // trailing: CupertinoSwitch(
            //   value: isSwitched,
            //   onChanged: null,
            //   activeColor: Theme.of(context).primaryColor,
            // ),
            trailing: const Icon(FeatherIcons.chevronRight),
            onTap: () {
              // toggleSwitch(isSwitched);
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
          const ProfileTile(
            title: "About us",
            leadIcon: FeatherIcons.info,
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

class DarkModeOverlay extends StatefulWidget {
  const DarkModeOverlay({
    Key? key,
  }) : super(key: key);

  @override
  State<DarkModeOverlay> createState() => _DarkModeOverlayState();
}

class _DarkModeOverlayState extends State<DarkModeOverlay> {
  String? _thememode;
  @override
  void initState() {
    // _thememode = "system";
    super.initState();
    initialization();
  }

  void initialization() async {
    var theme = await Constants.retrievethemePref();
    if (theme == 1) {
      setState(() {
        _thememode = "system";
      });
    }
    if (theme == 2) {
      setState(() {
        _thememode = "light";
      });
    }
    if (theme == 3) {
      setState(() {
        _thememode = "dark";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.3,
        builder: (_, controller) => Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(context).bottomAppBarColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: ListView(
            controller: controller,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Dark Mode",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ListTile(
                onTap: () {
                  setState(() {
                    _thememode = "system";
                    Constants.themeSystemPref();
                  });
                },
                title: const Text('System'),
                leading: Radio(
                  value: "system",
                  groupValue: _thememode,
                  onChanged: (String? value) {
                    setState(() {
                      _thememode = value;
                    });
                  },
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    _thememode = "light";
                    Constants.themeLightPref();
                  });
                },
                title: const Text('Light'),
                leading: Radio(
                  value: "light",
                  groupValue: _thememode,
                  onChanged: (String? value) {
                    setState(() {
                      _thememode = value;
                      Constants.themeLightPref();
                    });
                  },
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    _thememode = "dark";
                    Constants.themeDarkPref();
                  });
                },
                title: const Text('Dark'),
                leading: Radio(
                  value: "dark",
                  groupValue: _thememode,
                  onChanged: (String? value) {
                    setState(() {
                      _thememode = value;
                      Constants.themeDarkPref();
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
