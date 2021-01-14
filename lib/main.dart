import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miui/model/Slide.dart';
import 'package:miui/model/slideDots.dart';
import 'dart:async';
import 'package:miui/slideItem.dart';

//void main() {
//  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//      .then((_) {
//    runApp(MyApp());
//  });
//}

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter UI',
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600],

          // Define the default font family.
          fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPage = 0;
  final PageController _pgCtrl = PageController(
      initialPage: 0
  );

//  @override
//  void initState() {
//    super.initState();
//    Timer.periodic(Duration(seconds: 5), (Timer timer) {
//      if (_currentPage < 2) {
//        _currentPage++;
//      } else {
//        _currentPage = 0;
//      }
//      _pgCtrl.animateToPage(_currentPage, duration: Duration(milliseconds: 300),
//          curve: Curves.easeIn);
//    });
//  }

  @override
  void Dispose() {
    super.dispose();
    _pgCtrl.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pgCtrl,
                onPageChanged: _onPageChanged,
                itemBuilder: (ctx, i) => SlideItem(i),
                itemCount: slideList.length,),
            ),
            SizedBox(height: 20,),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 35),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for(int i = 0; i<slideList.length; i++)
                        if( i == _currentPage )
                          SlideDots(true)
                        else
                          SlideDots(false)
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _skipButton(),
                  SizedBox(width: 30,),
                  _nextButton()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _skipButton() {
    return Container(
      width: 100,
      height: 40,
      padding: EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
//        boxShadow: <BoxShadow>[
//          BoxShadow(
//              color: Colors.grey.shade200,
//              offset: Offset(2, 4),
//              blurRadius: 5,
//              spreadRadius: 2)
//        ],
          color: Colors.grey.shade300),
      child: Text(
        'skip',
        style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
      ),
    );
  }

  Widget _nextButton() {
    return GestureDetector(
      onTap: () {
        if (_currentPage < 2) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pgCtrl.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn);
      },
      child: Container(
        width: 100,
        height: 40,
        padding: EdgeInsets.symmetric(vertical: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
//        boxShadow: <BoxShadow>[
//          BoxShadow(
//              color: Colors.grey.shade200,
//              offset: Offset(2, 4),
//              blurRadius: 5,
//              spreadRadius: 2)
//        ],
            color: Color.fromRGBO(69,90,207, 1.0)
        ),
        child: Text(
          'next',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}