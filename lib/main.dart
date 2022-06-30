import 'package:flutter/material.dart';
import 'package:petfind/Home/ui/screen/home_main.dart';
import 'package:petfind/Login/ui/screen/login.dart';
import 'package:petfind/Register/ui/screen/sign_up.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Chau Philomene One',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/register_page': (context) => CreateAccount(),
        '/success': (context) => HomeView(),
      },
    );
  }
}