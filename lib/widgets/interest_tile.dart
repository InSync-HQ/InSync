import 'package:flutter/material.dart';

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
              : Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: widget.color.withOpacity(0.3),
              child: Text(
                widget.emoji,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: selected ? Colors.white : null,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
