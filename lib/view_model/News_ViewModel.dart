
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_api_flutter/model/Data.dart';
import 'package:http/http.dart' as http;

class NewsViewModel extends GetxController{

  getData()async{
    const API_KEY = "dae2d319f96341f9b424d3b419cfd241";
    const country = "us"; // ae ar at au be bg br ca ch cn co cu cz de eg fr gb
    const category = "technology"; // business entertainment general health science sports technology
    final url = Uri.parse('https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$API_KEY');
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      try{
        return NewsModel.fromJson(jsonDecode(response.body));
      }
      catch(e){
        Get.snackbar('can not get Data', e.toString());
      }
    }

  }


}