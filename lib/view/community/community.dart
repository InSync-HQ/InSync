// ignore_for_file: avoid_print

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:insync/view/community/create_community_overlay.dart';
import 'package:insync/widgets/button.dart';
import 'package:insync/widgets/community_chat_tile.dart';
import 'package:insync/widgets/input_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Community extends StatefulWidget {
  const Community({
    Key? key,
  }) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  List communitiesarr = [];
  @override
  void initState() {
    super.initState();
    initalizeCommunities();
  }

  void initalizeCommunities() async {
    try {
      late SharedPreferences prefs;
      prefs = await SharedPreferences.getInstance();
      print(prefs.getString("jwt"));
      Response response = await Dio().get(
        "https://insync-backend-2022.herokuapp.com/community/fetchAll",
        options: Options(
          headers: {
            "Authorization": prefs.getString("jwt"),
          },
        ),
      );
      print("🍩🍩🍩");
      print(response.data.toString());
      setState(() {
        communitiesarr = response.data["communties"];
      });
    } catch (err) {
      print(err.toString() + " 👉👉 you have some error in the community page");
    }
  }

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const InputField(
              label: "Search for a community",
              search: true,
              placeholder: "Search for a community",
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    buttonTitle: "Create",
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return const CreateCommunityOverlay();
                        },
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24)),
                        ),
                      );
                    },
                    bgColor: Theme.of(context).primaryColor.withOpacity(0.2),
                    textColor: Theme.of(context).primaryColorDark,
                    iconLeft: const Icon(FeatherIcons.plusCircle),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: PrimaryButton(
                    buttonTitle: "Discover",
                    onPressed: () {
                      Navigator.of(context).pushNamed("/discover");
                    },
                    bgColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.25),
                    textColor: Theme.of(context).colorScheme.secondary,
                    iconLeft: const Icon(FeatherIcons.compass),
                  ),
                ),
              ],
            ),
            if (communitiesarr.isEmpty)
              // Empty State
              Column(
                children: const [
                  SizedBox(height: 64),
                  Image(image: AssetImage("assets/nocommunities.png")),
                  Text(
                    "No communities found",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Join communities or simply create one",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff5C657D),
                    ),
                  ),
                ],
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: communitiesarr.length,
                  itemBuilder: (context, index) => CommunityChatTile(
                    communityName: communitiesarr[index]["name"],
                    imgURL:
                        "https://picsum.photos/seed/${Random().nextInt(100)}/300/300",
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
