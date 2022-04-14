import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:insync/widgets/news_tag.dart';

class CommunityOverview extends StatelessWidget {
  const CommunityOverview({
    Key? key,
    required this.communityName,
    required this.imgURL,
  }) : super(key: key);
  final String communityName;
  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            communityName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                  Radius.circular(500),
                )),
                child: Image(
                  height: 200,
                  width: 200,
                  image: NetworkImage(imgURL),
                ),
              ),
            ),
            Center(
              child: Text(
                communityName,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Center(
              child: Text("20 members"),
            ),
            const Divider(thickness: 2),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(imgURL),
                  ),
                  title: const Text("member name"),
                  subtitle: index == 0
                      ? const NewsTag(title: "Moderator", color: Colors.grey)
                      : null,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: const FloatingActionButton.extended(
          label: Text(
            "Join Community",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          icon: Icon(FeatherIcons.userPlus),
          onPressed: null,
        ));
  }
}
