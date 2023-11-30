import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/QuotesProvider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {




    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Quotesprovider>(builder: (context, a, child) {
      return Container(
          child: ListView.builder(
              itemCount: a.quoteslist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.pink[100],
                            ),
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 1,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(a.quoteslist[index].q!,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ),
                            )),
                        Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.pink[100],
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 1,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text("-" + a.quoteslist[index].a!,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ),
                            )),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 1,
                          color: Colors.pink[50],
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: LikeButton(
                                  isLiked: false,
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      Icons.favorite,
                                      color: isLiked
                                          ? Colors.pink
                                          : Colors.white70,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: ElevatedButton(
                                    onPressed: () {

                                      a.SaveFavourite(context,a.quoteslist[index].q!);


                                    },
                                    child: Icon(Icons.bookmark)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: ElevatedButton(
                                    onPressed: (){

                                      a.share(a.quoteslist[index].q!);

                                    },
                                    child: Icon(Icons.share)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }));
    });
  }
}
