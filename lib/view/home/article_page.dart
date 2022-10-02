// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:insync/utils/classes.dart';
import 'package:insync/widgets/auto_generate_interest_tags.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({
    Key? key,
    required this.headline,
    required this.articleID,
    required this.imgURL,
    required this.news,
    this.interestTags = const [],
  }) : super(key: key);
  final String headline;
  final String articleID;
  final String imgURL;
  final String news;
  final List<InterestTag> interestTags;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final commentctr = TextEditingController();
  final scrollctr = ScrollController();
  List<CommentTile> commentsarr = <CommentTile>[];
  @override
  void initState() {
    super.initState();
    getComments();
  }

  void getComments() async {
    try {
      late SharedPreferences prefs;
      prefs = await SharedPreferences.getInstance();
      Response response = await Dio().get(
        'https://insync-backend-2022.herokuapp.com/comment/forArticle/' +
            widget.articleID,
        options: Options(headers: {"Authorization": prefs.getString("jwt")}),
      );

      print("these are the comments ▶▶🤜🤜 " + response.data["comments"].length.toString());
      setState(() {
        commentsarr = <CommentTile>[];
        commentsarr = List.generate(
          response.data["comments"].length,
          (index) => CommentTile(
            username: "siddhu",
            content: response.data["comments"]["message"],
          ),
        );
      });
      print(commentsarr);
    } catch (err) {
      print(err.toString() +
          " 👉👉 you have some error while fetching the comments");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          NestedScrollView(
            // controller: scrollctr,
            // physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                ArticleSliverAppBar(
                  headline: widget.headline,
                  imgURL: widget.imgURL,
                ),
              ];
            },
            body: SingleChildScrollView(
              // controller: scrollctr,
              child: Column(
                children: [
                  NewsContent(widget: widget),
                  DiscussionSection(
                    scrollctr: scrollctr,
                    commentsarr: commentsarr,
                    articleID: widget.articleID,
                  ),
                ],
              ),
            ),
          ),
          BottomCommentBox(
            commentctr: commentctr,
            articleID: widget.articleID,
          )
        ],
      ),
    );
  }
}

class NewsContent extends StatelessWidget {
  const NewsContent({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ArticlePage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoGenerateInterestTags(interestTags: widget.interestTags),
          const SizedBox(height: 8),
          Text(
            widget.headline,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.news,
            style: const TextStyle(fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

class DiscussionSection extends StatelessWidget {
  const DiscussionSection({
    Key? key,
    required this.scrollctr,
    required this.commentsarr,
    required this.articleID,
  }) : super(key: key);

  final ScrollController scrollctr;
  final List<CommentTile> commentsarr;
  final String articleID;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        const Divider(thickness: 4),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: Row(
            children: [
              SizedBox(
                child: Image.asset('assets/fire.png'),
                height: 24,
                width: 24,
              ),
              const Text(
                ' Discussions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: commentsarr.isEmpty
              ? const CircularProgressIndicator()
              : SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    controller: scrollctr,
                    itemCount: commentsarr.length,
                    itemBuilder: (context, index) => commentsarr[index],
                  ),
                ),
        ),
      ],
    );
  }
}

class CommentTile extends StatelessWidget {
  const CommentTile({
    Key? key,
    required this.username,
    required this.content,
    this.likes = 0,
    this.dislikes = 0,
    this.time = "sometime ago",
  }) : super(key: key);
  final String username;
  final String content;
  final int likes;
  final int dislikes;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            ),
            const SizedBox(width: 8),
            Text(
              username,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(width: 16),
            Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 13,
                  color: Colors.black38),
            )
          ],
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(
              Icons.thumb_up_outlined,
              size: 18,
            ),
            const SizedBox(width: 10),
            Text(
              likes.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 25),
            const Icon(Icons.thumb_down_outlined, size: 18),
            const SizedBox(width: 10),
            Text(
              dislikes.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
          child: Divider(
            thickness: 2,
          ),
        ),
      ],
    );
  }
}

class BottomCommentBox extends StatelessWidget {
  const BottomCommentBox({
    Key? key,
    required this.commentctr,
    required this.articleID,
  }) : super(key: key);

  final TextEditingController commentctr;
  final String articleID;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Comment something...",
                ),
                controller: commentctr,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              String message = commentctr.text;
              try {
                late SharedPreferences prefs;
                prefs = await SharedPreferences.getInstance();
                Response res = await Dio().post(
                  "https://insync-backend-2022.herokuapp.com/comment/new",
                  data: {
                    "message": message,
                    "article_id": articleID,
                  },
                  options: Options(
                    headers: {
                      "authorization": prefs.getString("jwt"),
                    },
                  ),
                );
                print(res.data.toString());
                commentctr.clear();
              } catch (err) {
                print(err.toString() +
                    "👉👉👉you have an error in creating a comment");
              }
            },
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
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
