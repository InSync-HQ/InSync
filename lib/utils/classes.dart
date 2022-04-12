import 'package:flutter/material.dart';

class InterestTag {
  final String interest;
  final Color color;

  InterestTag({
    required this.interest,
    required this.color,
  });
}

class News {
  final String headline;
  final String desc;
  final String imgURL;
  final int likes;
  final List<InterestTag> interestTags;

  News({
    this.headline = "",
    this.desc = "",
    this.imgURL = "",
    this.likes = 0,
    this.interestTags = const [],
  });
}
