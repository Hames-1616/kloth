import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Likebutton extends StatefulWidget {
  const Likebutton({super.key});

  @override
  State<Likebutton> createState() => _LikebuttonState();
}

class _LikebuttonState extends State<Likebutton> {
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 30,
      circleColor:
         const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(Icons.home,
            color: isLiked ? Colors.deepPurpleAccent : Colors.grey, size: 30);
      },
    );
  }
}
