import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  var price = TextEditingController();
  var amount = TextEditingController();
  var change = TextEditingController();
  double total = 0;
  double receive = 0;

  void calculateTotal() {
    setState(() {
      double p = double.tryParse(price.text) ?? 0; 
      double a = double.tryParse(amount.text) ?? 0;
      total = p * a;
    });
  }

  void calculateChange() {
    setState(() {
      double r = double.tryParse(change.text) ?? 0;
      if (r < total) {
        receive = 0;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Money is not enough "),
          backgroundColor: Colors.red,
        ));
      } else {
        receive = r - total;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Welcome to Thanathip Shop',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tidy',
                fontStyle: FontStyle.italic,
                color: Colors.blue,
                backgroundColor: Colors.pink),
          ),
        ),
        Container(
          child: Image.asset('images/moggle.png', width: 150, height: 150),
        ),
        Image.network(
            'https://media.tenor.com/_ImUhNRPsaYAAAAi/final-fantasy-xi-final-fantasy-11.gif',
            width: 150,
            height: 150),
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
    );
  }

  Widget priceTextField() {
    return Container(
      child: TextField(
        controller: price,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
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
          border: OutlineInputBorder(),
          labelText: 'amount ',
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget calculateButton() {
    return ElevatedButton(
        onPressed: calculateTotal, child: Text('Calculate Total'));
  }

  Widget showTotalText() {
    return Text('Total: $total Bath');
  }

  Widget receiveMoneyTextField() {
    return Container(
      child: TextField(
        controller: change,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'get money ',
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget changeCalculateButton() {
    return ElevatedButton(
        onPressed: calculateChange, child: Text('Calculate Change'));
  }

  Widget showChangeText() {
    return Text('Change: $receive Bath');
  }
}