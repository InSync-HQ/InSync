import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:insync/view/community/create_community_overlay.dart';
import 'package:insync/widgets/button.dart';
import 'package:insync/widgets/input_field.dart';

class Community extends StatefulWidget {
  const Community({
    Key? key,
  }) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
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
            const Spacer(),
            Column(
              children: const [
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
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
