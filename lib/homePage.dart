import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordpressiglesia/controllers/categories_controller.dart';
import 'package:wordpressiglesia/widget/newsCardWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<Widget> tabs = [];
  final CategoriesController categoriesController =
      Get.put(CategoriesController());
  @override
  void initState() {
    super.initState();
    /* tabs.add(tab("Tecnologia"));
    tabs.add(tab("Bussiness"));
    tabs.add(tab("Entretenimiento"));
    tabs.add(tab("Deportes"));
    tabs.add(tab("Salud"));*/
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Obx(() {
        if (categoriesController.isLoading.value)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          return DefaultTabController(
              length: categoriesController.categoriesList.length,
              child: Scaffold(
                appBar: AppBar(
                  title: Text("App de noticias"),
                  elevation: 0,
                  bottom: TabBar(
                    tabs: categoriesController.categoriesList
                        .map((model) => tab(model.name))
                        .toList(),
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.white,
                  ),
                  actions: <Widget>[
                    Icon(Icons.search, color: Colors.white),
                    SizedBox(width: 10),
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                    )
                  ],
                ),
                body: TabBarView(
                    children: categoriesController.categoriesList
                        .map((model) => NewsCardWidget())
                        .toList()),
              ));
      }),
    );
  }

  Widget tab(String tabName) {
    return Tab(
      text: tabName,
    );
  }
}
