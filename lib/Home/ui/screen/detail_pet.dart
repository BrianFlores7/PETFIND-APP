import 'package:flutter/material.dart';
import 'package:petfind/Home/repository/pet_api.dart';
import 'package:petfind/Home/repository/pet_controller.dart';
import 'package:petfind/components/app_bar.dart';
import 'package:petfind/components/rounded_btn.dart';
import 'package:petfind/model/pet_model.dart';
import 'package:petfind/model/pet_model_back.dart';
import '../../../colors/colors_views.dart';

class DetailPetView extends StatefulWidget {
  final PetBackModel? pet;
  final String userId;
  const DetailPetView({Key? key, required this.pet, required this.userId})
      : super(key: key);

  @override
  State<DetailPetView> createState() => _DetailPetView();
}

class _DetailPetView extends State<DetailPetView> {
  int pagePosition = 0;
  PageController _pageController = PageController(initialPage: 0);
  var listPetController = ListPetController(ListPetRepository());

  @override
  Widget build(BuildContext context) {
    var pet = widget.pet!;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBarRegister(width),
                Expanded(
                  flex: 1,
                  child: Image.network(pet.imageUrl),
                ),
                Divider(
                  height: height * 0.02,
                ),
                Text(
                  pet.name,
                  style:
                      TextStyle(fontSize: 40, color: ColorsViews.pink_word),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.pets),
                    Text(pet.race),
                    Icon(Icons.calendar_month),
                    Text(pet.birthdate),
                    Text("Gender: ${pet.gender}"),
                    Icon(Icons.person),
                    // Text(pet.owner),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(height * 0.03),
                  child: Text(
                    pet.description,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                RoundedButton(
                    color: ColorsViews.pink_word,
                    btnText: 'Adopt',
                    onPressed: () async {
                      try {
                        await listPetController.adopt(pet, widget.userId);
                        Navigator.pushNamed(context, '/adoptDone',
                            arguments: pet);
                      } catch (e) {
                        print(e);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer _animatedContainer(int index) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      height: 4,
      width: pagePosition == index ? 20 : 12,
      decoration: BoxDecoration(
          color: pagePosition == index
              ? ColorsViews.bar_color_able
              : ColorsViews.bar_color_disable),
      margin: const EdgeInsets.only(
        right: 8,
      ),
    );
  }
}

class ContainerBoarding extends StatelessWidget {
  final String image;
  const ContainerBoarding({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          child: Column(
            children: [
              Image.network(image),
            ],
          ),
        ),
      ],
    );
  }
}
