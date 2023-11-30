import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/save.dart';
import 'package:flutter_share/flutter_share.dart';
import 'Model.dart';
import 'package:http/http.dart' as http;
import 'home.dart';


class Quotesprovider extends ChangeNotifier{



  List nav = [ Home(), Save() ];
  int selectedItemPosition = 0;

  List<String> favquotes=[];




  Future<void> share(String coimig ) async {
    await FlutterShare.share(
        title: ' share',
        text: coimig,
        // linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Share your favourite quotes');
  }



  Map map = {};
  List<Model> quoteslist = [];



  CallingApi() async {
    await http
        .get(Uri.parse("https://zenquotes.io/api/quotes"))
        .then((comingvalue) {
      List cominglist = jsonDecode(comingvalue.body);

      cominglist.forEach((sujata) {
        map.addAll(sujata);
        quoteslist.add(Model.fromJson(map));
      });

      notifyListeners();
    });
  }



  SaveFavourite(context,String comingfavourite){

    favquotes.add(comingfavourite);

    Flushbar(
      message: 'Saved to favourites.',
      flushbarPosition: FlushbarPosition.BOTTOM,
      borderRadius: BorderRadius.zero,
      icon: Icon(
        Icons.bookmark,
        size: 28.0,
        color: Colors.blue[300],
      ),
      duration: Duration(seconds: 1),
      leftBarIndicatorColor: Colors.blue[300],
    )..show(context);

notifyListeners();
  }






}