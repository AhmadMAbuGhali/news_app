import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/model/new_model.dart';
import 'package:news_app/view/bottom_nav_bar/health.dart';
import 'package:news_app/view/bottom_nav_bar/sports.dart';
import 'package:news_app/view/bottom_nav_bar/technology.dart';

class HomePage extends GetWidget {
  NewsController controller = Get.put(NewsController());
  List<Widget> screen = [
    SportPage(),
    HealthPage(),
    TechnologyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        bottomNavigationBar: GetX<NewsController>(
          builder: (controller) => BottomNavigationBar(
            selectedItemColor: Colors.orange,
            currentIndex: controller.currentIndex.value,
            onTap: (val) {
              controller.currentIndex.value = val;
            },
            items: [
              BottomNavigationBarItem(label: "Sport", icon: Icon(Icons.sports)),
              BottomNavigationBarItem(
                  label: "health", icon: Icon(Icons.health_and_safety)),
              BottomNavigationBarItem(
                  label: "technology",
                  icon: Icon(Icons.mobile_friendly_rounded)),
            ],
          ),
        ),
    body: GetX<NewsController>(builder: (controller)=>screen[controller.currentIndex.value],),);
  }
}
