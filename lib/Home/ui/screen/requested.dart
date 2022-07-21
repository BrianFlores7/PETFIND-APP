import 'package:flutter/material.dart';
import 'package:petfind/Home/model/request_info.dart';
import 'package:petfind/Home/model/user_request.dart';
import 'package:petfind/Home/repository/pet_api.dart';
import 'package:petfind/Home/repository/pet_controller.dart';
import 'package:petfind/Home/ui/widget/catalog_from_petfind.dart';
import 'package:petfind/Home/ui/widget/pet_requested.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:petfind/components/app_bar.dart';
import 'package:petfind/model/pet_model.dart';

class PetRequested extends StatefulWidget {
  const PetRequested({Key? key}) : super(key: key);

  @override
  State<PetRequested> createState() => _PetRequestedViewState();
}

class _PetRequestedViewState extends State<PetRequested>
    with TickerProviderStateMixin {
  final List<Tab> listTabOptions = [];
  final List<ListView> listCardOptions = [];

  @override
  Widget build(BuildContext context) {
    String userId = ModalRoute.of(context)!.settings.arguments as String;
    var listPetController = ListPetController(ListPetRepository());

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: width,
          child: Column(
            children: [
              AppBarRegister(width),
              Expanded(
                child: FutureBuilder<List<RequestPetModelInfoWithOwner>>(
                  future: listPetController.fetchListRequested(userId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Error"),
                      );
                    }

                    return ListView.separated(
                        itemBuilder: (context, index) {
                          var listPets = snapshot.data?[index];
                          return Card(
                            // Con esta propiedad modificamos la forma de nuestro card
                            // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),

                            // Con esta propiedad agregamos margen a nuestro Card
                            // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
                            margin: EdgeInsets.all(15),

                            // Con esta propiedad agregamos elevación a nuestro card
                            // La sombra que tiene el Card aumentará
                            elevation: 10,

                            // La propiedad child anida un widget en su interior
                            // Usamos columna para ordenar un ListTile y una fila con botones
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        listPets!.nameInterested,
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: ColorsViews.pink_word),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.location_city,
                                          size: 15,
                                        ),
                                        Text(
                                          listPets.petToAdopt,
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/requestAccepted',
                                        arguments: listPets.contact,
                                      );
                                    },
                                    icon: Icon(
                                      Icons.check,
                                      size: 35,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.disabled_by_default,
                                      size: 35,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(thickness: 0.5, height: 0.5);
                        },
                        itemCount: snapshot.data?.length ?? 0);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildCallContainer(String title, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text("${title}")),
    );
  }
}
