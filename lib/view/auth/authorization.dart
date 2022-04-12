import 'package:flutter/material.dart';
import 'package:insync/view/auth/create_account_overlay.dart';
import 'package:insync/view/auth/login_overlay.dart';
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
      body: Builder(builder: (context) {
        return Container(
          // color: const Color(0xffffffff),
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Image(image: AssetImage('assets/readwell.png')),
                  ),
                  Text(
                    "Read Well",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Stay relevant with all the news you like",
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xff5C657D),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PrimaryButton(
                    buttonTitle: "create an account",
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return const CreateAccountOverlay();
                        },
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24)),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    buttonTitle: "already a member?",
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return const LoginOverlay();
                        },
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24)),
                        ),
                      );
                    },
                    bgColor: Colors.white,
                    textColor: Colors.black,
                    border:
                        const BorderSide(color: Color(0xff1A1A1A), width: 2),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
