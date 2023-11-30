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
  void initState() {
    context.read<Quotesprovider>().CallingApi();
    super.initState();
  }


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
              selectedColor: Colors.purple,
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
