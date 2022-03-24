import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key, required this.buttonTitle, required this.onPressed})
      : super(key: key);
  final String buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonTitle,
        style: const TextStyle(fontSize: 18),
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xffFD4C62)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
            const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8)),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12));
        }),
        elevation: MaterialStateProperty.all<double>(0),
      ),
    );
  }
}
