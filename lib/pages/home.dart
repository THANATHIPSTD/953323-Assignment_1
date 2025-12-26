import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firstapp/pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),

      child: FutureBuilder(builder: (context, snapshot) {
      var data = json.decode(snapshot.data.toString()); 
      return ListView.builder(
        itemCount: data.length, 
        itemBuilder: (BuildContext context, int index) {
          return MyBox(
            data[index]['title'],
            data[index]['subtitle'],
            data[index]['image_url']
            ,data[index]['detail']
          ); 
        },
      );
    },
    future: DefaultAssetBundle.of(context).loadString('assets/mock.json'),
  ),
  );
  }
  
Widget MyBox(String title, String subtitle , String imgUrl , String detail) {

      return Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(15),
        height: 200,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 193, 7),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover,
            colorFilter : ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken)
          
          ),
        ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 25, color: Colors.white),),
              Text(subtitle, style: TextStyle(fontSize: 16 , color: Colors.white),),

              Spacer(),

              Align(alignment: Alignment.bottomRight, child: TextButton(onPressed:() {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => DetailsPage(title, subtitle, imgUrl, detail)),);
              }, child: Text("Read More", style: TextStyle(color: Colors.white ),)),)
            ],
          ),
      );
    }
}