import 'package:flutter/material.dart';
import 'package:insync/widgets/button.dart';
import 'package:insync/widgets/input_field.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  const Image(
                    image: AssetImage("assets/avatar.png"),
                    height: 72,
                    width: 72,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      PrimaryButton(
                        buttonTitle: "Change Photo",
                        onPressed: () async {
                          PickedFile? pickedFile = await ImagePicker()
                              .getImage(source: ImageSource.gallery);
                        },
                      ),
                      PrimaryButton(
                        buttonTitle: "Remove Photo",
                        onPressed: null,
                        textColor: Theme.of(context).primaryColor,
                        bgColor: Colors.transparent,
                      ),
                    ],
                  ),
                ],
              ),
              const InputField(
                label: "Your Name",
              ),
              PrimaryButton(
                buttonTitle: "Save",
                onPressed: () {
                  Navigator.of(context).pushNamed("/mainapp");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
