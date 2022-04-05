import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:insync/widgets/bottom_nav_bar.dart';
import 'package:insync/widgets/button.dart';
import 'package:insync/widgets/input_field.dart';
/*
  this has the bottom navigation bar of the app
*/

class MainApp extends StatefulWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  //add widgets of all relevant screens here
  final List<Widget> _children = [
    const Home(),
    const Community(),
    const Profile(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return _children[index];
        },
      ),
      // bottom navbar
      bottomNavigationBar:
          buildBottomNavigationBar(context, onTabTapped, _currentIndex),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Home"),
    );
  }
}

class Community extends StatelessWidget {
  const Community({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Communities",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const InputField(
              label: "Search for a community",
              search: true,
              placeholder: "Search for a community",
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const PrimaryButton(
                  buttonTitle: "Create",
                  onPressed: null,
                  bgColor: Color(0xffFFD4D4),
                  textColor: Color(0xffBD3A4A),
                  iconLeft: Icon(FeatherIcons.plusCircle),
                ),
                const PrimaryButton(
                  buttonTitle: "Discover",
                  onPressed: null,
                  bgColor: Color(0xffD3E5FE),
                  textColor: Color(0xff1B4ACB),
                  iconLeft: Icon(FeatherIcons.compass),
                ),
              ],
            ),
            const Spacer(),
            const Image(image: AssetImage("assets/nocommunities.png")),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Profile"),
    );
  }
}
