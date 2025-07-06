import 'package:flutter/material.dart';
import 'package:testapp/bottom_navigator/screen1.dart';


class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}
  final GlobalKey<NavigatorState> screen2NavigatorKey = GlobalKey<NavigatorState>();

class _Screen2State extends State<Screen2> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(onPressed: () { 
            //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Screen1()));
            
            //Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder: (context) => Screen1()));
           }, child: Text('Screen2'),),
        ],
      ),
    );
  }
}