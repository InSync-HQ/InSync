import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:insync/utils/constants.dart';
import 'package:insync/view/auth/login_overlay.dart';
import 'package:insync/widgets/button.dart';
import 'package:insync/widgets/dividing_or.dart';
import 'package:insync/widgets/input_field.dart';

class CreateAccountOverlay extends StatefulWidget {
  const CreateAccountOverlay({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateAccountOverlay> createState() => _CreateAccountOverlayState();
}

class _CreateAccountOverlayState extends State<CreateAccountOverlay> {
  final fullnamectr = TextEditingController();
  final emailctr = TextEditingController();
  final passwordctr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.65,
        builder: (_, controller) => Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(context).bottomAppBarTheme.color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: ListView(
            controller: controller,
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
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
              InputField(
                label: "Full Name",
                placeholder: "Jhon Doe",
                keyboard: TextInputType.name,
                controller: fullnamectr,
              ),
              InputField(
                label: "E-mail",
                placeholder: "someone@example.com",
                keyboard: TextInputType.emailAddress,
                controller: emailctr,
              ),
              InputField(
                label: "Password",
                placeholder: "•••••••••••••",
                password: true,
                controller: passwordctr,
              ),
              const SizedBox(height: 8),
              PrimaryButton(
                buttonTitle: "Continue",
                onPressed: () async {
                  var response = await Dio().post(
                    'https://insync-backend-2022.herokuapp.com/user/register',
                    data: {
                      'email': emailctr.text,
                      'name': fullnamectr.text,
                      'pwd': passwordctr.text,
                      'provider': "local",
                    },
                  );
                  // var data = json.decode(response.data);
                  // print(data.toString());
                  // Constants.updateUserToken(response.data.tokens.token);
                  Constants.loginPref();
                  Constants.retrieveAuthPref();
                  Navigator.of(context).pushNamed("/interests");
                },
              ),
              const SizedBox(height: 8),
              const DividingOr(),
              const SizedBox(height: 8),
              PrimaryButton(
                buttonTitle: "Continue with google",
                onPressed: () {},
                imageLeft: const Image(
                  image: AssetImage('assets/google.png'),
                  width: 26,
                  height: 28,
                ),
                bgColor: const Color(0xff1A1A1A),
              ),
              const SizedBox(height: 8),
              PrimaryButton(
                buttonTitle: "Continue with facebook",
                onPressed: () {},
                bgColor: Colors.white,
                imageLeft:
                    const Image(image: AssetImage('assets/facebook.png')),
                textColor: Colors.black,
                border: const BorderSide(color: Color(0xff1A1A1A), width: 2),
              ),
              const SizedBox(height: 8),
              PrimaryButton(
                buttonTitle: "Already have an account? log in",
                onPressed: () {
                  Navigator.pop(context);
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
                textColor: const Color(0xffBD3A4A),
              ),
              const SizedBox(height: 4),
              const Text(
                "by signing up, you agree to our privacy policy and T&C",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
