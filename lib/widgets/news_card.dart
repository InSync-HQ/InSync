import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:insync/utils/classes.dart';
import 'package:insync/view/home/article_page.dart';
import 'package:insync/widgets/auto_generate_interest_tags.dart';
import 'package:insync/widgets/button.dart';
import 'package:insync/widgets/news_tag.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.headline,
    required this.news,
    required this.imgURL,
    required this.likes,
    this.interestTags = const [],
  }) : super(key: key);
  final String headline;
  final String news;
  final String imgURL;
  final int likes;
  final List<InterestTag> interestTags;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // tags
                AutoGenerateInterestTags(interestTags: interestTags),
                // Headline
                Text(
                  headline,
                  style: const TextStyle(
                    fontSize: 26,
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
                              return ArticlePage(
                                headline: headline,
                                imgURL: imgURL,
                                news: news,
                                interestTags: interestTags,
                              );
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
