import 'package:flutter/material.dart';

class Slide {
  String ImageUrl;
  String Title;
  String Description;

  Slide({
    @required this.ImageUrl,
    @required this.Title,
    @required this.Description,
});
}

final slideList = [
  Slide(
    ImageUrl: 'assets/images/tent_pymyix.png',
    Title: "Find campings\nnear you",
    Description: "Lorem ipsum dolor sit amet, conse\nctetur adipiscing elit, sed do\neiusmod tempor incididunt"
  ),
  Slide(
    ImageUrl: 'assets/images/sms_icon.png',
    Title: "Reserve directly\nfrom the phone",
    Description: "Lorem ipsum dolor sit amet, conse\nctetur adipiscing elit, sed do\neiusmod tempor incididunt"
  ),
  Slide(
    ImageUrl: 'assets/images/location-icon.png',
    Title: "Get directions to\nthe location",
    Description: "Lorem ipsum dolor sit amet, conse\nctetur adipiscing elit, sed do\neiusmod tempor incididunt"
  ),
];