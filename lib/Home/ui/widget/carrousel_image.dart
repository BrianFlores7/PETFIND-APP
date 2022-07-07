import 'package:flutter/material.dart';

SizedBox carrouselImage(width, height, listaImagenes) {
  int count = 0;
  int actual = 0;

  final PageController controller = PageController(initialPage: 0);
  controller.addListener(() {
    if (controller.page!.round() != actual) {
      actual = controller.page!.round();
    }
  });

  return SizedBox(
    height: height * 0.2,
    width: width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: height * 0.2,
          width: width,
          child: PageView.builder(
            controller: controller,
            itemCount: count,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        alignment: FractionalOffset.center,
                        image: NetworkImage(
                          listaImagenes[index],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}