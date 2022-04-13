import 'dart:math';

import 'package:flutter/material.dart';
import 'package:insync/widgets/button.dart';
import 'package:insync/widgets/input_field.dart';

class DiscoverCommunity extends StatelessWidget {
  const DiscoverCommunity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Discover Communities",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: InputField(
              label: "Search for a community",
              search: true,
              placeholder: "Search for a community",
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: const [
                  CommunityCategory(
                    emoji: "🚀",
                    color: Colors.blue,
                    title: "Startups",
                  ),
                  CommunityCategory(
                    emoji: "👟",
                    color: Colors.grey,
                    title: "Sports",
                  ),
                  CommunityCategory(
                    emoji: "🤑",
                    color: Colors.green,
                    title: "Finance",
                  ),
                  CommunityCategory(
                    emoji: "🙏",
                    color: Colors.orange,
                    title: "Poliitics",
                  ),
                  CommunityCategory(
                    emoji: "💻",
                    color: Colors.grey,
                    title: "Technology",
                  ),
                  CommunityCategory(
                    emoji: "🇺🇦",
                    color: Colors.blue,
                    title: "Ukraine",
                  ),
                  CommunityCategory(
                    emoji: "🦠",
                    color: Colors.green,
                    title: "Covid-19",
                  ),
                ],
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

class CategoryHeadline extends StatelessWidget {
  const CategoryHeadline({
    Key? key,
    required this.category,
  }) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 16.0,
      ),
      child: Text(
        category,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            CommunityCard(
              imgURL:
                  "https://images.unsplash.com/photo-1649300607617-275d81af722e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1368&q=80",
              communityName: "Hayat's Community",
              members: Random().nextInt(100),
            ),
            CommunityCard(
              imgURL:
                  "https://images.unsplash.com/photo-1649193591174-06c254d30a5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80",
              communityName: "Hayat's Community",
              members: Random().nextInt(100),
            ),
            CommunityCard(
              imgURL:
                  "https://images.unsplash.com/photo-1628759618188-55dde15323a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
              communityName: "Hayat's Community",
              members: Random().nextInt(100),
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityCard extends StatelessWidget {
  const CommunityCard({
    Key? key,
    required this.communityName,
    required this.imgURL,
    this.members = 0,
  }) : super(key: key);
  final String imgURL;
  final String communityName;
  final int members;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Image(
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const SizedBox(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                  image: NetworkImage(imgURL),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                communityName,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Text(members.toString() + " members"),
              const SizedBox(height: 16),
              PrimaryButton(
                buttonTitle: "join community",
                onPressed: null,
                bgColor: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommunityCategory extends StatelessWidget {
  const CommunityCategory({
    Key? key,
    required this.color,
    required this.emoji,
    required this.title,
    this.onTap,
  }) : super(key: key);
  final String emoji;
  final String title;
  final Color color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withOpacity(0.2),
              child: Text(
                emoji,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
