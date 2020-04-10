import 'package:flutter/material.dart';
import 'package:shoes_ui/shoe_detail.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int selectedIndex = 0;

  List<String> item = [
    "New arrivals",
    "Popular",
    "Coming soon",
    "highly ordered",
  ];

  Widget getIndex(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: Text(item[index],
              style: TextStyle(
                color: Color(selectedIndex == index ? 0xff0a0a0a : 0xffaaaaaa),
                fontSize: (selectedIndex == index ? 18 : 15),
              )),
        ),
      ),
    );
  }

  Widget getShoes(Shoes shoe) {
    return GestureDetector(
      onTap: () => debugPrint("p"),
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            margin: EdgeInsets.only(left: 10, right: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffaaaaaa),
                image: DecorationImage(
                    image: AssetImage(shoe.imageurl), fit: BoxFit.cover)),
            child: Padding(
              padding:  EdgeInsets.only(left:8.0,top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    shoe.name,
                    style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),
                  ),
                  Text("On Stock"),
                  Row(
                    children: <Widget>[
                      Icon(Icons.favorite, color: Color(0xfff5898a)),
                      Text(shoe.like),
                    ],
                  ),
                  
                  SizedBox(height: 87),
                  Container(
                    height: 40,
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                          color: Color(0xff6b88a8),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(15))),
                      child: Center(
                        child: Text(
                          "\$${shoe.price}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height:15)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.blur_on,
          color: Colors.black,
        ),
        title: Center(
            child: Text(
          "Shoes App",
          style: TextStyle(color: Colors.black),
        )),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.shopping_cart, color: Colors.black),
          )
        ],
      ),
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 45,
                margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          offset: Offset(4, 4),
                          color: Colors.grey[500],
                          spreadRadius: 1),
                      BoxShadow(
                          blurRadius: 10,
                          offset: Offset(-4, -4),
                          color: Colors.white,
                          spreadRadius: 1)
                    ]),
                child: TextField(
                  decoration: InputDecoration(

                      hintText: "Search something",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      prefixIcon: Icon(Icons.search, color: Colors.grey)),
                ),
              ),
              SizedBox(height: 10),
              Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 8, right: 8),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: item.toList().asMap().entries.map((MapEntry map) {
                      return getIndex(map.key);
                    }).toList(),
                  )),

              Container(
                child: Column(
                    // scrollDirection: Axis.vertical,
                    children: shoelist.asMap().entries.map((MapEntry map) {
                  return getShoes(map.value);
                }).toList()),
              ),
              SizedBox(height: 20),

              // Container(
              //   height: 200,
              //   margin: EdgeInsets.only(left: 10, right: 10),
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Color(0xffaaaaaa),
              //       image: DecorationImage(
              //           image: AssetImage("images/photo1.jpeg"),
              //           fit: BoxFit.cover)),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Text(
              //         "Nike joynite Run flyknit",
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       Text("On Stock"),
              //       Row(
              //         children: <Widget>[
              //           Icon(Icons.favorite, color: Color(0xfff5898a)),
              //           Text("10K"),
              //         ],
              //       ),
              //       Text(
              //         "\$${150}",
              //       ),
              //       SizedBox(height: 92),
              //       Container(
              //         height: 30,
              //         alignment: Alignment.bottomRight,
              //         child: Container(
              //           // height: 25,
              //           width: 80,
              //           decoration: BoxDecoration(
              //               color: Color(0xff6b88a8),
              //               borderRadius: BorderRadius.only(
              //                   bottomRight: Radius.circular(15),
              //                   topLeft: Radius.circular(15))),
              //           child: Center(
              //             child: Text(
              //               "\$${150}",style: TextStyle(color:Colors.white),
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // Text("hii"),
              // Container(
              //   height: 200,
              //   margin: EdgeInsets.only(left: 10, right: 10),
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Color(0xffaaaaaa),
              //       image: DecorationImage(
              //           image: AssetImage("images/photo0.jpeg"),
              //           fit: BoxFit.cover)),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Text(
              //         "Nike joynite Run flyknit",
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       Text("On Stock"),
              //       Row(
              //         children: <Widget>[
              //           Icon(Icons.favorite, color: Color(0xfff5898a)),
              //           Text("10K"),
              //         ],
              //       ),
              //       Text(
              //         "\$${150}",
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(height: 10),
              // Container(
              //   height: 200,
              //   margin: EdgeInsets.only(left: 10, right: 10),
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Color(0xffaaaaaa),
              //       image: DecorationImage(
              //           image: AssetImage("images/photo3.jpeg"),
              //           fit: BoxFit.fill)),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Text(
              //         "Nike joynite Run flyknit",
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       Text("On Stock"),
              //       Row(
              //         children: <Widget>[
              //           Icon(Icons.favorite, color: Color(0xfff5898a)),
              //           Text("10K"),
              //         ],
              //       ),
              //       Text(
              //         "\$${150}",
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(height: 10)
            ],
          )
        ],
      )),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:shoes_ui/shoe_detail.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: homescreen(),
