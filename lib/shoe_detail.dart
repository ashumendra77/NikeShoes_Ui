import 'package:flutter/cupertino.dart';

class Shoes {
  String name;
  String like;
  String price;
  String imageurl;
  Shoes(
      {@required this.like,
      @required this.name,
      @required this.imageurl,
      @required this.price});
}

List<Shoes> shoelist = [
  Shoes(
      name: "Nike joyride run Flyknit",
      imageurl: "images/photo13.jpeg",
      like: "102k",
      price: "139"),
  Shoes(
      name: "Nike Adapt Hurarache",
      imageurl: "images/photo11.jpeg",
      like: "142k",
      price: "189"),
  Shoes(
      name: "Kyrie 6 PRE HEAT",
      imageurl: "images/photo12.jpeg",
      like: "162k",
      price: "159"),
  Shoes(
      name: "Nike joyride run",
      imageurl: "images/photo0.jpeg",
      like: "182k",
      price: "129"),
  Shoes(
      name: "Nike joyride run",
      imageurl: "images/photo2.jpeg",
      like: "10k",
      price: "149")
];
