import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:template_quiz_mobile_si_b/data/game_model_data.dart';
import 'detail_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key, required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), (route) => false);
            }, icon: Icon(Icons.logout_outlined)
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text('Selamat Datang, $username!'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  color: Colors.grey[300],
                  child: Center(
                    child: GridView.builder(
                      padding: EdgeInsets.all(8),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, 
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.8, 
                      ),
                      itemBuilder: (context, index){
                        return _gameModel(context, index);
                      }, 
                      itemCount: gameList.length,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _gameModel(BuildContext context, int index) {
    return InkWell(  
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailPage(index: index);
        }));
      },
      child: Card( 
        elevation: 2,
        child: Column(
          children: [
             Expanded(
              flex: 1,
              child: Container(
                width: double.infinity, 
                color: Colors.grey[300],
                child: gameList[index].gameImg.isNotEmpty 
                  ? Image.asset(
                      gameList[index].gameImg,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Icon(
                            Icons.image_not_supported,
                            size: 40,
                            color: Colors.grey[600],
                          ),
                        );
                      },
                    )
                  : Icon(
                      Icons.gamepad,
                      size: 40,
                      color: Colors.grey[600],
                    ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        gameList[index].gameName,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 4),
                    Flexible(
                      child: Text(
                        gameList[index].gamePublisher,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     Flexible(
                      child: Text(
                        gameList[index].gameDesc,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ), 
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}