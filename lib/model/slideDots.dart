import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(bottom: 20, top: 20),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 150),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: isActive ? 12 : 8,
          width: isActive ? 12 : 8,
          decoration: BoxDecoration(
            //color: isActive ? Theme.of(context).primaryColor : Colors.grey,
            color: isActive ? Color.fromRGBO(69,90,207, 1.0) : Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }
}