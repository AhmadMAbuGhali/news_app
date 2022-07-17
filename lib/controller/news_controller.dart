import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/new_model.dart';

class NewsController extends GetxController{
RxInt currentIndex = 0.obs;
   getData(String category) async{
     final url= Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=a7553d2c3bd445a581be5071ece9dd20");
  
     
     http.Response response =await http.get(url);
     if(response.statusCode ==200){
       try{
         return Articles.fromJson(jsonDecode(response.body));
       }catch(e){
            Get.snackbar("error", e.toString());
       }
     }

}
}