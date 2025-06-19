// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testapp/counter/counter_cubit.dart';
import 'package:testapp/counter/counter_view.dart';
import 'package:testapp/sampleForTest/get_api_respository.dart';
import 'package:testapp/sampleForTest/user_model.dart';

class MockUserRepository extends Mock implements UserRepository {}


void main() {
  //Pretest
  late CounterCubit counterCubit;
  late MockUserRepository mockRepository;

  //Setup is called before every test is called
  //Setup -> test -> setup -> test
  setUp(() {
    mockRepository = MockUserRepository();
    counterCubit = CounterCubit(0);
    counterCubit.userModel = [
      UserModel(id: 1, name: 'Rahul', email: 'rahul@test.com'),
      UserModel(id: 2, name: 'John', email: 'john@test.com'),
    ];
  });
  // first setupAll is called then all test at once
  //setpUpAll -> test -> test -> test
  //setUpAll(() => null);

  //Testing
  //given when then

  group('Counter Class - ', () {
    test('testing the increment counter1 ', () {
      //declare a variable
      // final CounterCubit counterCubit = CounterCubit(0);
      //perform a task
      //perform a test
      expect(counterCubit.state, 0);
    });

    test('testing the increment counter2', () {
      //declare a variable
      //final CounterCubit counterCubit = CounterCubit(0);
      //perform a task
      counterCubit.increment();
      //perform a test
      expect(counterCubit.state, 1);
    });

    test('testing the Decremented counter2', () {
      //declare a variable
      //final CounterCubit counterCubit = CounterCubit(0);
      //perform a task
      counterCubit.decrement();
      var temp = counterCubit.state;
      //perform a test
      expect(temp, -1);
    });

    test('testing the reset counter', () {
      //declare a variable
      //final CounterCubit counterCubit = CounterCubit(0);
      //perform a task
      counterCubit.reset();
      var temp = counterCubit.state;
      //perform a test
      expect(temp, 0);
    });
  });

  //It should be in isolation
  //given when then
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    //To build a widget tree
    //Renders the ui what ever you pass in here it will build it for you and create a widget tree based on that.
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CounterCubit>(
          create: (_) => CounterCubit(0),
          child: CounterView(),
        ),
      ),
    );

    // Verify that our counter starts at 0.
    //findsNWidgets(2); - to find n no of widgets
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    
    // final incrementBtn = find.byType(FloatingActionButton);
    // await tester.tap(incrementBtn);
    // await tester.tap(incrementBtn);
    // await tester.tap(incrementBtn);
    //If set state is called in the ui you should call pump
    // await tester.pump();
    // expect(find.text('3'), findsOneWidget);
    // expect(find.text('0'), findsNothing);
    expect(find.byType(FloatingActionButton), findsNWidgets(3));
    expect(find.byType(AppBar), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
    await tester.tap(find.byKey(const Key('DECREMENT')));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });


  testWidgets('Displays List if users', (tester) async {
     // Stub the getUserData to return immediately with predefined users
    when(() => mockRepository.getUserData())
        .thenAnswer((_) async => counterCubit.userModel);

    final testCubit = CounterCubit(0);
    testCubit.userModel = await mockRepository.getUserData();
    
    //Pumps the widget
       await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CounterCubit>(
          create: (_) => testCubit,
          child: CounterView(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pump();
    CounterCubit(0).userModel = [UserModel(id: 1,name: 'Rahul',email: 'timepass.com')];
    
    //await tester.pump();
    //it will keep calling pump untill future is resolved

    await tester.pumpAndSettle();

    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Rahul'), findsOneWidget);
    expect(find.text('John'), findsOneWidget);
    


  });

  //Post Test
  //Tear down is called after every test
  // test -> testDown -> test -> testDown -> test -> testDown
  // tearDown(() => null);
  // test -> test -> test -> test -> testDownAll
  // tearDownAll(() => null);
}
