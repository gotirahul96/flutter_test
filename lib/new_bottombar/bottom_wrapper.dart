import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/new_bottombar/screen1new.dart';
import 'package:testapp/new_bottombar/screen2new.dart';

class BottomWrapper extends StatefulWidget {
  const BottomWrapper({super.key});

  @override
  State<BottomWrapper> createState() => _BottomWrapperState();
}

class _BottomWrapperState extends State<BottomWrapper> {
  int _currentScreen = 0;

  List<GlobalKey<NavigatorState>> _list = [screen1NavKey, screen2NavKey];

  Future<bool> systemBackbuttonPressed() async {
    if (_list[_currentScreen].currentState!.canPop()) {
      _list[_currentScreen].currentState?.pop(
        _list[_currentScreen].currentContext,
      );
      return false;
    } else {
      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        // Handle back navigation
        if (didPop) {
          return;
        }
        final navigator = Navigator.of(context);
        bool value = await systemBackbuttonPressed();
        if (value) {
          navigator.pop(result);
        }
        //return await systemBackbuttonPressed();
      },

      child: Scaffold(
        body: IndexedStack(
          index: _currentScreen,
          children: [Screen1New(), Screen2New()],
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (a){
            setState(() {
              _currentScreen = a;
            });
          },
          selectedIndex: _currentScreen,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.notification_add),
              label: 'Screen 1',
            ),
            NavigationDestination(
              icon: Icon(Icons.notification_add),
              label: 'Screen 2',
            ),
          ],
        ),
      ),
    );
  }
}
