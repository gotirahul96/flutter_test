import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> screen1NavKey = GlobalKey<NavigatorState>();

class Screen1New extends StatelessWidget {
  const Screen1New({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: screen1NavKey,
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context){
              if (settings.name == '/detailPage') {
                return Scaffold(
                  backgroundColor: Colors.yellow,
                appBar: AppBar(
                  title: Text('DetailScreen'),
                ),
                floatingActionButton: FloatingActionButton(onPressed: () => Navigator.of(context).pop(),
                child: Text('Back'),
                ),
                body: Column(
                  children: [
                    Text('DetailScreen')
                  ],
                ),
              );
              }
              return Scaffold(
                backgroundColor: Colors.red,
                appBar: AppBar(
                  title: Text('Screen 1'),
                ),
                floatingActionButton: FloatingActionButton(onPressed: (){
                 Navigator.of(context).pushNamed('/detailPage');

                },
                child: Text('Next'),
                ),
                body: Column(
                  children: [
                    Text('Screen 1')
                  ],
                ),
              );
          });
        },
      );
  }
}