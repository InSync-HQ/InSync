import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:insync/widgets/button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => OonboardingState();
}

class OonboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  final PageController pageController = PageController(
    initialPage: 0,
  );
  final List pagelist = [
    const Onboardingpage1(),
    const Onboardingpage2(),
    const Onboardingpage3(),
  ];
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => pagelist[index],
      controller: pageController,
    );
  }
}

class Onboardingpage1 extends StatelessWidget {
  const Onboardingpage1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        actions: [
          PrimaryButton(
              buttonTitle: "Skip",
              onPressed: () => Navigator.of(context).pushNamed("/interests")),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            child: const Padding(
              padding: EdgeInsets.only(top: 64.0),
              child: Image(
                image: AssetImage("assets/onboarding1.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Discover breaking news from our feed",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Get an overview of how you are performing and motivate yourself to achieve even moew.",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/onboarding/2"),
                    icon: const Icon(
                      FeatherIcons.arrowRight,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Onboardingpage2 extends StatelessWidget {
  const Onboardingpage2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 128, 231),
        automaticallyImplyLeading: false,
        actions: [
          PrimaryButton(
            buttonTitle: "Skip",
            onPressed: () => Navigator.of(context).pushNamed("/interests"),
            bgColor: const Color.fromARGB(255, 2, 128, 231),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color.fromARGB(255, 2, 128, 231),
            child: const Padding(
              padding: EdgeInsets.only(top: 64.0),
              child: Image(
                image: AssetImage("assets/onboarding2.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Discuss and Debate with other people",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Get an overview of how you are performing and motivate yourself to achieve even moew.",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: const Color.fromARGB(255, 2, 128, 231),
                  child: IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/onboarding/3"),
                    icon: const Icon(
                      FeatherIcons.arrowRight,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Onboardingpage3 extends StatelessWidget {
  const Onboardingpage3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 48, 232, 55),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color.fromARGB(255, 48, 232, 55),
            child: const Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Image(
                image: AssetImage("assets/onboarding3.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Join Communities to see news that matters",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Get an overview of how you are performing and motivate yourself to achieve even moew.",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: const Color.fromARGB(255, 48, 232, 55),
                  child: IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/interests"),
                    icon: const Icon(
                      FeatherIcons.arrowRight,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
