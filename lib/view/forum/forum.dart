import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  /// Top Icons
  var topCategoyIcons = Container(
    alignment: Alignment.center,
    decoration: const BoxDecoration(
        gradient: LinearGradient(
      colors: [Colors.black],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(0.0, 1.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp,
    )),
    child: Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 0.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.green,
        // border:  Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          CategoryIcon(Icons.landscape, "Nature", true),
          CategoryIcon(Icons.headset, "Music", false),
          CategoryIcon(Icons.movie, "Movies", false),
          CategoryIcon(Icons.place, "Places", false),
        ],
      ),
    ),
  );

  var categoryMetric = Container(
    padding: const EdgeInsets.all(5.0),
    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.black],
        begin: FractionalOffset(0.0, 0.5),
        end: FractionalOffset(0.0, 1.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
      // border:  Border.all(color: Colors.black, width: 1.0),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        CategoryIcon(Icons.cake, "Food", false),
        CategoryIcon(Icons.book, "Book", false),
        CategoryIcon(Icons.games, "Games", false),
        CategoryIcon(Icons.history, "History", false),
      ],
    ),
  );

  static final listItemsData = [
    ListEntry("Forum 1", "test", "description 1", 54, 2, true),
    ListEntry("Forum 2", "test", "description 2", 154, 3, false),
    ListEntry("Forum 3", "test", "description 3", 971, 0, false),
    ListEntry("Forum 4", "test", "description 4", 124, 2, true),
    ListEntry("Forum 5", "test", "description 5", 412, 5, true),
    ListEntry("Forum 6", "test", "description 6", 12, 1, true),
  ];
  var listView = ListView.builder(
    itemBuilder: (BuildContext context, int index) =>
        EntryItem(listItemsData[index]),
    itemCount: listItemsData.length,
    shrinkWrap: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0.0,
        title: Text(
          widget.title ?? "",
          textScaleFactor: 1.3,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _onSearchPressed,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[topCategoyIcons, categoryMetric, listView],
      ),
    );
  }

  void _onSearchPressed() {
    Navigator.pop(context);
  }
}

class ListEntry {
  final String title;
  final String icon;
  final String description;
  final int views;
  final int responses;
  final bool answered;

  ListEntry(this.title, this.icon, this.description, this.views, this.responses,
      this.answered);
}

class CategoryIcon extends StatelessWidget {
  const CategoryIcon(this.icon, this.iconText, this.selected, {Key? key})
      : super(key: key);

  final String iconText;
  final IconData icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          onPressed: _onSearchPressed,
          color: selected == true ? Colors.green : Colors.black,
        ),
        Text(iconText)
      ],
    );
  }

  static void _onSearchPressed() {}
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, {Key? key}) : super(key: key);

  final ListEntry entry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      decoration: const BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: ListTile(
        title: const Text("Hayat"),
        subtitle: const Text("Hey bro whats up"),
        onTap: () {
          Navigator.pushNamed(context, '/forum/1');
        },
      ),
    );
  }
}
