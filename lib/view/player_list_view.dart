import 'dart:ffi';

import 'package:cricket_team_management/model/player_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PlayerListView extends StatefulWidget {

  PlayerListView({
    Key key,
  });
  @override
  _PlayerListViewState createState() => _PlayerListViewState();
}

class _PlayerListViewState extends State<PlayerListView> {
  List<Player> games = List<Player>();
  // UpcomingGameService _gameService = UpcomingGameService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _gameService.fetchUpcomingGame().then((response) => {
    // setState(() {
    //   games = response;
    // })
    // });
  }
  @override
  Widget build(BuildContext context) {
    return
      // getEventItem();
      new Stack(
        children: [
          new Scaffold(
            appBar: new AppBar(
            title: Text("Upcoming Games"),
            ),
            body: getEventItem(),
            backgroundColor: Colors.grey[100],
          ),
        ],
      );
  }
  Widget getEventItem() {
    return  new Stack(
    children: [
    new Container(
    child: new Expanded(
        child: new ListView.builder(
          itemCount : games.length,
            itemBuilder: (context, index) {
              return new Card(
                margin: EdgeInsets.only(left: 20,top:10, right: 20, bottom: 10),
                child: new Container(
                  padding: EdgeInsets.all(15),
                  child: new Column(
                    children: [
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // new Image(image: AssetImage('images/login_bg.jpeg'), fit: BoxFit.fitWidth, width: 75,height: 75,),
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              new Container(
                                child: new Column(
                                  children: [
                                    new Container(
                                      child: new Text("Game Name", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 12),),
                                    ),
                                    new Container(
                                      child: new Text(games[index].name ?? "", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
                                    ),
                                  ],
                                ),
                              ),
                              new SizedBox(height: 30,),
                              new Container(
                                child: new Column(
                                  children: [
                                    new Container(
                                      child: new Text("Game Group", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 12),),
                                    ),
                                    new Container(
                                      child: new Text(games[index].name ?? "", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                          new Center(
                            child: new Container(width: 1, height:  100, color: Colors.grey,),
                          ),
                          new Container(
                            width: 150,
                              child: new Align(
                                alignment: Alignment.bottomRight ,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    new Container(
                                      child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          new Icon(Icons.event),
                                          // new SizedBox(width: 10,),
                                          new Text(games[index].gamerAlias ?? "", style: TextStyle(fontSize: 12,),)
                                        ],
                                      ),
                                    ),
                                    new SizedBox(
                                      height: 10,
                                    ),
                                    new Container(
                                      child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          new Icon(Icons.date_range, color: Colors.black,),
                                          new SizedBox(width: 20,),
                                          new Text(games[index].timeZone ?? ""),
                                        ],
                                      ),
                                    ),
                                    new SizedBox(
                                      height: 10,
                                    ),
                                    new Container(
                                      child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          // new Container(width: 1, color: Colors.grey,),
                                          new Icon(Icons.timer),
                                          // new SizedBox(width: 20,),
                                          new Text(games[index].timeZone ?? ""),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              )

                          ),

                        ],
                      ),
                    ],
                  ),
                )
                
              );
        }),
    ),
    )
    ] ,
    );
    // );
  }
}





