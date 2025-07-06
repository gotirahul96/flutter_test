import 'package:flutter/material.dart';

class ScreenActual extends StatelessWidget {
  final VoidCallback onOpenFullScreen;

  const ScreenActual({super.key,required this.onOpenFullScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onOpenFullScreen,
      ),
      appBar: AppBar(title: Text('Screen 1')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/detailPage');
            },
            child: Text('Screen1 main Page'),
          ),
        ],
      ),
    );
  }
}
