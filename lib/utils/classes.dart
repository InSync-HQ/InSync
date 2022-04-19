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
  final String articleID;
  final String desc;
  final String imgURL;
  final int likes;
  final List<InterestTag> interestTags;

  News({
    this.headline = "",
    this.articleID = "",
    this.desc = "",
    this.imgURL = "",
    this.likes = 0,
    this.interestTags = const [],
  });
}

class CommunityCategoryClass {
  final String emoji;
  final String title;
  final Color color;

  CommunityCategoryClass({
    required this.emoji,
    required this.color,
    required this.title,
  });
}

class MessageDataClass {
  final String username;
  final String hours;
  final String text;
  final String imgURL;

  MessageDataClass(this.username, this.hours, this.text,
      {required this.imgURL});
}

class Article {
  final String id;
  final String? articleUrl;
  final String imgUrl;
  final String title;
  final String? desc;
  final String content;
  final String? publishedAt;
  final int upvotes;
  final int? downvotes;
  final String? createdAt;
  final String? updatedAt;
  Article({
    required this.id,
    this.articleUrl,
    required this.imgUrl,
    required this.title,
    this.desc,
    required this.content,
    this.createdAt,
    this.downvotes = 0,
    this.upvotes = 0,
    this.publishedAt,
    this.updatedAt,
  });
}
