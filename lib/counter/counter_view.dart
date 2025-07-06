// COUNTER VIEW - responsible for UI
// user BlocBuilder 
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/counter/counter_cubit.dart';

mixin getOne{
   
   void fly(){
    print('flyyyyy');
   }
}

mixin getTwo{

  void swim(){
    print('swim');
  }
}



class CounterView extends StatefulWidget with getOne,getTwo{
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> with WidgetsBindingObserver{
  

  static const platform = MethodChannel('samples.flutter.dev/battery');

  String mixin = """In Dart a mixin is a way to share reusable code across multiple classes without using traditional inheritance. 
                    Mixins let you “mix in” methods, getters, setters and fields into a class.""";
  
//   Key points

// A mixin is declared with the mixin keyword (or as a class intended for mixing in)

// You apply it to a class by listing it after with

// You can mix in multiple mixins separated by commas

// Mixins cannot have constructors

// mixin Flying {
//   void fly() {
//     print('I am flying');
//   }
// }

// mixin Swimming {
//   void swim() {
//     print('I am swimming');
//   }
// }

// // A class that can both fly and swim
// class Duck with Flying, Swimming {
//   void quack() {
//     print('Quack');
//   }
// }

// void main() {
//   final d = Duck();
//   d.quack();   // Quack
//   d.fly();     // I am flying
//   d.swim();    // I am swimming
// }

//What is static?
//The static keyword means that a variable or method belongs to the class itself, 
//not to individual objects created from the class.
 
  //******************************************************** */
 //implements
 //When a class implements another class or interface,
 //it agrees to provide concrete definitions for all the methods and properties declared in that class/interface.

  //******************************************************** */

//   An abstract class in Dart is a class that:

// Can’t be instantiated directly

// May declare abstract methods (without implementation) that must be overridden by subclasses

// Can include fully implemented methods and fields to share common behavior


// abstract class Animal {
//   // An abstract method—no body provided
//   void makeSound();

//   // A regular method that subclasses inherit
//   void breathe() {
//     print('Inhale… exhale…');
//   }
// }

// class Dog extends Animal {
//   // Must provide an implementation for makeSound()
//   @override
//   void makeSound() {
//     print('Woof!');
//   }
// }

// void main() {
//   // Animal a = Animal(); // Error: Abstract classes can’t be instantiated
//   final dog = Dog();
//   dog.breathe();    // Inhale… exhale…
//   dog.makeSound();  // Woof!
// }


// To define a common interface plus shared code

// When you want to force subclasses to implement certain methods

// If you need constructors, since mixins can’t have them

//************************************************************ */

//In Dart a constructor is a special method that’s invoked when you create a new instance of a class. 
//Its job is to initialize fields and perform any setup your object needs.

//************************************************************ */

// A factory constructor in Dart is a special constructor that controls instance creation. 
//Unlike a generative constructor (the normal kind that always returns a new instance of its class), a factory constructor can:

// Return an existing instance (for caching or singletons)

// Return an instance of a subtype

// Perform asynchronous or complex initialization before handing back an object

// class MyClass {
//   final String name;

//   // A private generative constructor for real instantiation
//   MyClass._internal(this.name);

//   // The factory constructor
//   factory MyClass(String name) {
//     // you can run logic here and then return an instance
//     return MyClass._internal(name.toUpperCase());
//   }
// }

//************************************************************ */

// In Flutter (and Dart) your code runs on a single UI thread by default. 
//To do true parallel work you use isolates—separate Dart VM instances that don’t share memory. Here’s how to work with them:

// Single-threaded async vs. isolates
// • All widget build and event-handling happens on the main thread (UI thread).
// • Asynchronous I/O or timers won’t block UI, but CPU-heavy loops will.
// • To offload CPU work you spin up an isolate.

// The compute helper
// Flutter gives you a simple API for isolates:

// import 'package:flutter/foundation.dart';

// // A top-level or static function
// int expensiveCalculation(int input) {
//   // simulate heavy work
//   return List.generate(1000000, (i) => i).reduce((a, b) => a + b) + input;
// }

// // On your widget
// Future<void> doWork() async {
//   final result = await compute(expensiveCalculation, 42);
//   print('Result: $result');
// }
// • compute spins up a worker isolate, runs your function, returns the result.
// • Great for simple one-off tasks.

//that's when we used workmanager.


//************************************************************ */

// In Flutter a context is an object of type BuildContext that represents where a widget lives in the widget tree.
// It’s the handle you use to look “up” or “down” the tree for things like themes, navigation, inherited widgets and more.

// Key points

// Location marker
// Every widget gets its own BuildContext when Flutter inserts it into the tree. Think of it as the widget’s address.

// Access to inherited data
// You can do things like

// ThemeData theme = Theme.of(context);
// MediaQueryData mq = MediaQuery.of(context);
// to pull shared data from ancestor widgets.

//************************************************************ */
//An InheritedWidget is simply a way to share data with all of its descendant widgets without having to pass that 
//data through every constructor. 
//Think of it as a special container high in the tree that any child can tap into. When the shared data changes,
// only those children that asked for it rebuild.
//************************************************************ */


// 1. Dart Language and Flutter Basics
// 1. What are the main features of Dart that make it suitable for Flutter?

// Ahead-of-Time compilation into native ARM code for fast startup

// Just-in-Time compilation during development for hot-reload productivity

// Sound null safety to eliminate a whole class of runtime errors

// Single-threaded event loop plus async/await makes UI work and I/O safe and easy

// 2. Explain the difference between const and final in Dart.

// final means a variable can be set only once and is initialized at runtime

// const means compile-time constant; it implies final and allows Flutter to canonicalize and reuse identical instances

// 3. How does Flutter render widgets to the screen—what is the widget → element → render object pipeline?

// Widget is a lightweight immutable description of part of the UI

// Element is the instantiation of a widget in the tree; it holds state and links parent/child

// RenderObject is the box model object that does layout, painting and hit-testing

// On rebuild Flutter diffs widgets, updates elements, and triggers layout/paint on render objects

// 2. Widget Architecture
// 4. What is the difference between a StatelessWidget and a StatefulWidget?

// StatelessWidget never changes once built

// StatefulWidget delegates to a State object that can call setState to trigger rebuilds

// 5. How do you break a large UI into smaller, reusable widgets?

// Identify self-contained pieces of UI that have their own data or layout

// Extract them into either StatelessWidget (if no internal mutable state) or StatefulWidget

// Pass required parameters via constructor to keep widgets decoupled

// 6. When and why would you use an InheritedWidget?

// To efficiently propagate data down the tree without passing it through every constructor

// Useful for theme data, localization, or any data many descendants need

// 3. State Management
// 7. Compare the basic approaches to managing state (setState, Provider, Riverpod, Bloc).

// setState: simple local state in a StatefulWidget

// Provider: uses InheritedWidget under the hood; easy for app-wide or scoped state

// Riverpod: compiler-safe providers, no context required, easy to test

// Bloc: enforces separation via events and states; good for complex flows

// 8. What are the pros and cons of lifting state up versus using a global state solution?

// Lifting up keeps state local and makes dependencies explicit

// Global can simplify access but risks over-rebuild and hidden dependencies

// 9. How does the ConsumerWidget in Riverpod differ from the Consumer in Provider?

// ConsumerWidget is a widget that gets a WidgetRef in its build, so no nested builders

// Consumer is a widget wrapper in Provider that gives you access to watch inside a builder

// 4. Layout and Styling
// 10. How do Expanded, Flexible and Spacer differ when building responsive layouts?

// Expanded forces its child to fill the available space

// Flexible lets its child have the flexibility to grow but respects its intrinsic size

// Spacer is shorthand for Expanded(child: SizedBox.shrink()) to create empty flexible space

// 11. Explain how MediaQuery and LayoutBuilder help build adaptive UIs.

// MediaQuery gives screen dimensions, orientation, padding etc. so you can size widgets accordingly

// LayoutBuilder gives the parent’s constraints at build time, letting children adapt to available space

// 5. Navigation and Routing
// 12. What are the different ways to navigate between screens in Flutter?

// Navigator.push and pop for imperative routes

// Named routes configured in MaterialApp

// Router API (Navigator 2.0) for declarative and deep-linking scenarios

// 13. How do you pass data back from a pushed route?

// Use Navigator.push<T>(…) which returns a Future<T>

// In the pushed screen call Navigator.pop(context, result)

// Await the future in the caller to receive result

// 6. Asynchronous Programming
// 14. How do futures, streams and async/await work in Dart?

// Future<T> represents a single asynchronous result or error

// Stream<T> represents a sequence of asynchronous events

// async/await let you write asynchronous code in a linear, readable style

// 15. When would you use compute versus spawning your own Isolate?

// Use compute for simple one-off CPU-heavy tasks

// Spawn a custom Isolate when you need persistent background work or bi-directional messaging

// 7. Platform Integration
// 16. How do you call platform-specific code (Swift/Kotlin) from Flutter?

// Define a MethodChannel with a name string

// On Dart side call invokeMethod

// On native side register a handler on the same channel name

// 17. What is the purpose of a MethodChannel versus an EventChannel?

// MethodChannel is for request-response calls

// EventChannel is for continuous streams of data from native to Dart

// 8. Performance and Testing
// 18. What are common causes of jank and how do you diagnose them?

// Blocking the UI thread with heavy computations

// Layout/paint costs from deep or overly complex trees

// Diagnose with DevTools CPU and memory profilers and Widget rebuild counts

// 19. How do you write a widget test versus an integration test?

// Widget test uses WidgetTester to pump widgets in isolation and assert on their state

// Integration test drives the real app on a device or emulator using flutter_driver or integration_test and interacts with UI



/*************************************** */

// flutter test                      # Run unit/widget tests
// flutter drive                     # Run integration tests
// flutter test --coverage  

/*************************************** */

//Use final for “set-once” values you discover while the app is running

//Use const for “permanently fixed” values the compiler knows up front—and Dart will even share them rather than duplicating them in memory


/*************************************** */

// Here are some key ways Flutter can have an edge over React Native:

// True native compilation
// Flutter’s Dart code is AOT-compiled to native ARM or x64 binaries, so there’s no JavaScript bridge layer at runtime.
// That typically means smoother 60fps animations and lower jank under load.

// Consistent rendering with its own engine
// Flutter draws every pixel via its own Skia engine. Your UI looks identical across Android and iOS, down to custom controls and animations,
// without relying on platform widgets that may differ in behavior.

// Rich, composable widget library
// Everything in Flutter is a widget—from layout models to buttons to app bars—and they’re all designed to work together. 
//You get tight control over every pixel, and it’s easy to create highly customized, branded experiences.

// Single language end to end
// With React Native you typically write in JavaScript or TypeScript and drop into Objective-C/Java/Kotlin for anything 
//that needs bridging. Flutter lets you stay in Dart for UI, business logic and plug-in code, reducing cognitive overhead and context switching.

// Hot reload that really sticks
// Both frameworks offer hot reload, but Flutter’s tends to preserve more state when you tweak UI or logic. 
//You see your changes immediately without rebuilding entire screens or losing local widget state.

// Granular control over performance
// Flutter gives you direct access to frame rendering, shader effects, custom RenderObjects and even low-level scrolling via slivers.
// That makes it simpler to diagnose and eliminate frame drops or memory spikes.

   @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      // app is minimised or backgrounded
      
    }
    if (state == AppLifecycleState.resumed) {
      // app has come back to foreground
      
    }
  }

  
  late CounterCubit counterCubit;



  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
    
    counterCubit = context.read<CounterCubit>();
    counterCubit.getUserData();
    _getBatteryLevel();
  }
  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CounterView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    
    super.dispose();
  }


  // Get battery level.
