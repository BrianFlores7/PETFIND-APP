import 'package:flutter/material.dart';
import 'package:petfind/Home/ui/screen/detail_pet.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:petfind/model/pet_model.dart';
import 'package:petfind/model/pet_model_back.dart';

class CardCatalogPetFind extends StatelessWidget {
  const CardCatalogPetFind({
    Key? key,
    required this.listPets,
    required this.userId,
  }) : super(key: key);

  final PetBackModel? listPets;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPetView(pet: listPets, userId: userId,),
          ),
        );
      },
      child: Card(
        // Con esta propiedad modificamos la forma de nuestro card
        // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

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
            // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
            SizedBox(
              width: 80,
              height: 80,
              child: Image.network(listPets!.imageUrl, ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Text(
                    listPets!.name,
                    style:
                        TextStyle(fontSize: 25, color: ColorsViews.pink_word),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.pets,
                        size: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                          listPets!.race,
                        ),
                      ),
                      Icon(Icons.calendar_month),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          listPets!.birthdate,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 25.0),
                      child: Text(
                        "Gender: ${listPets!.gender}",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
