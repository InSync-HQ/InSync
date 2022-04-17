import 'package:flutter/material.dart';
import 'package:insync/utils/classes.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({Key? key, required this.entry}) : super(key: key);

  final MessageDataClass entry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(entry.imgURL),
          ),
          title: Text(entry.username),
          subtitle: Text(entry.hours),
        ),
        Container(
          margin: const EdgeInsets.only(left: 64.0, right: 16.0, bottom: 2.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: Text(entry.text),
        ),
      ],
    );
  }
}
