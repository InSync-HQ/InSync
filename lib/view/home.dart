import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:insync/utils/theme_config.dart';
import 'package:insync/view/article_page.dart';
import 'package:insync/widgets/button.dart';
import 'package:insync/widgets/news_tag.dart';
import 'package:tcard/tcard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
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
              cards: cardFunc(context),
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

List<Widget> cardFunc(BuildContext context) {
  return List.generate(
    10,
    (index) => Card(
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
              image: const NetworkImage(
                  "https://terrigen-cdn-dev.marvel.com/content/prod/1x/webby_card_0.jpg"),
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
                const Text(
                  'Swiggy eyes 800 million IPO early next year',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                ),
                //news summary
                const Text(
                  'Providing support and resources for the planning and implementation of high-level sports in Seychelles is one of the priorities in the national strategic plan for 2021-2025, said a top official on Thursday. Five priority areas for development were identified at the presentation of the national sports strategic plan to all local partners in a forum organised by the sports department. The chief executive of the National Sports Council (NSC), Jean Larue, said that the priorities laid out in the plan include providing support and resources for the planning and implementation of high-level performance.',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 3,
                ),
                //actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryButton(
                      buttonTitle: "2.6k likes",
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
    ),
  );
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
