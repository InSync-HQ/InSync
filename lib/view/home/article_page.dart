import 'package:flutter/material.dart';
import 'package:insync/utils/classes.dart';
import 'package:insync/widgets/auto_generate_interest_tags.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({
    Key? key,
    required this.headline,
    required this.imgURL,
    required this.news,
    this.interestTags = const [],
  }) : super(key: key);
  final String headline;
  final String imgURL;
  final String news;
  final List<InterestTag> interestTags;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            ArticleSliverAppBar(
              headline: headline,
              imgURL: imgURL,
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoGenerateInterestTags(interestTags: interestTags),
                    const SizedBox(height: 8),
                    Text(
                      headline,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      news,
                      style: const TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Divider(
                thickness: 4,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Row(
                  children: [
                    SizedBox(
                      child: Image.asset('fire.png'),
                      height: 20,
                      width: 20,
                    ),
                    const Text(
                      ' Discussions',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'John Walker',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(width: 15),
                        Text(
                          '20 mins ago',
                          style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 13,
                              color: Colors.black38),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage",
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.thumb_up_outlined,
                          size: 18,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '262',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 25),
                        Icon(Icons.thumb_down_outlined, size: 18),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '12',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleSliverAppBar extends StatelessWidget {
  const ArticleSliverAppBar({
    Key? key,
    required this.headline,
    required this.imgURL,
  }) : super(key: key);
  final String headline;
  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250.0,
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      elevation: 0,
      floating: false,
      pinned: true,
      title: Text(
        headline,
        style: const TextStyle(fontSize: 12),
      ),
      flexibleSpace: FlexibleSpaceBar(
        // title: ,
        background: Image.network(
          imgURL,
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
