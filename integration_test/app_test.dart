import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testapp/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end to end test', () {
    testWidgets(
      'Verify login screen with correct username and password',
      (tester) async {
      //load the whole app
       await tester.pumpWidget(const app.MyApp());
       //make sure every thing is laoded
       await tester.pumpAndSettle();
       await tester.enterText(find.byKey(Key('user')), 'username');
       await tester.pump();
       await tester.enterText(find.byKey(Key('pass')), 'password');
       await tester.pump();
       await tester.tap(find.byKey(Key('loginButton')));
       await tester.pumpAndSettle();

       expect(find.byKey(Key('homeScreen')), findsOneWidget);
      },
    );
  });
}
