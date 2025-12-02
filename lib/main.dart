import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 57, 29, 106)),
      ),
      home: const MyHomePage(title: 'Thanathip Shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var price = TextEditingController();
  var amount = TextEditingController();
  var change = TextEditingController();
  double total = 0;
  double receive = 0;

  void calculateTotal() {
    setState(() {
      double p = double.parse(price.text);
      double a = double.parse(amount.text);
      total = p * a;
    });
  }

  void calculateChange() {
    setState(() {
      double r = double.tryParse(change.text) ?? 0;

      if (r < total) {
        receive = 0; 
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Money is not enough "),
            backgroundColor: Colors.red,
          )
        );
      } else {
        receive = r - total;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Welcome to Thanathip Shop',
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
                fontFamily: 'Tidy',
                fontStyle: FontStyle.italic,
                color: Colors.blue,
                backgroundColor: Colors.pink
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Image.asset('images/moggle.png', width: 300, height: 300),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: priceTextField(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: amountTextField(),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: calculateButton(),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: showTotalText(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.all(10.0),
              child: receiveMoneyTextField(),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: changeCalculateButton(),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: showChangeText(),
            ),
          ],
        ),
      ),
    );
  }


Widget priceTextField() {
  return Container(
    child: TextField(
      controller: price,
      decoration: InputDecoration(
        border: OutlineInputBorder(
        ),
        labelText: 'price per item ',
      ),
      keyboardType: TextInputType.number,
    ),
  );
}

Widget amountTextField() {
  return Container(
    child: TextField(
      controller: amount,
      decoration: InputDecoration(
        border: OutlineInputBorder(
        ),
        labelText: 'amount ',
      ),
      keyboardType: TextInputType.number,
    ),
  );
}

Widget calculateButton() {
  return ElevatedButton(onPressed: calculateTotal, child: Text('Calculate Total'));
}

Widget showTotalText() {
  return Text('Total: $total Bath');
}



Widget receiveMoneyTextField() {
  return Container(
    child: TextField(
      controller: change,
      decoration: InputDecoration(
        border: OutlineInputBorder(
        ),
        labelText: 'get money ',
      ),
      keyboardType: TextInputType.number,
    ),
  );
}

Widget changeCalculateButton() {
  return ElevatedButton(onPressed: calculateChange, child: Text('Calculate Change'));
}

Widget showChangeText() {
  return Text('Change: $receive Bath');
}
}