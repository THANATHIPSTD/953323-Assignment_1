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
      child: ListView(
        children: [
          Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                MyBox("What is Flutter?", 
                "Flutter is an open-source UI software development toolkit created by Google. It is used to develop",
                "https://d2ms8rpfqc4h24.cloudfront.net/flutter_sdk2_9578b31bc8.jpg"),
                SizedBox(height: 20,),
                MyBox("What is Dart?", 
                "Dart is a client-optimized programming language for apps on multiple platforms. It is developed by Google and is used to build mobile, desktop, server, and web applications.",
                "https://miro.medium.com/v2/resize:fit:2360/format:webp/1*wqpaGKmnZHFotkN-LQb6LQ.jpeg"),
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
            colorFilter : ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken)
          
          ),
        ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 25, color: Colors.white),),
              Text(description, style: TextStyle(fontSize: 16 , color: Colors.white),),

              Spacer(),

              Align(alignment: Alignment.bottomRight,child: TextButton(onPressed:() {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => const DetailPage()),
                );
              }, child: Text("Read More", style: TextStyle(color: Colors.white ),)),)
            ],
          ),
        
      );
    }
}