import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:insync/utils/theme_config.dart';
import 'package:insync/view/article_page.dart';
import 'package:insync/widgets/button.dart';
import 'package:insync/widgets/news_tag.dart';
import 'package:tcard/tcard.dart';

class News {
  final String headline;
  final String desc;
  final String imgURL;
  final int likes;

  News({
    this.headline = "",
    this.desc = "",
    this.imgURL = "",
    this.likes = 0,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<News> newsarr = <News>[
    News(
      headline: "Twitter edit button is finally coming, testing to begin soon",
      desc:
          "Twitter has confirmed that it has been working on an edit button, a feature that users have been requesting for a long time to fix not just typos but also the wrong context in their tweets. Currently, users resort to deleting tweets with errors and retype them with corrections, but an edit button would do away with the hassle. But, at the same time, Twitter is concerned that the edit button could be misused to 'alter the record of the public conversation.' The announcement comes nearly a day after Tesla CEO Elon Musk, who recently acquired a 9.",
      imgURL:
          "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202204/twitteredit_06042022-647x363.jpeg?MSKpa0qyD1Goy2cYj1jSTO8xCUeRSTZi",
    ),
    News(
      headline:
          "The extensive history of Marvel superheroes fighting each other",
      desc:
          "This summer, Marvel Comics is taking three of its top teams - the Avengers, the X-Men, and the Eternals - and mashing them all up into a threeway conflict for the event AXE: Judgment Day ('AXE' for the initials of the three aforementioned teams, of course). The motivations for the conflict come down to some contentious beliefs growing among the Eternals about the origin of mutants, with the Eternals now believing that mutantkind are offshoots of the Deviants, the ancient enemies of the Eternals.Whether that winds up being true or not (and whether the truth will even matter to the conflict), one thing that's undeniable is that AXE: Judgment Day's hero vs.",
      imgURL:
          "https://cdn.mos.cms.futurecdn.net/NbkvkgfMP6du7nre4qUH6K-1200-80.jpg",
    ),
    News(
      headline:
          "'How Do I Evade Taxes Legally': Someone Asked This Question & Twitter Had All The Answers",
      desc:
          "If you know anything about the internet, they will take anything to heart. This turned true for 19-year-old YouTube creator Ishan Sharma who asked his 42.8k Twitter followers if they had any tips on legally evading taxes. And rest assured, they pulled through. Guys, I really want to evade taxes legally.Any tips?— Ishan Sharma (@Ishansharma7390) April 4, 2022 Step 1: Call it planning, NOT evading. Check out some mind-blowing tips that I know I'll certainly keep in mind while filing my taxes:1)PPF or ELSS fund2) registering a company gives you many benefits like gst rebates and showing all your expenditure as company expenditure and show that even u get a salary but it should be very minimal3)get insurance for urself ⬇️⬇️— desi tolkien (@garvgoyal123) April 4, 2022 4)instead of directly spending money buy stocks and take a loan against it and spend that loan money you would save tax + keep stocks for 2years+ so u would have to pay only 10% tax5) get a home loan and gets lots of benefits and get direct tax exemption of 2L annually⬇️⬇️— desi tolkien (@garvgoyal123) April 4, 2022 If you live with your parents, make a rent agreement with them and try to utilise maximum HRA you can.",
      imgURL:
          "https://s4.scoopwhoop.com/anj2/624bd59017eb290001fef72f/0c7a6830-943a-4955-a968-b209d6f62641.jpg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Newsfeed",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 16),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return customChip(index);
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: TCard(
              cards: cardFunc(context, newsarr),
              size: const Size(380, 550),
              onForward: (index, si) {
                if (si.direction == SwipDirection.Right) {
                  //Swipe functionality
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const ArticlePage();
                      },
                    ),
                  );
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: const Color(0xffecf0f4),
                child: IconButton(
                    onPressed: () {
                      // Custom Function
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      color: Colors.grey,
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const ArticlePage();
                      },
                    ),
                  );
                },
                child: const Chip(
                  labelPadding: EdgeInsets.all(8),
                  label: Text('Read more'),
                  backgroundColor: Color(0xffecf0f4),
                  labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w800),
                ),
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: const Color(0xffecf0f4),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const ArticlePage();
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget customChip(int index) {
    return GestureDetector(
      onTap: () => setState(() {
        currentIndex = index;
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Chip(
          backgroundColor: (currentIndex == index)
              ? Colors.black
              : lighttheme.scaffoldBackgroundColor,
          label: const Text('Your feed'),
          labelStyle: TextStyle(
            color: (currentIndex == index) ? Colors.white : Colors.black,
          ),
          side: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
    );
  }
}

List<Widget> cardFunc(BuildContext context, List<News> array) {
  return List.generate(
    array.length,
    (index) => NewsCard(
      headline: array[index].headline,
      news: array[index].desc,
      imgURL: array[index].imgURL,
      likes: Random().nextInt(100),
    ),
  );
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.headline,
    required this.news,
    required this.imgURL,
    required this.likes,
  }) : super(key: key);
  final String headline;
  final String news;
  final String imgURL;
  final int likes;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          SizedBox(
            height: 220,
            child: Image(
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 72.0),
                  child: LinearProgressIndicator(),
                );
              },
              fit: BoxFit.cover,
              image: NetworkImage(imgURL),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // tags
                Row(
                  children: const [
                    NewsTag(
                      title: "Finance",
                      color: Color(0xFF2CA411),
                    ),
                    NewsTag(
                      title: "Foodtech",
                      color: Color(0xffDB8C09),
                    ),
                  ],
                ),
                // Headline
                Text(
                  headline,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                //news summary
                Text(
                  news,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 3,
                ),
                //actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryButton(
                      buttonTitle: likes.toString() + " likes",
                      onPressed: null,
                      iconLeft: const Icon(
                        FeatherIcons.thumbsUp,
                        size: 20,
                      ),
                      vertPad: 0,
                      horzPad: 0,
                      bgColor: Colors.transparent,
                      textColor: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                    PrimaryButton(
                      buttonTitle: "Read More",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const ArticlePage();
                            },
                          ),
                        );
                      },
                      iconRight: const Icon(
                        FeatherIcons.arrowRight,
                        size: 20,
                      ),
                      vertPad: 0,
                      horzPad: 0,
                      bgColor: Colors.transparent,
                      textColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TranslucentCover extends StatelessWidget {
  const TranslucentCover({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 364,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x000f0f0f),
              Color(0x0c0f0f0f),
              Color(0x63101010),
              Color(0xff101010)
            ],
          ),
        ),
      ),
    );
  }
}