//       theme: ThemeData(
//           ),
//     );
//   }
// }

// class homescreen extends StatefulWidget {
//   @override
//   _homescreenState createState() => _homescreenState();
// }

// class _homescreenState extends State<homescreen> {
//   int selectedIndex = 0;
//   List<String> li = ["Now Playing", "Popular", "Coming Soon", "Highly Rated"];

//   Widget getIndex(int index) {
//     return GestureDetector(
//       onTap: () {
//         selectedIndex = index;
//         setState(() {});
//       },
//       child: Container(
//         margin: EdgeInsets.only(left: 10, right: 10),
//         padding: EdgeInsets.symmetric(horizontal: 35),
//         // width: 100,
//         // height: 40,
//         decoration: BoxDecoration(
//           color: Colors.black,
//           // color: Color(selectedIndex == index ? 0xffd43c34 : 0xff0c151a),
//           borderRadius: BorderRadius.all(Radius.circular(12)),
//         ),
//         child: Center(
//           child: Text(
//             li[index],
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget getShoeslist(Shoes shoes) {
//     return GestureDetector(
//       onTap: () => debugPrint("p"),
//       child: Container(
//         // margin:EdgeInsets.only(left:10,top:5),
//         //  height: MediaQuery.of(context).size.height-50,
//         height: 200,
//         width: double.infinity,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey,
//                 offset: Offset(0, 8),
//                 blurRadius: 20,
//                 spreadRadius: 8,
//               )
//             ],
//             image: DecorationImage(
//                 image: AssetImage("images/images (2).jpeg"), fit: BoxFit.fill)),

//         child: Padding(
//           padding:  EdgeInsets.only(top: 8.0, left: 8),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 shoes.name,
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Text("On stock"),
//               Row(
//                 children: <Widget>[
//                   Icon(Icons.blur_circular, color: Colors.pink),
//                   Text(shoes.like)
//                 ],
//               ),
//               SizedBox(height: 94),
//               Container(
//                 margin: EdgeInsets.only(left: 250),
//                 // color:Color(0xff6b88a8),
//                 decoration: BoxDecoration(
//                   color: Color(0xff6b88a8),
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       bottomRight: Radius.circular(10)),
//                 ),
//                 height: 30,
//                 child: Center(
//                     child: Text("\$${shoes.price}",
//                         style: TextStyle(color: Colors.white))),
//               ),
//                SizedBox(height: 10)
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.grey[400],
//       appBar: AppBar(
//         // titleSpacing: 80,
//         backgroundColor: Colors.black,
//         title: Center(
//           child: Text("Shoes"),
//         ),
//         leading: Icon(
//           Icons.list,
//           // color: Colors.white,
//         ),
//         actions: <Widget>[
//           Icon(
//             Icons.add_shopping_cart,
//             // color: Colors.white,
//           )
//         ],
//       ),
//       body: SafeArea(
//         // maintainBottomViewPadding: true,
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           //  height: double.infinity,
//             margin: EdgeInsets.only(left: 9, right: 9),
//             child: Column(
//               children: <Widget>[
//                 SizedBox(height: 10),
//                 Container(
//                   height: 40,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: li.toList().asMap().entries.map((MapEntry map) {
//                       return getIndex(map.key);
//                     }).toList(),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                       // height: double.infinity,
//                       height: MediaQuery.of(context).size.height-160,
//                     child: ListView(
//                         scrollDirection: Axis.vertical,
//                         children: shoelist
//                             .toList()
//                             .asMap()
//                             .entries
//                             .map((MapEntry map) {
//                           return getShoeslist(map.value);
//                         }).toList()))
//               ],
//             )),
//       ),
//     );
//   }
// }
/*images (1).jpeg
   - images/images (2).jpeg
   - images/images (3).jpeg
   - images/images (4).jpeg
   - images/images (5).jpeg
   - images/download (2).jpeg
   - images/images.jpeg*/
