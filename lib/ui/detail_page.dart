import 'package:flutter/material.dart';
import 'package:template_quiz_mobile_si_b/models/game_model.dart';
import 'package:template_quiz_mobile_si_b/data/game_model_data.dart';
import 'home_page.dart';

class DetailPage extends StatefulWidget {
  // final GameModel game;
  final int index; 
  const DetailPage({super.key, required this.index});
  

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLiked = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order ${gameList[widget.index].gameName}'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Container(
            child: Image.asset(
              gameList[widget.index].gameImg, 
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            padding: EdgeInsets.all(0),
            height: 250,
            width: double.infinity,
            color: Colors.grey[300],
            alignment: Alignment.center,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  gameList[widget.index].gameName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  gameList[widget.index].gamePublisher,
                  textAlign: TextAlign.left, 
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: Colors.pink,
                      ),
                      onPressed: () {
                        setState(() {
                          if (isLiked) {
                            gameList[widget.index].totalLike--;
                            isLiked = false;
                          } else {
                            gameList[widget.index].totalLike++;
                            isLiked = true;
                          }
                        });
                      },
                    ),
                    Text(
                      "${gameList[widget.index].totalLike} Likes",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  gameList[widget.index].gameDesc,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
