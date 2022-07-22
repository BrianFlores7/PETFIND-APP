import 'package:flutter/material.dart';
import 'package:petfind/Home/model/user_request.dart';
import 'package:petfind/colors/colors_views.dart';

class CardPetRequested extends StatelessWidget {
  const CardPetRequested({
    Key? key,
    required this.listPets,
  }) : super(key: key);

  final RequestPetModel? listPets;

  @override
  Widget build(BuildContext context) {
    return Card(
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
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 100, left: 50),
                child: Text(
                  'Aqui iva list pets name',
                  style:
                      TextStyle(fontSize: 25, color: ColorsViews.pink_word),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55, right: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.location_city,
                      size: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        'Tuxtla',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check,
                size: 35,
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
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
  }
}
