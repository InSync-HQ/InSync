import 'package:flutter/material.dart';
import 'package:insync/utils/constants.dart';
import 'package:insync/widgets/button.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: PrimaryButton(
                buttonTitle: "Log out",
                onPressed: () {
                  Constants.logoutPref();
                  Navigator.pushNamed(context, '/authorization');
                }),
          ),
        ],
      ),
    );
  }
}
