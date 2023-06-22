/*import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
// 3.
  CounterBloc() : super(0);
// 4.
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
// 'state' is a getter defined inside Bloc<E,S> which
// represents the current state of the bloc
      case CounterEvent.increment:
        yield state;
        break;
      case CounterEvent.decrement:
        yield state;
        break;
    }
  }
}
class CounterState extends Equatable {
  final int count;
  const CounterState(this.count);
  @override
  List<Object> get props => [count];
}
abstract class CounterEventtwo extends Equatable {
  const CounterEventtwo();
  @override
  List<Object> get props => [];
}
class Increment extends CounterEventtwo {
  const Increment();
}
class Decrement extends CounterEventtwo {
  const Decrement();
}

class CounterBloctwo extends Bloc<CounterEvent, CounterState> {
  CounterBloctwo() : super(const CounterState(0));
  @override
  Stream<CounterState> mapEventToState(CounterEventtwo event) async* {
    if (event is Increment) {
      final newCount = state.count + 1;
      yield CounterState(newCount);
    } else if (event is Decrement) {
      final newCount = state.count - 1;
      yield CounterState(newCount);
    }
  }
}
class DemoPagetwo extends StatelessWidget {
  const DemoPagetwo();
  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc, int>(
        listener: (context, state) {
         /* Flushbar(
            message: "The counter has been altered!",
            duration: Duration(seconds: 1),
          )..show(context);*/
          print("object");
        }
       // ,child: const ButtonsAndText(),

    );
  }
}
class ButtonsAndText extends StatelessWidget {
  const ButtonsAndText();
  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
        body: Center(
            child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceAround,
                children: [


                ]
            )
        )
    );
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

      ),
      debugShowCheckedModeBanner: false,

        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //home: const providerapp(),
       // home: const DemoPagetwo(),
     // home: const Blocproex(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}
class incrementer with ChangeNotifier{
  int _counter = 0;
  void _incrementCounter() {

      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      notifyListeners();

  }
}

class providerapp extends StatelessWidget {
  const providerapp();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => incrementer(),
      child: const DemoPage(),
    );
  }
}
class DemoPage extends StatelessWidget {
  const DemoPage();
  @override
  Widget build(BuildContext context) {
// The type of 'counter' is CounterModel
    final counter = Provider.of<incrementer>(context);
    return Scaffold(
        body: Center(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            child: const Text(
              "+1",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 25
              ),
            ),
            onPressed: () => counter._incrementCounter(),
          ),
          Text(
            "${counter._counter}",
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          TextButton(
            child: const Text(
              "-1",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 25
              ),
            ),
            onPressed: () => counter._incrementCounter(),
          ),
        ]
    ),
        )
    );
  }
}
class Blocproex extends StatelessWidget {
  const Blocproex();
  @override
  Widget build(BuildContext context) {
// Yes, provider is used internally by the bloc library
// to expose instance of blocs to the children widgets
    return BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: const DemoPagebloc()
    );
  }
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final String assetName = 'assets/all.svg';
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      /*appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      )*/
      body:
      Container(
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          /*gradient: new LinearGradient(
              colors: [const Color(0xFF3366FF), const Color(0xFF00CCFF)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
              stops: [0.0, 0.5],
              tileMode: TileMode.clamp)*/
          color: const Color(0xd0d3d5),
        ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(

            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Image.asset('assets/ethiotel.png'),
              Image.asset('assets/lock.png', height: 100, width: 100,),

              /*SvgPicture.asset(
      assetName,
      semanticsLabel: 'Acme Logo'
      ),*/
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,
              ),

              SizedBox(
                width: screenWidth / 2,
                child: TextField(

                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,

                        // borderRadius: BorderRadius.circular(10.0),
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),

                      ),

                      labelText: 'Enter Name',
                      //fillColor:const Color(0xFFFFFF) ,
                      fillColor: const Color(0xFFFFFF),
                      filled: true,
                      hintText: 'Enterr Your Name'

                  ),
                ),
              )
              ,
            ],
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
  class DemoPagebloc extends StatelessWidget {
  const DemoPagebloc();
  @override
  Widget build(BuildContext context) {
// For older versions of Dart that don't use extension
// methods, simply go for:
 final counterBloc = BlocProvider.of<CounterBloc>(context);
  //final counterBloc = context.watch()<CounterBloc>();
  return Scaffold(
  body: Center(
  child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
// FlatButtons and Text widget
    TextButton(
  child: const Text(
  "+1",
    style: TextStyle(
        color: Colors.green,
        fontSize: 25
    ),
  ),
    onPressed: () => counterBloc.add(CounterEvent.increment),
  ),
      BlocBuilder<CounterBloc, int>(
        builder: (context, count) =>
            Text(
              "$count",
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
      ),
      TextButton(
          child: const Text(
            "-1",
            style: TextStyle(
                color: Colors.red,
                fontSize: 25
            ),
          ),onPressed: () => counterBloc.add(CounterEvent.decrement),
      ),

  ]
  )
  )
  );
  }
  import 'package:flutter/material.dart';

  /// Flutter code sample for [RotationTransition].

  void main() => runApp(const RotationTransitionExampleApp());

  class RotationTransitionExampleApp extends StatelessWidget {
  const RotationTransitionExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
  return const MaterialApp(
  home: RotationTransitionExample(),
  );
  }
  }

  class RotationTransitionExample extends StatefulWidget {
  const RotationTransitionExample({super.key});

  @override
  State<RotationTransitionExample> createState() =>
  _RotationTransitionExampleState();
  }

  /// [AnimationController]s can be created with `vsync: this` because of
  /// [TickerProviderStateMixin].
  class _RotationTransitionExampleState extends State<RotationTransitionExample>
  with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
  duration: const Duration(seconds: 2),
  vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
  parent: _controller,
  curve: Curves.elasticOut,
  );

  @override
  void dispose() {
  _controller.dispose();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  body: Center(
  child: RotationTransition(
  turns: _animation,
  child: const Padding(
  padding: EdgeInsets.all(8.0),
  child: FlutterLogo(size: 150.0),
  ),
  ),
  ),
  );
  }
  }
  import 'package:flutter/material.dart';

  /// Flutter code sample for [RotationTransition].

  void main() => runApp(const RotationTransitionExampleApp());

  class RotationTransitionExampleApp extends StatelessWidget {
  const RotationTransitionExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
  return const MaterialApp(
  home: RotationTransitionExample(),
  );
  }
  }

  class RotationTransitionExample extends StatefulWidget {
  const RotationTransitionExample({super.key});

  @override
  State<RotationTransitionExample> createState() =>
  _RotationTransitionExampleState();
  }

  /// [AnimationController]s can be created with `vsync: this` because of
  /// [TickerProviderStateMixin].
  class _RotationTransitionExampleState extends State<RotationTransitionExample>
  with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
  duration: const Duration(seconds: 2),
  vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
  parent: _controller,
  curve: Curves.elasticOut,
  );

  @override
  void dispose() {
  _controller.dispose();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  body: Center(
  child: RotationTransition(
  turns: _animation,
  child: const Padding(
  padding: EdgeInsets.all(8.0),
  child: FlutterLogo(size: 150.0),
  ),
  ),
  ),
  );
  }
  }

  }*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
