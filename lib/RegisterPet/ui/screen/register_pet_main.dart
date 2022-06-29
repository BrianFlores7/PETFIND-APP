import 'package:flutter/material.dart';
import '../../../colors/colors_views.dart';

class RegisterPetView extends StatefulWidget {
  const RegisterPetView({Key? key}) : super(key: key);

  @override
  State<RegisterPetView> createState() => _RegisterPetView();
}

class _RegisterPetView extends State<RegisterPetView> {
  List<Map<String, String>> boardingData = [
    {
      'text':
          'Registering pets for adoption will allow you to reach a wide audience'
    },
    {'text': 'You will need documentation for you and your pet to register'},
    {
      'text':
          'Your pet will arrive at a safe place, through a responsible process'
    },
    {'text': "Are you ready? let's do the registration"},
  ];
  int pagePosition = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: EdgeInsets.only(top: height * 0.2),
                  child: SizedBox(
                    width: width * 0.5,
                    child: Image.asset('assets/LOGO_PETFIND.png'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) => {
                      setState(() {
                        pagePosition = value;
                      })
                    },
                    itemBuilder: (context, index) => ContainerBoarding(
                      text: boardingData[index]['text']!,
                    ),
                    itemCount: boardingData.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            boardingData.length,
                            (index) => _animatedContainer(index),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 120, bottom: 20),
                          child: _nextButton(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _nextButton() {
    return SizedBox(
      width: 270,
      height: 40,
      child: OutlinedButton(
        onPressed: () {
          if (pagePosition < (boardingData.length - 1)) {
            pagePosition += 1;
            setState(() {
              ContainerBoarding(
                text: boardingData[pagePosition]['text']!,
              );
            });
            _pageController.animateToPage(
              pagePosition,
              duration: const Duration(milliseconds: 450),
              curve: Curves.decelerate,
            );
          } else {
            Navigator.pushNamed(context, '/login');
          }
        },
        child: Text(
            pagePosition == (boardingData.length - 1)
                ? 'Continuar'
                : 'Siguiente',
            style: pagePosition == (boardingData.length - 1)
                ? TextStyle(color: Colors.white)
                : TextStyle(color: ColorsViews.grey_word)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (pagePosition == (boardingData.length - 1)) {
              return ColorsViews.pink_word;
            }
            return Colors.transparent;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.grey;
              }
              return Colors.transparent;
            },
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (_) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16));
            },
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
  final String text;
  const ContainerBoarding({
    Key? key,
    required this.text,
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
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: ColorsViews.grey_word, fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
