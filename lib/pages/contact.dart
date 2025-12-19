import 'package:flutter/material.dart';
import 'package:firstapp/pages/calc.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final items = List<String>.generate(20, (i) => "Item $i");
  final mydata = ["Apple", "Banana", "Papaya"];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
      ),
      body: ListView.builder(
        itemCount: items.length, 
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
              context,MaterialPageRoute(builder: (context) => const CalculatePage()),
              );
            },
            leading: const Icon(Icons.heart_broken),
            title: Text(items[index]), 
          );
        },
        // children: [
        //   ListTile(
        //     onTap: () {},
        //     leading: const Icon(Icons.map),
        //     title: Text(mydata[0]),
        //   ),
          
        //   const Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Text("Hello List tile"),
        //   ),
          
        //   const Icon(Icons.local_movies, size: 40),

        //   ListTile(
        //     onTap: () {},
        //     leading: const Icon(Icons.phone),
        //     title: Text(mydata[1]),
        //   ),

        //   ListTile(
        //     onTap: () {}, 
        //     leading: const FlutterLogo(),
        //     title: Text(mydata[2]),
        //     subtitle: const Text("Hello Chef"),
        //   ),
        // ],
      ),
    );
  }
}