/// Flutter code sample for [AnimatedContainer].

/*void main() => runApp(

   // const AnimatedContainerExampleApp()
   // ExamplePage()
    const MyApp()
);*/
void main() {
  runApp(
      MaterialApp(
        home: const MyApp(),
      ),
  );
}


/*child: Center(
child: AnimatedContainer(
width: value.isselected ? 200.0 : 100.0,
height: value.isselected ? 100.0 : 200.0,
color: value.isselected ? Colors.red : Colors.blue,
/* alignment:
        value.selected ? Alignment.center : AlignmentDirectional.topCenter,*/
duration: const Duration(seconds: 2),
curve: Curves.elasticInOut,
child: //const FlutterLogo(size: 75),
//   SingleChildScrollView(
Column(
mainAxisSize: MainAxisSize.min,
mainAxisAlignment: MainAxisAlignment.center,
children:  [
FlutterLogo(size: 75),
Text("${value.currentCount}", textDirection: TextDirection.ltr,),
],
)
// )


),

)

);*/


class CounterModel with ChangeNotifier {
  int _counter = 0;
  bool selected=false;
  void increment() {
_counter++;
notifyListeners();
}
void decrement() {
  _counter--;
  notifyListeners();
}
  void change() {
    selected=!selected;
    notifyListeners();
  }
int get currentCount => _counter;
  bool get isselected => selected;

}
class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const DemoPage(),
    );
  }
}
class DemoPage extends StatelessWidget {
  const DemoPage();
  @override
  Widget build(BuildContext context) {
// The type of 'counter' is CounterModel
    final counter = Provider.of<CounterModel>(context);
    return Scaffold(
        body: Center(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           FLSpinner(),
          TextButton(
            child: const Text(
              "+1",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 25
              ),
            ),
            onPressed: () => counter.increment(),
          ),
          Text(
            "${counter.currentCount}",
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          TextButton(
            child: const Text(
              "-1",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 25
              ),
            ),
            onPressed: () => counter.change(),
          ),
        AnimatedContainer(
            width: counter.isselected ? 200.0 : 100.0,
            height: counter.isselected ? 100.0 : 200.0,
            color: counter.isselected ? Colors.red : Colors.blue,
/* alignment:
        value.selected ? Alignment.center : AlignmentDirectional.topCenter,*/
            duration: const Duration(seconds: 2),
            curve: Curves.elasticInOut,
          child:const FlutterLogo(size: 75),
        ),
          AnimatedPhysicalModel (
            duration: const Duration(seconds: 2),
            borderRadius: BorderRadius.circular(counter.isselected ? 5 : 60,),
            elevation: counter.isselected ? 200 : 100,
            shape: BoxShape.rectangle,
            color: Colors.lightBlue,
            shadowColor: Colors.black45,
            child: const Text("Hello"),
          ),

        ]
    )
    )
    );
  }
}
class RotatingLogo extends AnimatedWidget {
  final AnimationController _controller;
  const RotatingLogo({
    required AnimationController controller
  }) : _controller = controller, super(listenable: controller);
// (a).
  static const _fullRotation = 2 * math.pi;
  @override
  Widget build(BuildContext context) {
// (b).
    return Transform.rotate(
// (c).
        angle: _controller.value * _fullRotation,
        child: const FlutterLogo(
          size: 80,
        ),
    );
  }
}
class FLSpinner extends StatefulWidget {
  const FLSpinner();
  @override
  _FLSpinnerState createState() => _FLSpinnerState();
}
class _FLSpinnerState extends State<FLSpinner>
    with TickerProviderStateMixin {
// (a).
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
// (b).
      vsync: this,
    )..repeat(); // (c).
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RotatingLogo(controller: _controller);
  }
}