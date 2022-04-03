import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xffFD4C62)),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Image(image: AssetImage('assets/insynclogo.png')),
            const SizedBox(height: 300),
            const Text(
              "Read Relevant, Stay Relevant",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
