import 'package:flutter/material.dart';
import 'package:insync/utils/classes.dart';
import 'package:insync/widgets/news_tag.dart';

class AutoGenerateInterestTags extends StatelessWidget {
  const AutoGenerateInterestTags({
    Key? key,
    required this.interestTags,
  }) : super(key: key);

  final List<InterestTag> interestTags;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        itemCount: interestTags.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return NewsTag(
              title: interestTags[index].interest,
              color: interestTags[index].color);
        },
      ),
    );
  }
}
