import 'package:flutter/material.dart';

import 'mlh1.dart/blind.dart';
import 'mlh1.dart/home.dart';
import 'mlh1.dart/login.dart';

// import 'package:trial_space/passingArguments.dart';

// passing arguments
// mlh

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Testing space',
      // home: MyHomePage(),
      // routes: {
      //   '/': (context) => FirstPage(
      //         hex: const Color(0xff443a49),
      //       ),
      //   '/second': (context) => const SecondPage()
      // },
      routes: {
        '/': (context) => const PageOne(),
        '/home': (context) => const HomePage(),
        '/sign': (context) => const SignLanguage(),
        '/blind': (context) => const Blind(),
        '/deaf': (context) => const Deaf(),
        '/handicapped': (context) => const Handicapped(),
        '/music': (context) => const Music(),
      },
    );
  }
}

// auth0
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// import 'auth0/example.dart';

// void main() async {
//   await dotenv.load();

//   runApp(const ExampleApp());
// }
