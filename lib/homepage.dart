import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize= MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: screenSize.height*0.4,
            width: double.infinity,
            color: Colors.pink[100],

            child: Column(children: [
              Row(children: [],)
            ],),
          ),
        );
          },)
    );
  }
}
