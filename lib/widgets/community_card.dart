import 'package:flutter/material.dart';
import 'package:insync/widgets/button.dart';

class CommunityCard extends StatelessWidget {
  const CommunityCard({
    Key? key,
    required this.communityName,
    required this.imgURL,
    this.members = 0,
    this.cardOnTap,
    this.buttonOnTap,
  }) : super(key: key);
  final String imgURL;
  final String communityName;
  final int members;
  final Function()? cardOnTap;
  final Function()? buttonOnTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: GestureDetector(
        onTap: cardOnTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Image(
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const SizedBox(
                        height: 200,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                    image: NetworkImage(imgURL),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  communityName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Text(members.toString() + " members"),
                const SizedBox(height: 16),
                PrimaryButton(
                  buttonTitle: "join community",
                  onPressed: buttonOnTap,
                  bgColor: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
