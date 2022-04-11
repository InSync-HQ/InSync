import 'package:flutter/material.dart';
import 'package:insync/utils/theme_config.dart';
import 'package:tcard/tcard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: lighttheme.scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(
                  22,
                  0,
                  0,
                  0,
                ),
                child: Text(
                  'Your Newsfeed',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  0,
                  0,
                  0,
                ),
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return customChip(index);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: TCard(
                  cards: cardFunc(),
                  size: const Size(380, 550),
                  onForward: (index, si) {
                    if (si.direction == SwipDirection.Right) {
                      //Swipe functionality
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color(0xffecf0f4),
                    child: IconButton(
                        onPressed: () {
                          // Custom Function
                        },
                        icon: const Icon(
                          Icons.arrow_circle_left_outlined,
                          color: Colors.grey,
                        )),
                  ),
                  const Chip(
                    labelPadding: EdgeInsets.all(8),
                    label: Text('Read more'),
                    backgroundColor: Color(0xffecf0f4),
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color(0xffecf0f4),
                    child: IconButton(
                        onPressed: () {
                          // Custom Function
                        },
                        icon: const Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Colors.grey,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customChip(int index) {
    return GestureDetector(
      onTap: () => setState(() {
        currentIndex = index;
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Chip(
          backgroundColor: (currentIndex == index)
              ? Colors.black
              : lighttheme.scaffoldBackgroundColor,
          label: const Text('Your feed'),
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

List<Widget> cardFunc() {
  return List.generate(
    10,
    (index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 25,
                spreadRadius: -7,
                offset: const Offset(0, 16))
          ],
          color: Colors.white,
        ),
        child: Column(children: [
          Container(
            height: 200,
            color: Colors.transparent,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80"),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                height: 29,
                margin: const EdgeInsets.fromLTRB(16, 10, 10, 0),
                width: 62,
                decoration: BoxDecoration(
                    color: const Color(0xffEBFCD5),
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                    child: Text(
                  'Finance',
                  style: TextStyle(
                    color: Color(0xff2D9017),
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
              ),
              Container(
                height: 29,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: 71,
                decoration: BoxDecoration(
                    color: const Color(0xffFFF5CE),
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                    child: Text(
                  'Food Tech',
                  style: TextStyle(
                    color: Color(0xffDB8C09),
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              0,
              16,
              6.43,
            ),
            child: Text(
              'Swiggy eyes 800 million IPO early next year',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              0,
              16,
              6.43,
            ),
            child: Text(
              'Swiggy and Zomato are neck-and-neck in terms of sales. In December, Swiggy claimed monthly sales of 250 million from its food delivery business, while Zomato posted sales of 733 million in the Oct...',
              style: TextStyle(
                  color: Colors.black, overflow: TextOverflow.ellipsis),
              maxLines: 3,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.thumb_up_alt_outlined,
                    color: Colors.grey,
                    size: 15,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('2.6k likes',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                ],
              ),
              Row(
                children: const [
                  Text(
                    'Read More',
                    style: TextStyle(
                      color: Color(0xff2561ED),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: Color(0xff2561ED),
                  ),
                  SizedBox(width: 5),
                ],
              )
            ],
          )
        ])),
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
