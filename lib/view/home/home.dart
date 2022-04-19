// ignore_for_file: avoid_print

import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:insync/utils/classes.dart';
import 'package:insync/utils/theme_config.dart';
import 'package:insync/view/home/article_page.dart';
import 'package:insync/widgets/news_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcard/tcard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List communitiesarr = [];
  @override
  void initState() {
    super.initState();
    initializeNewsFeed();
    initalizeCommunities();
  }

  void initializeNewsFeed() async {
    try {
      Response response = await Dio().get(
          "https://insync-backend-2022.herokuapp.com/news/newsapi/search?q=ukraine");
      setState(() {
        newsarr = [];
        newsarr = List.generate(
          response.data["articles"].length,
          (index) => News(
            headline: response.data["articles"][index]["title"],
            desc: response.data["articles"][index]["content"],
            imgURL: response.data["articles"][index]["urlToImage"],
            // articleID: response.data["articles"][index]["_id"],
          ),
        );
      });
    } catch (err) {
      print(err.toString() +
          " 👉👉 you have some error in home page while generating newsfeed");
    }
  }

  void initalizeCommunities() async {
    try {
      late SharedPreferences prefs;
      prefs = await SharedPreferences.getInstance();
      print("👉 jwt =" + prefs.getString("jwt")!);
      Response response = await Dio().get(
          "https://insync-backend-2022.herokuapp.com/community/fetchAll",
          options: Options(headers: {"Authorization": prefs.getString("jwt")}));
      setState(() {
        communitiesarr = response.data["communties"];
      });
    } catch (err) {
      print(err.toString() +
          " 👉👉 you have some error in home page while generating communities");
    }
  }

  int currentIndex = 0;
  List<News> newsarr = <News>[];
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
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
                itemCount: communitiesarr.length,
                itemBuilder: (context, index) {
                  return customChip(index);
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: newsarr.isEmpty
                ? const CircularProgressIndicator()
                : TCard(
                    cards: cardFunc(context, newsarr),
                    size: Size(
                        queryData.size.width - 8, queryData.size.height - 230),
                    onForward: (index, si) async {
                      if (si.direction == SwipDirection.Right) {
                        //Swipe functionality
                        // try {
                        Response responseArticles = await Dio().get(
                            'https://insync-backend-2022.herokuapp.com/article/fetchAll');
                        // print("👇👇👇");
                        // print(responseArticles.data.toString());
                        // } catch (e) {
                        //   print(e.toString() +
                        //       "👉👉👉you have an err while getting the articles");
                        // }

                        try {
                          Response response = await Dio().post(
                            "https://insync-backend-2022.herokuapp.com/article/new",
                            data: {
                              "author": "Who cares",
                              "title": newsarr[index - 1].headline,
                              "desc": newsarr[index - 1].desc,
                              "article_url": newsarr[index - 1].imgURL,
                              "img_url": newsarr[index - 1].imgURL,
                              "publishedAt": DateTime.now().toUtc().toString(),
                              "content": newsarr[index - 1].desc
                            },
                          );
                        } catch (err) {
                          print(err.toString() + " 👉👉 you have some error while creating a new article");
                        }
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ArticlePage(
                                headline: newsarr[index - 1].headline,
                                articleID: responseArticles.data["articles"]
                                        [index - 1]["_id"]
                                    .toString(),
                                imgURL: newsarr[index - 1].imgURL,
                                news: newsarr[index - 1].desc,
                                interestTags: newsarr[index - 1].interestTags,
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
          ),
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
          label: Text(communitiesarr[index]["name"]),
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
      articleID: array[index].articleID,
      news: array[index].desc,
      imgURL: array[index].imgURL,
      likes: Random().nextInt(100),
      interestTags: array[index].interestTags,
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
