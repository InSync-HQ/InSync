import 'package:flutter/material.dart';

class DividingOr extends StatelessWidget {
  const DividingOr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 1.0,
            width: 120.0,
            color: const Color(0xFFB0BEC5),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "or",
              style: TextStyle(color: Color(0xFFB0BEC5)),
            ),
          ),
          Container(
            height: 1.0,
            width: 120.0,
            color: const Color(0xFFB0BEC5),
          ),
        ],
      ),
    );
  }
}
