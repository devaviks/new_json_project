import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'modal/Products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context,data){
            if(data.hasError){
              return Center(child: Text("${data.error}"));
            }else if(data.hasData){
              var items = data.data as List<Products>;
              return ListView.builder(
                  itemCount: items == null? 0: items.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image(image: NetworkImage(items[index].images.toString()),fit: BoxFit.fill,),
                                ),
                                Expanded(child: Container(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].title.toString(),style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                      ),),),
                                      Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].description.toString()),)
                                    ],
                                  ),
                                )),
                              ],
                            ),
                            Container(
                              height: 70,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: items[index].images!.length,
                                  itemBuilder: (context,i){
                                  return SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image(image: NetworkImage(items[index].images![i]),fit: BoxFit.fill),
                                  );
                                 }
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
              );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        )

    );
  }

  Future<List<Products>?> ReadJsonData() async{
    final jsondata = await rootBundle.rootBundle.loadString('assets/dummy.json');
    Map<String, dynamic> valueMap = json.decode(jsondata);
    ProductsModel user = ProductsModel.fromJson(valueMap);
    return user.products;
  }
}


