import 'package:flutter/material.dart';
import 'package:petfind/Home/repository/pet_api.dart';
import 'package:petfind/Home/repository/pet_controller.dart';
import 'package:petfind/Home/ui/widget/card_catalog_facebook.dart';
import 'package:petfind/Home/ui/widget/catalog_from_petfind.dart';
import 'package:petfind/components/app_bar.dart';
import 'package:petfind/model/pet_facebook.dart';
import 'package:petfind/model/pet_model.dart';

class PetCatalogView extends StatefulWidget {
  const PetCatalogView({Key? key}) : super(key: key);

  @override
  State<PetCatalogView> createState() => _PetCatalogViewState();
}

class _PetCatalogViewState extends State<PetCatalogView>
    with TickerProviderStateMixin {
  final List<Tab> listTabOptions = [];
  final List<ListView> listCardOptions = [];

  int count = 0;
  int actual = 0;
  final PageController controller = PageController(initialPage: 0);
  final List<String> listBarOptions = ['Adopt', 'More'];

  @override
  void initState() {
    super.initState();
    getOption();
    controller.addListener(() {
      if (controller.page!.round() != actual) {
        setState(() {
          actual = controller.page!.round();
        });
      }
    });

    setState(() {
      for (var element in listBarOptions) {
        listTabOptions.add(
          Tab(
            child: Text(
              element,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
        );
      }
    });
  }

  void getOption() async {
    setState(() {
      count = listBarOptions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: count, vsync: this);
    var listPetController = ListPetController(ListPetRepository());
    String userId = ModalRoute.of(context)!.settings.arguments as String;
    listPetController.fetchListPet();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Map<String, dynamic>>(
          future: listPetController.fetchListPet(),
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
            return SizedBox(
              width: width,
              child: Column(
                children: [
                  AppBarRegister(width),
                  TabBar(
                    controller: tabController,
                    isScrollable: true,
                    labelPadding: EdgeInsets.symmetric(horizontal: 30),
                    tabs: listTabOptions,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        ListView.separated(
                            itemBuilder: (context, index) {
                              var listPets =
                                  snapshot.data?["petFromApp"][index] ??
                                      Pet(
                                        "",
                                        "",
                                        "",
                                        "",
                                        "",
                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png",
                                        "",
                                      );
                              return Column(
                                children: [
                                  CardCatalogPetFind(listPets: listPets, userId: userId),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(thickness: 0.5, height: 0.5);
                            },
                            itemCount: snapshot.data?["petFromApp"].length ?? 0),
                        ListView.separated(
                            itemBuilder: (context, index) {
                              var listPetsFacebook =
                                  snapshot.data?["petFromFacebook"][index];
                              return Column(
                                children: [
                                  CardCatalogPetFindFacebook(
                                    listPets: listPetsFacebook ??
                                        PetFacebookModel(
                                          0,
                                          "",
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png",
                                          "",
                                        ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(thickness: 0.5, height: 0.5);
                            },
                            itemCount: snapshot.data?["petFromFacebook"].length ?? 0),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
