import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petfind/AdoptForm/ui/screen/add_home_pet.dart';
import 'package:petfind/Register/ui/screen/add_ine_photo.dart';
import 'package:petfind/AdoptForm/ui/screen/adopt_done.dart';
import 'package:petfind/Register/ui/screen/pet_adopt_form.dart';
import 'package:petfind/Home/ui/screen/detail_pet.dart';
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
import 'package:petfind/SolicitudState/ui/screen/accepted_solicitud.dart';
import 'package:petfind/SolicitudState/ui/screen/denied_solicitud.dart';
import 'package:petfind/SolicitudState/ui/screen/waiting_solicitud.dart';

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
      initialRoute: '/success',
      routes: {
        '/': (context) => Login(),
        '/register_page': (context) => CreateAccount(),
        '/success': (context) => const HomeView(),
        '/registerPet': (context) => const RegisterPetView(),
        '/registerPetData': (context) => const PetDataRegister(),
        '/petRegisterImage': (context) => const PetImageRegister(),
        '/petDescription': (context) => PetDescription(),
        '/petRegisterFinished': (context) => const PetFinishedView(),
        '/adoptDone': (context) => const PetFinishedAdoptView(),
        '/homeCatalog': (context) => const PetCatalogView(),
        '/homePetAdoptForm': (context) => const HomePetAdoptRegister(),
        '/acceptRequest': (context) => const  AcceptSolicitud(),
        '/deniedRequest': (context) => const DeniedSolicitud(),
        '/waitingRequest': (context) => const WaitingSolicitud(),
      },
    );
  }
}
