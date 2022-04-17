import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ForumDetailPage extends StatefulWidget {
  const ForumDetailPage({Key? key}) : super(key: key);
  @override
  _ForumDetailPageState createState() => _ForumDetailPageState();
}

//messages in the forum
var forumPostArr = [
  MessageDataClass(
    "Hayat",
    "2 Days ago",
    "Hi there, this is Hayat",
    imgURL:
        "https://steamuserimages-a.akamaihd.net/ugc/776245097832680892/909FF348D4B04BDAB8F79C9FED3EA491BE166E1A/?imw=637&imh=358&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true",
  ),
  MessageDataClass(
    "Siddhu",
    "23 Hours ago",
    "Yo, its suiddhu here",
    imgURL:
        "https://steamuserimages-a.akamaihd.net/ugc/776245097832680892/909FF348D4B04BDAB8F79C9FED3EA491BE166E1A/?imw=637&imh=358&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true",
  ),
  MessageDataClass("User3", "2 Days ago",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad mini veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      imgURL:
          "https://steamuserimages-a.akamaihd.net/ugc/776245097832680892/909FF348D4B04BDAB8F79C9FED3EA491BE166E1A/?imw=637&imh=358&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true"),
  MessageDataClass("User4", "2 Days ago",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut nim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      imgURL:
          "https://steamuserimages-a.akamaihd.net/ugc/776245097832680892/909FF348D4B04BDAB8F79C9FED3EA491BE166E1A/?imw=637&imh=358&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true"),
];

class _ForumDetailPageState extends State<ForumDetailPage> {
  final messagectr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var responses = Container(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        reverse: true,
        dragStartBehavior: DragStartBehavior.down,
        itemBuilder: (BuildContext context, int index) =>
            MessageTile(entry: forumPostArr[index]),
        itemCount: forumPostArr.length,
      ),
    );
    //title of forum
    return Scaffold(
      appBar: AppBar(
        title: const Text("Community Name"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.22,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 00.0),
                child: responses,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "type a message...",
                      ),
                      controller: messagectr,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    var message = messagectr.text;
                  },
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: const IconButton(
                      onPressed: null,
                      icon: Icon(
                        FeatherIcons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MessageDataClass {
  final String username;
  final String hours;
  final String text;
  final String imgURL;

  MessageDataClass(this.username, this.hours, this.text,
      {required this.imgURL});
}

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

class IconWithText extends StatelessWidget {
  final IconData? iconData;
  final String text;
  final Color iconColor;

  const IconWithText(
      {Key? key, this.iconData, required this.text, required this.iconColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          iconData,
          color: iconColor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(text),
        ),
      ],
    );
  }
}
