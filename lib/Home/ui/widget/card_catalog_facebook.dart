import 'package:flutter/material.dart';
import 'package:petfind/Home/ui/screen/detail_pet.dart';
import 'package:petfind/colors/colors_views.dart';
import 'package:petfind/model/pet_facebook.dart';
import 'package:petfind/model/pet_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CardCatalogPetFindFacebook extends StatelessWidget {
  const CardCatalogPetFindFacebook({
    Key? key,
    required this.listPets,
  }) : super(key: key);

  final PetFacebookModel? listPets;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launchUrl(Uri.parse(listPets!.postUrl));
      },
      child: Card(
        // Con esta propiedad modificamos la forma de nuestro card
        // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

        // Con esta propiedad agregamos margen a nuestro Card
        // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
        margin: EdgeInsets.all(12),

        // Con esta propiedad agregamos elevación a nuestro card
        // La sombra que tiene el Card aumentará
        elevation: 10,

        // La propiedad child anida un widget en su interior
        // Usamos columna para ordenar un ListTile y una fila con botones
        child: Row(
          children: <Widget>[
            // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
            Container(
              margin: EdgeInsets.only(
                top: 10.0,
                bottom: 10,
                left: 10,
              ),
              height: 180.0,
              width: 180.0,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(listPets!.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    new BoxShadow(
                      //SOMBRA
                      color: Color(0xffA4A4A4),
                      offset: Offset(1.0, 5.0),
                      blurRadius: 3.0,
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Adopciones Tuxtla', style: TextStyle(fontSize: 20),),
                  Row(
                    children: [
                      Icon(
                        Icons.facebook,
                        color: Colors.blue,
                      ),
                      Text('Open in facebook')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
