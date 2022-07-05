import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petfind/Home/ui/screen/home_catalog.dart';
import 'package:petfind/Home/ui/screen/home_catalog.dart';
import 'package:petfind/Home/ui/screen/home_main.dart';
import 'package:petfind/Login/ui/screen/login.dart';
import 'package:petfind/Register/ui/screen/sign_up.dart';
import 'package:petfind/RegisterPet/ui/screen/pet_data_register.dart';
import 'package:petfind/RegisterPet/ui/screen/pet_description.dart';
import 'package:petfind/RegisterPet/ui/screen/pet_finished.dart';
import 'package:petfind/RegisterPet/ui/screen/pet_image.dart';
import 'package:petfind/RegisterPet/ui/screen/register_pet_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Chau Philomene One',
      ),
      initialRoute: '/homeCatalog',
      routes: {
        '/': (context) => Login(),
        '/register_page': (context) => CreateAccount(),
        '/success': (context) => const HomeView(),
        '/registerPet': (context) => const RegisterPetView(),
        '/registerPetData': (context) => const PetDataRegister(),
        '/petRegisterImage': (context) => const PetImageRegister(),
        '/petDescription': (context) => PetDescription(),
        '/petRegisterFinished': (context) => const PetFinishedView(),
        '/homeCatalog': (context) => const PetCatalogView(),
      },
    );
  }
}