String _batteryLevel = 'Unknown battery level.';

Future<void> _getBatteryLevel() async {
  String batteryLevel;
  try {
    final result = await platform.invokeMethod<int>('getBatteryLevel');
    batteryLevel = 'Battery level at $result % .';
  } on PlatformException catch (e) {
    batteryLevel = "Failed to get battery level: '${e.message}'.";
  }
  
  setState(() {
    _batteryLevel = batteryLevel;
  });
}

 
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.red,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('Users',style: TextStyle(color: Colors.white)),
            centerTitle: true,
          ),
          body: BlocBuilder<CounterCubit,int>(builder: (context,state){
            if (state == 5) {
              return CircularProgressIndicator();
            }
            return Center(child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('This is the battery level - $_batteryLevel'),
                  Text(state.toString(),style: TextStyle(fontSize: 20)),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: context.read<CounterCubit>().userModel.length,
                      itemBuilder: (context,index){
                        final data = context.read<CounterCubit>().userModel[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.name ?? '',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                              Text(data.address?.city ?? '')
                            ],
                          ),
                        );
                      }),
                  )
                ],
              ),
            ));
          }),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(onPressed: () => context.read<CounterCubit>().increment(),
              child: Icon(Icons.add),
              ),
              const SizedBox(height: 20),
              FloatingActionButton(
                key: const Key('DECREMENT'),
                onPressed: () => context.read<CounterCubit>().decrement(),
              child: Icon(Icons.cancel),
              ),
              FloatingActionButton(onPressed: () {},
              child: Icon(Icons.cancel),
              )
            ],
          ),
        ),
      ),
    );
  }
}