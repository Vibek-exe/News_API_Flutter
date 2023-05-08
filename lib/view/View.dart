
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_api_flutter/model/Data.dart';
import 'package:get_api_flutter/view_model/News_ViewModel.dart';

class HomeView extends GetWidget<NewsViewModel>{
  final controller = Get.put(NewsViewModel());
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Brightness.dark,
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove Shadow From Toolbar corners
        title: Text("News API Fetch"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
                colors: [Colors.red,Colors.pink],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter
            ),
          ),
        ),

      ),
      body: FutureBuilder(
        future: controller.getData(),
        builder: (context,AsyncSnapshot snapshot){
          NewsModel? data = snapshot.data;
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: data!.articles!.length,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 220,
                        child: Image.network(data.articles![index].urlToImage.toString(),
                        fit: BoxFit.fill),
                      ),
                      Text(data.articles![index].title.toString(),style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      textDirection: TextDirection.ltr),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          padding: const EdgeInsets.all(0.0),
                          width: double.infinity,
                          height: 6.0,
                        ), //Container
                      ),
                      Text(data.articles![index].description.toString(),style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.green
                      ),
                      textDirection: TextDirection.ltr),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          padding: const EdgeInsets.all(0.0),
                          width: double.infinity,
                          height: 40.0,
                        ), //Container
                      ),

                    ],
                  );
                }
            );
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }

        },
      ),
    );
  }

}