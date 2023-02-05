import 'package:flutter/material.dart';
import 'package:flutter_app/delimeters_calculator.dart';
import 'package:flutter_app/numbers_transformer.dart';
import 'package:flutter_app/string_utilities.dart';
import 'package:flutter_app/point.dart';
import 'package:flutter_app/user.dart';

void printHomework() {
  var a = 124;
  var b = -234;
  var c = '110111010101';
  var string = 'word 1 3 word 2 word 4321 21111 word';
  var wordsList = ['a', 'b', 'a', 'a', 'one', 'one', 'one', 'three', 'six'];
  var x = 3;
  var y = 0;
  var number = 27;

  var divider = '------------------';

  print('Домашняя работа №2.6');

  print(divider);
  print('Задание №1');

  var calculator = DelimetersCalculator();
  print('НОД($a, $b) = ${calculator.gcd(a, b)}');
  print('НОК($a, $b) = ${calculator.lcm(a, b)}');
  print('Простые множители $a = ${calculator.factors(a)}');

  print(divider);
  print('Задание №2');

  var transformer = NumbersTransformer();
  print('$a в двоичной системе = ${transformer.intToBinary(a)}');
  print('$c в десятичной системе = ${transformer.binaryToInt(c)}');

  print(divider);
  print('Задание №3');

  var utils = StringUtilities();
  print('Числа в строке "$string": ${utils.findNumsIn(string)}');

  print(divider);
  print('Задание №4');

  print('Вхождения слов в коллекцию: ${utils.findStringsIn(wordsList)}');

  print(divider);
  print('Задание №5');

  print('Цифры без повторений в коллекции: ${utils.findNumNamesIn(wordsList)}');

  print(divider);
  print('Задание №6');

  var point = Point(1, 2, 3);
  print('Расстояние между точками: ${point.distanceTo(Point(2, 3, 3))}');

  print(divider);
  print('Задание №7');

  try {
    print('Корень $x степени от числа $number: ${number.rootPower(x)}');
    print('Корень $y степени от числа $number:');
    print('${number.rootPower(y)}');
  } catch (e) {
    print(e);
  }

  print(divider);
  print('Задание №8');

  var userManager = UserManager<User>();

  final userA = User('a@a.ru');

  final userList = [
    User.empty(),
    userA,
    User('b@b.ru'),
    AdminUser.empty(),
    AdminUser('c@c.ru'),
    AdminUser('d@d.ru'),
    GeneralUser.empty(),
    GeneralUser('e@e.ru')
  ];

  userManager.add(userList);

  userManager.removeOne(userA);

  print('Список адресов эл. почты: ${userManager.getEmails()}');
}

extension on num {
  num mabs(num x) {
    return x < 0 ? -x : x;
  }

  num rootPower(num rootDegree) {
    if (rootDegree == 0) {
      throw ArgumentError('Нельзя определить корень нулевой степени');
    }

    num eps = 0.1; // Допустимая погрешность
    num root = this / rootDegree; // Начальное приближение корня
    num rn = this; // Значение корня последовательным делением

    while (mabs(root - rn) >= eps) {
      rn = this;

      for (int i = 1; i < rootDegree; i++) {
        rn = rn / root;
      }

      root = 0.5 * (rn + root);
    }

    return root;
  }
}
void main() {
  runApp(const MyApp());
  printHomework();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
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
