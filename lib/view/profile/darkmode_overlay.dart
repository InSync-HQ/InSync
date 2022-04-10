import 'package:flutter/material.dart';
import 'package:insync/utils/constants.dart';
import 'package:stacked_themes/stacked_themes.dart';

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
    initialization();
    super.initState();
  }

  void initialization() async {
    _thememode = getThemeManager(context).isDarkMode ? "dark" : "light";
    //   var theme = await Constants.retrievethemePref();
    //   if (theme == 1) {
    //     setState(() {
    //       _thememode = "system";
    //     });
    //   }
    //   if (theme == 2) {
    //     setState(() {
    //       _thememode = "light";
    //     });
    //   }
    //   if (theme == 3) {
    //     setState(() {
    //       _thememode = "dark";
    //     });
    //   }
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
              // ListTile(
              //   onTap: () {
              //     getThemeManager(context).setThemeMode(ThemeMode.system);
              //     setState(() {
              //       _thememode = "system";
              //       Constants.themeSystemPref();
              //     });
              //   },
              //   title: const Text('System'),
              //   leading: Radio(
              //     value: "system",
              //     groupValue: _thememode,
              //     onChanged: (String? value) {
              //       getThemeManager(context).setThemeMode(ThemeMode.system);
              //       setState(() {
              //         _thememode = value;
              //       });
              //     },
              //   ),
              // ),
              ListTile(
                onTap: () {
                  getThemeManager(context).setThemeMode(ThemeMode.light);
                  print(_thememode);
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
                    getThemeManager(context).setThemeMode(ThemeMode.light);
                    setState(() {
                      _thememode = value;
                      Constants.themeLightPref();
                    });
                  },
                ),
              ),
              ListTile(
                onTap: () {
                  getThemeManager(context).setThemeMode(ThemeMode.dark);
                  print(_thememode);
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
                    getThemeManager(context).setThemeMode(ThemeMode.dark);
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
