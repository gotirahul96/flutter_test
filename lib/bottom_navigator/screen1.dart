import 'package:flutter/material.dart';
import 'package:testapp/bottom_navigator/screen1actual.dart';

class Screen1 extends StatefulWidget {

  final VoidCallback onVoidCallback;
  const Screen1({super.key,required this.onVoidCallback});

  @override
  State<Screen1> createState() => _Screen1State();
}
 GlobalKey<NavigatorState> screen1NavigatorKey = GlobalKey<NavigatorState>();

class _Screen1State extends State<Screen1> {


  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: screen1NavigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            if (settings.name == '/detailPage') {
              return Scaffold(
                
                appBar: AppBar(
                title: Text('Screen 1'),
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {}, child: Text('Detail Page')),
                  ],
                ),
              );
            }
            return ScreenActual(onOpenFullScreen: widget.onVoidCallback,);
          },
        );
      },
    );
  }
}
