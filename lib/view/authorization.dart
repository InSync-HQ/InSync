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
      body: Builder(builder: (context) {
        return Container(
          color: const Color(0xffffffff),
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Image(image: AssetImage('assets/readwell.png')),
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
                      // showModalBottomSheet<void>(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return const CreateAccountOverlay();
                      //   },
                      //   shape: const RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(24),
                      //         topRight: Radius.circular(24)),
                      //   ),
                      // );
                    },
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
                      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          (_) {
                        return RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color(0xff1A1A1A), width: 1),
                          borderRadius: BorderRadius.circular(12),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

class CreateAccountOverlay extends StatelessWidget {
  const CreateAccountOverlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
          const InputField(
            label: "Full Name",
            placeholder: "Jhon Doe",
            keyboard: TextInputType.name,
          ),
          const InputField(
            label: "E-mail",
            placeholder: "someone@example.com",
            keyboard: TextInputType.emailAddress,
          ),
          const InputField(
            label: "Password",
            placeholder: "•••••••••••••",
            password: true,
          ),
          PrimaryButton(
            buttonTitle: "Continue",
            onPressed: () {},
          ),
          PrimaryButton(
            buttonTitle: "Continue",
            onPressed: () {},
          ),
          PrimaryButton(
            buttonTitle: "Continue",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.label,
    this.placeholder,
    this.password = false,
    this.keyboard,
  }) : super(key: key);
  final String label;
  final String? placeholder;
  final bool password;
  final TextInputType? keyboard;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xff1A1A1A),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            obscureText: password,
            keyboardType: keyboard,
            decoration: InputDecoration(
              hintText: placeholder,
            ),
          ),
        ],
      ),
    );
  }
}
