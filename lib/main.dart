
import 'package:flutter/material.dart';
import 'package:new_json_project/textdata.dart';


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
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Json Sorting"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Title and Description",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                  ),
                ),
              ),
              ListView.builder(
                  physics: ScrollPhysics(),
                  itemCount: 9,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          title: Text('MACBOOK $index'),
                          subtitle: Text(
                              'this is the description of the macbook')),
                    );
                  }
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Images",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                      fontSize: 18
                ),
                ),
              ),
              Container(
                height: 100,
                child: ListView.builder(
                    physics: ScrollPhysics(),
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Image.network(
                          'https://i.dummyjson.com/data/products/7/3.jpg',),
                      );
                    }

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
