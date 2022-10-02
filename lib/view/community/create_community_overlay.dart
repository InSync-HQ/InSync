import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:insync/widgets/button.dart';
import 'package:insync/widgets/input_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intrest {
  final int? id;
  final String name;

  Intrest({
    this.id,
    this.name = "Hayat",
  });
}

class CreateCommunityOverlay extends StatefulWidget {
  const CreateCommunityOverlay({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateCommunityOverlay> createState() => _CreateCommunityOverlayState();
}

class _CreateCommunityOverlayState extends State<CreateCommunityOverlay> {
  // ignore: prefer_final_fields
  static List<Intrest> _intrests = [
    Intrest(id: 1, name: "👆 Politics"),
    Intrest(id: 2, name: "🚀 Startups"),
    Intrest(id: 3, name: "💰 Crypto"),
    Intrest(id: 4, name: "💳 Fin-tech"),
    Intrest(id: 5, name: "🎽 Sports"),
    Intrest(id: 6, name: "🔫 Crime"),
    Intrest(id: 7, name: "🥗 Food"),
  ];
  final _items = _intrests
      .map((intrest) => MultiSelectItem<Intrest>(intrest, intrest.name))
      .toList();
  List<Intrest> _selectedIntrests = [];
  final communitynamectr = TextEditingController();
  final descctr = TextEditingController();
  String visibilityVal = 'Private';

  @override
  void initState() {
    _selectedIntrests = _intrests;
    super.initState();
  }

  bool isSwitched = false;
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        visibilityVal = 'Public';
      });
    } else {
      setState(() {
        isSwitched = false;
        visibilityVal = 'Private';
      });
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
          decoration: BoxDecoration(
            color: Theme.of(context).bottomAppBarTheme.color,
            borderRadius: const BorderRadius.only(
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
                onPressed: () async {
                  PickedFile? pickedFile =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                },
                textColor: const Color(0xff2561ED),
                bgColor: Theme.of(context).scaffoldBackgroundColor,
                border: const BorderSide(color: Color(0xff2561ED), width: 2),
              ),
              const SizedBox(height: 8),
              InputField(
                label: "Community name",
                placeholder: "Your community's name",
                keyboard: TextInputType.name,
                controller: communitynamectr,
              ),
              Text(
                "Intrest topics",
                style: TextStyle(
                  color:
                      Theme.of(context).inputDecorationTheme.labelStyle?.color,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              MultiSelectDialogField(
                items: _items,
                searchable: true,
                separateSelectedItems: true,
                buttonIcon: Icon(
                  FeatherIcons.chevronDown,
                  color: Colors.grey.shade600,
                ),
                searchIcon: const Icon(FeatherIcons.search),
                confirmText: Text(
                  "Select",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                cancelText: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                barrierColor: Colors.black.withOpacity(0.3),
                selectedItemsTextStyle:
                    const TextStyle(fontWeight: FontWeight.bold),
                title: const Text("Intrests"),
                selectedColor: Theme.of(context).primaryColor,
                decoration: BoxDecoration(
                  color: Theme.of(context).inputDecorationTheme.fillColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                ),
                buttonText: Text(
                  "select some intrests",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 16,
                  ),
                ),
                onConfirm: (List<Intrest> results) {
                  _selectedIntrests = results;
                },
                chipDisplay: MultiSelectChipDisplay(
                  chipColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  items: _selectedIntrests
                      .map((e) => MultiSelectItem(e, e.toString()))
                      .toList(),
                  onTap: (value) {
                    setState(() {
                      _selectedIntrests.remove(value);
                    });
                  },
                ),
              ),
              InputField(
                label: "Description",
                placeholder: "About your community",
                textArea: true,
                controller: descctr,
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
                    activeColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
              const SizedBox(height: 8),
              PrimaryButton(
                buttonTitle: "Continue",
                onPressed: () async {
                  try {
                    late SharedPreferences prefs;
                    prefs = await SharedPreferences.getInstance();
                    Response response = await Dio().post(
                      "https://insync-backend-2022.herokuapp.com/community/new",
                      data: {
                        "name": communitynamectr.text,
                        "desc": descctr.text,
                        "mod_id": "625d0bcdf56922d8c32a1dbb",
                        // "interests": _selectedIntrests,
                      },
                      options: Options(
                        headers: {"Authorization": prefs.getString("jwt")},
                      ),
                    );
                    Navigator.of(context).pop();
                  } catch (err) {
                    debugPrint(err.toString() + " 👉👉 you have some error while creating community");
                  }
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
