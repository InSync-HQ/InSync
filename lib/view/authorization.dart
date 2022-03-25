import 'package:flutter/material.dart';
import 'package:insync/widgets/button.dart';

class Authorization extends StatefulWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  _AuthorizationState createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color(0xffffffff),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Image(image: AssetImage('assets/readwell.png')),
                    const Text(
                      "Read Well",
                      style:
                          TextStyle(fontSize: 42, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "Stay relevant with all the news you like",
                      style: TextStyle(fontSize: 28, color: Color(0xff5C657D)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const PrimaryButton(
                      buttonTitle: "create an account",
                      onPressed: null,
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: null,
                      child: const Text(
                        "already a member?",
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff1A1A1A)),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                            const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 8)),
                        shape:
                            MaterialStateProperty.resolveWith<OutlinedBorder>(
                                (_) {
                          return RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Color(0xff1A1A1A), width: 1),
                              borderRadius: BorderRadius.circular(12));
                        }),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black26,
            child: Column(children: [Row()]),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Create an account",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Full name"),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Jhon Doe',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
