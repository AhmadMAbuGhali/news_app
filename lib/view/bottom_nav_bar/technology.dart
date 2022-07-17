import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/model/new_model.dart';

class TechnologyPage extends GetWidget {
  NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: FutureBuilder(
        future: controller.getData("technology"),
        builder: (context, AsyncSnapshot snapshot) {
          Articles data = snapshot.data;
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: data.articles.length,
              itemBuilder:(context,int index){
                return Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: Image.network(data.articles[index].urlToImage.toString(),
                          fit: BoxFit.fill,),
                      ),
                      Text(data.articles[index].title,style: TextStyle(
                          fontSize: 22,
                          color: Colors.black
                      ),),
                      Text(data.articles[index].description ,style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                      ),),
                    ],
                  ),
                );
              },
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }

        },
      ),
    );
  }

}