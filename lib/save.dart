import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/QuotesProvider.dart';

class Save extends StatefulWidget {
  @override
  State<Save> createState() => _SaveState();
}

class _SaveState extends State<Save> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Quotesprovider>(builder: (context, c, child) {
      return Scaffold(
        body: Center(
          child: Container(
            child: ListView.builder(

                itemCount: c.favquotes.length,
                itemBuilder: (context, index) {
              return Container(
                height: 30,
                child: Center(
                  child:(c.favquotes.length==0)?Text("No Favourite available"): Text(c.favquotes[index]),
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}
