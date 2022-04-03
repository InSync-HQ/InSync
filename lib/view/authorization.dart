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
                    onPressed: () {},
                    bgColor: Colors.white,
                    textColor: Colors.black,
                    border:
                        const BorderSide(color: Color(0xff1A1A1A), width: 1),
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

class CreateAccountOverlay extends StatelessWidget {
  const CreateAccountOverlay({
    Key? key,
  }) : super(key: key);

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
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
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
              const SizedBox(height: 8),
              PrimaryButton(
                buttonTitle: "Continue",
                onPressed: () {},
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                    thickness: 1,
                  ),
                  const Text("or"),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff00baff),
                    ),
                  ),
                ],
              ),
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
                border: const BorderSide(color: Color(0xff1A1A1A), width: 1),
              ),
              const SizedBox(height: 8),
              PrimaryButton(
                buttonTitle: "Already have an account? log in",
                onPressed: () {},
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
