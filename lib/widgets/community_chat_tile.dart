import 'package:flutter/material.dart';
import 'package:insync/view/forum/forum_detail.dart';

class CommunityChatTile extends StatelessWidget {
  const CommunityChatTile({
    Key? key,
    required this.communityName,
    required this.imgURL,
  }) : super(key: key);
  final String communityName;
  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: ListTile(
            onTap: (() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const ForumDetailPage();
                  },
                ),
              );
            }),
            style: ListTileStyle.drawer,
            leading: CircleAvatar(
              radius: 24,
              foregroundImage: NetworkImage(imgURL),
            ),
            title: Text(communityName),
            subtitle: const Text("last text message"),
            trailing: const Text("x days ago"),
          ),
        ),
        const Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
