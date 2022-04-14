import 'package:flutter/material.dart';

class CommunityCategory extends StatelessWidget {
  const CommunityCategory({
    Key? key,
    required this.color,
    required this.emoji,
    required this.title,
    this.onTap,
  }) : super(key: key);
  final String emoji;
  final String title;
  final Color color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withOpacity(0.2),
              child: Text(
                emoji,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
