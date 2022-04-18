import 'package:flutter/material.dart';
import 'package:insync/widgets/button.dart';
import 'package:insync/widgets/interest_tile.dart';

class ChangeInterests extends StatefulWidget {
  const ChangeInterests({Key? key}) : super(key: key);

  @override
  State<ChangeInterests> createState() => _ChangeInterestsState();
}

class _ChangeInterestsState extends State<ChangeInterests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change interests",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
                    buttonTitle: "Update",
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
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
