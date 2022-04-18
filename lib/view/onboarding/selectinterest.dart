import 'package:flutter/material.dart';
import 'package:insync/widgets/button.dart';
import 'package:insync/widgets/interest_tile.dart';

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
                      return const InterestTile(
                          title: "siddhu", emoji: "🤦‍♀️");
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
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: PrimaryButton(
                      buttonTitle: "Continue",
                      onPressed: () {
                        Navigator.of(context).pushNamed("/mainapp");
                      }),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ],
      ),
    );
  }
}
