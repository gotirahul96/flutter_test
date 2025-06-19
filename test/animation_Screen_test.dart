import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/animation_Screen.dart';

void main() {
  testWidgets('animation Screen ...', (tester) async {
    
    await tester.pumpWidget(const MaterialApp(
      home: AnimationScreen(),
    ));
    var containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);
    //convert 
    var containerWidget = tester.widget<Container>(containerFinder);

    expect(containerWidget.constraints!.maxWidth, 0);

    expect((containerWidget.decoration as BoxDecoration).color, Colors.blue);
    expect((containerWidget.decoration as BoxDecoration).borderRadius, BorderRadius.zero);
    await tester.pumpAndSettle();
    
    
    containerFinder = find.byType(Container);
    //convert 
    containerWidget = tester.widget<Container>(containerFinder);

    expect(containerWidget.constraints!.maxWidth, 200);
    expect((containerWidget.decoration as BoxDecoration).color, Colors.green);
    expect((containerWidget.decoration as BoxDecoration).borderRadius, BorderRadius.circular(50.0));

  });
}