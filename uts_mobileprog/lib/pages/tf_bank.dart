import 'package:flutter/material.dart';
import 'package:uts_mobileprog/pages/account.dart';
import 'package:uts_mobileprog/pages/home_page.dart';
import 'package:uts_mobileprog/pages/qrcode.dart';

class TransferBankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransferBankPageScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TransferBankPageScreen extends StatefulWidget {
  @override
  _TransferBankPageScreenState createState() => _TransferBankPageScreenState();
}

class _TransferBankPageScreenState extends State<TransferBankPageScreen> {
  int _currentIndex = 0;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController newController = TextEditingController();

  List<String> bankList = [
    'BCA',
    'MANDIRI',
    'BRI',
    'BNI',
    'BANK LAIN',
  ];
  String selectedBank = 'BCA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(95),
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
                          text: 'TRAN',
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
                          text: 'SFER',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pilih Bank:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: selectedBank,
              onChanged: (String? newValue) {
                setState(() {
                  selectedBank = newValue!;
                });
              },
              items: bankList.map((String bank) {
                return DropdownMenuItem<String>(
                  value: bank,
                  child: Text(bank),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Text(
              'Masukkan Nomor rekening:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '081234567890',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Masukan Nominal:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: newController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: '10000',
              ),
            ),
            SizedBox(height: 46),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => TransferBankPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.brown[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 17,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '                          TRANSFER                         ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QrCodePage(),
                ),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountNav(),
                ),
              );
            }
          });
        },
        backgroundColor: Colors.brown,
        iconSize: 50,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 9),
              child: Icon(Icons.home, color: Colors.grey),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 9),
              child: Icon(Icons.qr_code, color: Colors.grey),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 9),
              child: Icon(Icons.account_circle, color: Colors.grey),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    newController.dispose();
    super.dispose();
  }
}
