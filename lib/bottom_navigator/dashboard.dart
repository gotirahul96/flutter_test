import 'package:flutter/material.dart';
import 'package:testapp/bottom_navigator/screen1.dart';
import 'package:testapp/bottom_navigator/screen2.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentScreen = 0;
  final List<GlobalKey<NavigatorState>> navigatorKeys = [
    screen1NavigatorKey,
    screen2NavigatorKey,
  ];

  Future<bool> backButtonPressed() async {
    if (currentScreen >= navigatorKeys.length) {
      // Prevent out-of-range access
      return true;
    }
    if (navigatorKeys[currentScreen].currentState!.canPop()) {
      navigatorKeys[currentScreen].currentState!.pop(
        navigatorKeys[currentScreen].currentContext,
      );
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: backButtonPressed,
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: IndexedStack(
            index: currentScreen,
            children: [
              Screen1(
                onVoidCallback: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Scaffold(
                          backgroundColor: Colors.red,

                          appBar: AppBar(title: Text('Outside Navigator')),
                          body: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                  ).pushNamed('/detailPage');
                                },
                                child: Text('Outside Navigator'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              const Screen2(),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (a) {
            setState(() {
              currentScreen = a;
            });
          },
          selectedIndex: currentScreen,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.notifications_none),
              label: 'wishlist',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications),
              label: 'updates',
            ),
          ],
        ),
      ),
    );
  }
}
