import 'package:flutter/material.dart';
import 'package:insync/widgets/button.dart';
import 'package:insync/widgets/input_field.dart';

class CreateCommunityOverlay extends StatelessWidget {
  const CreateCommunityOverlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: DraggableScrollableSheet(
        initialChildSize: 0.6,
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
              const SizedBox(height: 32),
              const InputField(
                label: "Community name",
                placeholder: "Your community's name",
                keyboard: TextInputType.name,
              ),
              const InputField(
                label: "E-mail",
                placeholder: "someone@example.com",
                keyboard: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),
              PrimaryButton(
                buttonTitle: "Continue",
                onPressed: () {},
              ),
              const SizedBox(height: 8),
              
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
