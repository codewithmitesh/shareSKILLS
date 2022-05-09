// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:skillshare/Screens/feedHelpers.dart';
import 'package:skillshare/Screens/profile.dart';

import '../Controlls/UploadPost.dart';

// Tried with stateless widget
// class FeedPage2 extends StatelessWidget {
//   const FeedPage2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: PreferredSize(
//       preferredSize: const Size.fromHeight(100),
//       child: Provider.of<FeedHelper>(context, listen: false).appBar(context),
//     ));
//   }
// }

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FeedPage(),
    );
  }
}

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Provider.of<FeedHelper>(context, listen: false).appBar(context),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 2,
              color: Colors.grey[300],
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            SizedBox(height: 20),
            Text(
              "Photography",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 97, 93, 93)),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 8),
                children: [
                  buildPostSection(
                      "https://www.haqseengineer.com/wp-content/uploads/2019/07/campus3-1.jpg",
                      "https://media-exp1.licdn.com/dms/image/C4D03AQFTg2cGxVuocQ/profile-displayphoto-shrink_200_200/0/1623771179828?e=1652313600&v=beta&t=BiOegBDA8jR6N0rFnniGeqvwGGzSuqRe45N9r5BSxIY"),
                  buildPostSection(
                      "https://images.unsplash.com/photo-1433162653888-a571db5ccccf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
                      "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
                  buildPostSection(
                      "https://images.pexels.com/photos/1212600/pexels-photo-1212600.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=200&w=1260",
                      "https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Post Section Widget
  Container buildPostSection(String urlPost, String urlProfilePhoto) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildPostFirstRow(urlProfilePhoto),
          SizedBox(
            height: 10,
          ),
          buildPostPicture(urlPost),
          SizedBox(
            height: 5,
          ),
          Text(
            "963 likes",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800]),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  // post row widget
  Row buildPostFirstRow(String urlProfilePhoto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ProfilPage(url: urlProfilePhoto)));
              },
              child: Hero(
                tag: urlProfilePhoto,
                child: CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(urlProfilePhoto),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Username",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "MITAOE, Alandi, Pune",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500]),
                ),
              ],
            )
          ],
        ),
        Icon(Icons.more_vert)
      ],
    );
  }

  // postPicture widget
  Stack buildPostPicture(String urlPost) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width - 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(urlPost),
              )),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: LikeButton(size: 35),
        )
      ],
    );
  }

  // Story avatar widget
  Container buildStoryAvatar(String url) {
    return Container(
      margin: EdgeInsets.only(left: 18),
      height: 60,
      width: 60,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.red),
      child: CircleAvatar(
        radius: 18,
        backgroundImage: NetworkImage(url),
      ),
    );
  }
}
