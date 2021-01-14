import 'package:flutter/material.dart';
import 'model/Slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);
  Widget _imageColumn() {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(234, 242, 255, 1),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200))),
        child: Center(
          child: Container(
            height: 250,
            alignment: Alignment.center,
            margin: EdgeInsets.all(50),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Image(
                  image: AssetImage(slideList[index].ImageUrl),
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  slideList[index].Title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(85, 98, 169, 1.0)),
                )
              ],
            ),
          ),
        ));
  }

  Widget _textColumn() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 60, top: 20, right: 60),
      child: Text(
        slideList[index].Description,
        style: TextStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _fullWidget() {
    return Column(
      children: <Widget>[
        _imageColumn(),
//        SizedBox(height: 15,),
        _textColumn()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fullWidget();
  }
}
