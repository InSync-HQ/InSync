import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:insync/widgets/button.dart';
import 'package:insync/widgets/input_field.dart';

class CreateCommunityOverlay extends StatefulWidget {
  const CreateCommunityOverlay({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateCommunityOverlay> createState() => _CreateCommunityOverlayState();
}

class _CreateCommunityOverlayState extends State<CreateCommunityOverlay> {
  bool isSwitched = false;
  String visibilityVal = 'Private';
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        visibilityVal = 'Public';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        visibilityVal = 'Private';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: DraggableScrollableSheet(
        initialChildSize: 0.78,
        minChildSize: 0.4,
        builder: (_, controller) => Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: ListView(
            controller: controller,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Create a community",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                buttonTitle: "Upload community image",
                iconLeft: const Icon(FeatherIcons.uploadCloud),
                onPressed: () {},
                textColor: const Color(0xff2561ED),
                bgColor: Colors.white,
                border: const BorderSide(color: Color(0xff2561ED), width: 2),
              ),
              const SizedBox(height: 8),
              const InputField(
                label: "Community name",
                placeholder: "Your community's name",
                keyboard: TextInputType.name,
              ),
              const InputField(
                label: "Intrest topics",
                keyboard: TextInputType.name,
              ),
              const InputField(
                label: "Description",
                placeholder: "About your community",
                textArea: true,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Visibility",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        visibilityVal,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  CupertinoSwitch(
                    value: isSwitched,
                    onChanged: toggleSwitch,
                    activeColor: Colors.black,
                  )
                ],
              ),
              const SizedBox(height: 8),
              PrimaryButton(
                buttonTitle: "Continue",
                onPressed: () {},
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
