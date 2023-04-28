import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'modal/Products.dart';


class TextPage extends StatefulWidget {


  @override
  TextPageState createState() => TextPageState();
}

class TextPageState extends State<TextPage> {
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
                  itemCount: items.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Expanded(child: Container(
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
                        ))
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

    ProductsModel user = ProductsModel.fromJson(valueMap); // here the error is coming

    ///final list = json.decode(jsondata);
    return user.products;
  }
}

