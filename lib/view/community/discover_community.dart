import 'dart:math';
import 'package:flutter/material.dart';
import 'package:insync/utils/classes.dart';
import 'package:insync/view/community/community_overview.dart';
import 'package:insync/widgets/community_card.dart';
import 'package:insync/widgets/community_category.dart';
import 'package:insync/widgets/community_headline.dart';
import 'package:insync/widgets/input_field.dart';

class DiscoverCommunity extends StatelessWidget {
  const DiscoverCommunity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CommunityCategoryClass> categoriestabs = <CommunityCategoryClass>[
      CommunityCategoryClass(
        emoji: "🚀",
        color: Colors.blue,
        title: "Startups",
      ),
      CommunityCategoryClass(
        emoji: "👟",
        color: Colors.grey,
        title: "Sports",
      ),
      CommunityCategoryClass(
        emoji: "🤑",
        color: Colors.green,
        title: "Finance",
      ),
      CommunityCategoryClass(
        emoji: "🙏",
        color: Colors.orange,
        title: "Politics",
      ),
      CommunityCategoryClass(
        emoji: "💻",
        color: Colors.grey,
        title: "Tech",
      ),
      CommunityCategoryClass(
        emoji: "🇺🇦",
        color: Colors.blue,
        title: "Ukraine",
      ),
      CommunityCategoryClass(
        emoji: "🦠",
        color: Colors.green,
        title: "Covid-19",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Discover Communities",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: InputField(
              label: "Search for a community",
              search: true,
              placeholder: "Search for a community",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return CommunityCategory(
                    color: categoriestabs[index].color,
                    emoji: categoriestabs[index].emoji,
                    title: categoriestabs[index].title,
                  );
                },
              ),
            ),
          ),
          const CategoryHeadline(
            category: "International",
          ),
          const CommunitySingleCategoryRow(),
          const CategoryHeadline(
            category: "Startups",
          ),
          const CommunitySingleCategoryRow(),
          const CategoryHeadline(
            category: "Finance",
          ),
          const CommunitySingleCategoryRow(),
        ],
      ),
    );
  }
}

class CommunitySingleCategoryRow extends StatelessWidget {
  const CommunitySingleCategoryRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SizedBox(
        height: 380,
        child: ListView.builder(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) => CommunityCard(
            imgURL:
                "https://picsum.photos/seed/${Random().nextInt(100)}/300/300",
            communityName: "Hayat's Community",
            members: Random().nextInt(100),
            cardOnTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CommunityOverview(
                    communityName: "Hayat",
                    imgURL:
                        "https://picsum.photos/seed/${Random().nextInt(100)}/300/300",
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
