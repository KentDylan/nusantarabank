import 'package:flutter/material.dart';

class EMonetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EMoneyPage(),
    );
  }
}

class EMoneyPage extends StatefulWidget {
  @override
  _EMoneyPageState createState() => _EMoneyPageState();
}

class _EMoneyPageState extends State<EMoneyPage> {
  double emoneyBalance = 100.0; // Saldo awal e-money
  TextEditingController topupController = TextEditingController();

  void topupEMoney(double amount) {
    setState(() {
      emoneyBalance += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(32),
        child: Container(
          color: Colors.brown,
          child: Row(
            children: [
              SizedBox(width: 1, height: 1),
              Expanded(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'E',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(1, 1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        TextSpan(
                          text: '-Money',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(1, 1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Saldo E-Money Anda: \$${emoneyBalance.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: topupController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Jumlah Top Up',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                double amount = double.tryParse(topupController.text) ?? 0.0;
                if (amount > 0) {
                  topupEMoney(amount);
                  topupController.clear();
                }
              },
              child: Text('Top Up'),
            ),
          ],
        ),
      ),
    );
  }
}
