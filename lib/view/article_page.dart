import 'package:flutter/material.dart';
import 'package:insync/widgets/news_tag.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            const ArticleSliverAppBar(
              headline: "Swiggy eyes \$800 million IPO early next year",
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Image.network(
              //   'https://cdn.wallpapersafari.com/73/96/ziuapc.jpg',
              //   height: 300,
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
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
                    const SizedBox(height: 8),
                    const Text(
                      "Swiggy eyes \$800 million IPO early next year",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',
                      style: TextStyle(fontWeight: FontWeight.w300),
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
                  child: Container(
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
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12),
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
                  ))
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
  }) : super(key: key);
  final String headline;

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
          'https://cdn.wallpapersafari.com/73/96/ziuapc.jpg',
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
