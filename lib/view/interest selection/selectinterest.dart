import 'package:flutter/material.dart';
import 'package:insync/widgets/button.dart';

class Addinterests extends StatefulWidget {
  const Addinterests({Key? key}) : super(key: key);

  @override
  State<Addinterests> createState() => _AddinterestsState();
}

class _AddinterestsState extends State<Addinterests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select interests",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const Text(
                    "Please select 3 or more topics to personalize your feed"),
                Expanded(
                  child: ListView.builder(
                    itemCount: 17,
                    itemBuilder: (context, index) {
                      return InterestTile(title: "siddhu", emoji: "🤦‍♀️");
                    },
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 64,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: PrimaryButton(
                      buttonTitle: "Continue",
                      onPressed: () {
                        Navigator.of(context).pushNamed("/mainapp");
                      }),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ],
      ),
    );
  }
}

class InterestTile extends StatefulWidget {
  const InterestTile({
    Key? key,
    required this.title,
    required this.emoji,
    this.color = Colors.red,
  }) : super(key: key);
  final String title;
  final String emoji;
  final Color color;

  @override
  State<InterestTile> createState() => _InterestTileState();
}

class _InterestTileState extends State<InterestTile> {
  bool selected = false;
  @override
  void initState() {
    setState(() {
      selected = false;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).colorScheme.primary
              : Colors.grey[300],
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: widget.color.withOpacity(0.2),
              child: Text(widget.emoji),
            ),
            SizedBox(
              width: 24,
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
