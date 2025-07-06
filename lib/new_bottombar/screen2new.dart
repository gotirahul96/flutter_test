import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> screen2NavKey = GlobalKey<NavigatorState>();

class Screen2New extends StatelessWidget {
  const Screen2New({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: screen2NavKey,
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context){
              if (settings.name == '/screen2detailPage') {
                return Scaffold(
                  backgroundColor: Colors.yellow,
                appBar: AppBar(
                  title: Text('screen 2DetailScreen'),
                ),
                floatingActionButton: FloatingActionButton(onPressed: () => Navigator.of(context).pop(),
                child: Text('Back'),
                ),
                body: Column(
                  children: [
                    Text('screeen 2 DetailScreen')
                  ],
                ),
              );
              }
              return Scaffold(
                backgroundColor: Colors.green,
                appBar: AppBar(
                  title: Text('Screen 2'),
                ),
                floatingActionButton: FloatingActionButton(onPressed: (){
                  Navigator.of(context).pushNamed('/screen2detailPage');
                },
                child: Text('Next'),
                ),
                body: Column(
                  children: [
                    Text('Screen 2---------')
                  ],
                ),
              );
          });
        },
      );
  }
}