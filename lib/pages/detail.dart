import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String title;    
  final String subtitle; 
  final String imageUrl; 
  final String detail;

  DetailsPage(this.title, this.subtitle, this.imageUrl, this.detail);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details")), 
      body: Padding(
        padding: const EdgeInsets.all(20.0), 
        child: ListView(
          children: [
            Text(widget.title), 
            SizedBox(height: 20),
            Text(widget.subtitle), 
            SizedBox(height: 20),
            Image.network(widget.imageUrl), 
            SizedBox(height: 20),
            Text(widget.detail), 
          ],
        ),
      ),
    );
  }
}