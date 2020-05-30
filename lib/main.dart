import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoes_ui/shoe_detail.dart';
import 'detailScreen.dart';

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
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.dispose();
  }

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
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Homepage(
                      shoesdetail: shoe,
                    )));
      },
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
              padding: EdgeInsets.only(left: 8.0, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    shoe.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
          SizedBox(height: 15)
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
          size: 30,
        ),
        title: Center(
            child: Image.asset(
          "images/appbar.png",
          height: 60,
        )),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
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
                      focusedBorder: InputBorder.none,
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
                    children: shoelist.asMap().entries.map((MapEntry map) {
                  return getShoes(map.value);
                }).toList()),
              ),
              SizedBox(height: 20),
            ],
          )
        ],
      )),
    );
  }
}
