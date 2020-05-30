import 'package:flutter/material.dart';
import 'package:shoes_ui/shoe_detail.dart';

class Homepage extends StatefulWidget {
  final Shoes shoesdetail;
  Homepage({@required this.shoesdetail});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectSizeIndex = 0;
  List<String> shoeSize = ["8", "8.5", "9", "9.5", "10", "10.5", "11", "12"];

  Widget getSize(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectSizeIndex = index;
        });
      },
      child: Row(
        children: <Widget>[
          Container(
            width: 49,
            decoration: BoxDecoration(
                color: selectSizeIndex == index ? Colors.black : Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              shoeSize[index],
              style: TextStyle(
                  color:
                      selectSizeIndex == index ? Colors.white : Colors.black),
            )),
          ),
          SizedBox(width: 10)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
              child: Image.asset(
            "images/appbar.png",
            height: 60,
          )),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            )
          ],
        ),
        backgroundColor: Colors.grey[300],
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.shoesdetail.imageurl),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                            child: Text(
                          widget.shoesdetail.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        SizedBox(height: 184),
                        Container(
                          height: 40,
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 80,
                            decoration: BoxDecoration(
                                color: Color(0xff2b87ad),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            child: Center(
                              child: Text(
                                "\$${widget.shoesdetail.price}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Text(
                        "Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.favorite, color: Colors.pink[200]),
                      Text(widget.shoesdetail.like)
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Lorem ipsum dolor sit amet, consecteture adipiscing elit. Aenean commodo ligula edgt dolor. Aenean messa Cum sociis natoque at magnis disparturient montes, nascetur ridiculus mus quam felis.",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text("Size", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Container(
                    height: 50,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: shoeSize.asMap().entries.map((MapEntry map) {
                          return getSize(map.key);
                        }).toList()),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 15, right: 10),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(
                        child: Text("Add to Cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(height: 8),
                  Center(
                      child:
                          Text("Review", style: TextStyle(color: Colors.blue))),
                  Center(child: Icon(Icons.keyboard_arrow_down))
                ],
              ),
            )
          ],
        ));
  }
}
