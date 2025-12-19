import 'package:flutter/material.dart';

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
      child: ListView(
        children: [
          Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                MyBox("What is Flutter?", 
                "Flutter is an open-source UI software development toolkit created by Google. It is used to develop",
                "https://fluttergems.dev/media-cards/mesh.png"),
                SizedBox(height: 20,),
                MyBox("What is Dart?", 
                "Dart is a client-optimized programming language for apps on multiple platforms. It is developed by Google and is used to build mobile, desktop, server, and web applications.",
                "https://www.shutterstock.com/image-vector/light-green-white-background-aesthetic-600nw-2626553197.jpg"),
                SizedBox(height: 20,),
                MyBox("What is Computer?", 
                "A computer is a machine that can be instructed to carry out sequences of arithmetic or logical operations automatically via computer programming.",
                "https://www.simslifecycle.com/wp-content/uploads/sites/2/2022/01/Electronic-Numerical-Integrator-And-Computer.png"),
              ],
            ),
          ),
        ]
      ),
    );

  }
  
Widget MyBox(String title, String description , String imgUrl) {

      return Container(
        padding: EdgeInsets.all(15),
        height: 200,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 193, 7),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover,
          
          ),
        ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 25, color: Colors.white),),
              Text(description, style: TextStyle(fontSize: 16 , color: Colors.white),),
            ],
          ),
        
      );
    }
}