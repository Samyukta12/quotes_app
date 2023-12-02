import 'package:flutter/material.dart';
import 'package:quotes_app/QuotesProvider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (_) => Quotesprovider(),
      child: MaterialApp(home: MyApp(),
      debugShowCheckedModeBanner: false,),
    ));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return Consumer<Quotesprovider>(
      builder: (context,b,child) {
        return Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: b.selectedItemPosition,
          onTap: (i) => setState(() => b.selectedItemPosition = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.pink,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.bookmark),
              title: Text("Favourite"),
              selectedColor: Colors.pink,
            ),


          ],
        ),
          appBar: AppBar(
            actions: [
              GestureDetector(onTap:(){
                context.read<Quotesprovider>().Refresh();


              },child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.refresh),
              )),

            ],
              title: Center(
                  child: Text(
            'Quotes',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w700, letterSpacing: 2),
          ))),
          body: b.nav[b.selectedItemPosition],
        );
      }
    );
  }
}
