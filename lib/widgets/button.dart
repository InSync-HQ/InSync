import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.buttonTitle,
    required this.onPressed,
    this.imageLeft,
    this.iconLeft,
    this.bgColor = const Color(0xffFD4C62),
    this.textColor = Colors.white,
    this.border = BorderSide.none,
  }) : super(key: key);
  final String buttonTitle;
  final void Function()? onPressed;
  final Image? imageLeft;
  final Icon? iconLeft;
  final Color bgColor;
  final Color textColor;
  final BorderSide border;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding:
                imageLeft == null ? null : const EdgeInsets.only(right: 12),
            child: imageLeft,
          ),
          Container(
            padding:
                iconLeft == null ? null : const EdgeInsets.only(right: 12),
            child: iconLeft,
          ),
          Text(
            buttonTitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(textColor),
        backgroundColor: MaterialStateProperty.all<Color>(bgColor),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
            const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8)),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
              side: border, borderRadius: BorderRadius.circular(12));
        }),
        elevation: MaterialStateProperty.all<double>(0),
      ),
    );
  }
}
