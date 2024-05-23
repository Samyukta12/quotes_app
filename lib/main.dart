// import 'package:flutter/material.dart';
// import 'package:quotes_app/QuotesProvider.dart';
// import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
// import 'package:provider/provider.dart';
//
// void main() => runApp(ChangeNotifierProvider(
//       create: (_) => Quotesprovider(),
//       child: MaterialApp(home: MyApp(),
//       debugShowCheckedModeBanner: false,),
//     ));
//
// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => MyAppState();
// }
//
// class MyAppState extends State<MyApp> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Quotesprovider>(
//       builder: (context,b,child) {
//         return Scaffold(
//         bottomNavigationBar: SalomonBottomBar(
//           currentIndex: b.selectedItemPosition,
//           onTap: (i) => setState(() => b.selectedItemPosition = i),
//           items: [
//             /// Home
//             SalomonBottomBarItem(
//               icon: Icon(Icons.home),
//               title: Text("Home"),
//               selectedColor: Colors.pink,
//             ),
//
//             /// Likes
//             SalomonBottomBarItem(
//               icon: Icon(Icons.bookmark),
//               title: Text("Favourite"),
//               selectedColor: Colors.pink,
//             ),
//
//
//           ],
//         ),
//           appBar: AppBar(
//             actions: [
//               GestureDetector(onTap:(){
//                 context.read<Quotesprovider>().Refresh();
//
//
//               },child: Padding(
//                 padding: const EdgeInsets.only(right: 10),
//                 child: Icon(Icons.refresh),
//               )),
//
//             ],
//               title: Center(
//                   child: Text(
//             'Quotes',
//             style: TextStyle(
//                 fontSize: 30, fontWeight: FontWeight.w700, letterSpacing: 2),
//           ))),
//           body: b.nav[b.selectedItemPosition],
//         );
//       }
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideTransition;
  bool isClicked = false;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    // slideTransition= Tween(begin: Offset(0,0))
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Quotes App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animation'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TweenAnimationBuilder(
                    duration: Duration(milliseconds: 2000),
                    tween: ColorTween(begin: Colors.white, end: Colors.black),
                    builder: (context, Color, Widget) {
                      return Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color,
                          // borderRadius: BorderRadius.circular(10)
                        ),
                        height: screenSize.height * 0.1,
                        width: screenSize.width * 0.1,
                        // color: Colors.grey,
                      );
                    }),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                child: AnimatedContainer(
                    height: screenSize.height * 0.05,
                    width: isClicked
                        ? screenSize.width * 0.4
                        : screenSize.width * 0.1,
                    duration: Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                        color: isClicked ? Colors.green[200] : Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: isClicked
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Added to cart",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          )
                        : Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          )),
              ),
              SizedBox(
                height: screenSize.height * 0.1,
                width: double.infinity,
                // color: AppColor.primaryColor,
                child: Row(
                  children: [
                    CustomContainerBox(
                      borderColor: Colors.white,
                      containerHeight: screenSize.height * 0.08,
                      screenSize: screenSize,
                      iconImage: "icons/projects.svg",
                      text: "Gallery",
                    ),
                    CustomContainerBox(
                        borderColor: Colors.white,
                        containerHeight: screenSize.height * 0.08,
                        screenSize: screenSize,
                        // iconImage: "icons/projects.svg",
                        text: "Portfolio"),
                    CustomContainerBox(
                        borderColor: Colors.white,
                        containerHeight: screenSize.height * 0.08,
                        screenSize: screenSize,
                        // iconImage: "icons/projects.svg",
                        text: "Templates"),
                    CustomContainerBox(
                        borderColor: Colors.white,
                        containerHeight: screenSize.height * 0.08,
                        screenSize: screenSize,
                        // iconImage: "icons/projects.svg",
                        text: "P.Report")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainerBox extends StatelessWidget {
  final String? iconImage;
  final Color? borderColor;
  final String text;
  final VoidCallback? onTap;
  final double containerHeight;

  const CustomContainerBox(
      {super.key,
      required this.screenSize,
      this.iconImage,
      required this.text,
      this.onTap,
      required this.containerHeight,
      this.borderColor});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          shadowColor: Colors.grey,
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
              height: containerHeight,
              width: screenSize.width * 0.2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: borderColor ?? Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // SvgPicture.asset(
                    //   iconImage,
                    // ),
                    Text(
                      text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              )
              //  Image.asset(
              //   iconImage.toString(),
              // ),
              ),
        ),
      ),
    );
  }
}
