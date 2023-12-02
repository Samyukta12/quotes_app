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
        appBar: AppBar(
          actions: [GestureDetector(
              onTap: (){
                context.read<Quotesprovider>().Savedpref();


              },
              child: Icon(Icons.save))],
        ),
        body: Center(
          child: Container(
            child: ListView.builder(
                itemCount: c.favquotes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: (c.favquotes.length == 0)
                                ? Text("No favourite available")
                                : Text(
                                    c.favquotes[index].q!,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      );
    });
  }
}
