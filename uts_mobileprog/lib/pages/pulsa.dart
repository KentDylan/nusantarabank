import 'package:flutter/material.dart';
import 'package:uts_mobileprog/pages/account.dart';
import 'package:uts_mobileprog/pages/home_page.dart';
import 'package:uts_mobileprog/pages/pembelian.dart';
import 'package:uts_mobileprog/pages/qrcode.dart';
import 'package:awesome_dialog/awesome_dialog.dart'; // Tambahkan package Awesome Dialog

class Pulsa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PulsaPage(),
    );
  }
}

class PulsaPage extends StatefulWidget {
  @override
  _PulsaPageState createState() => _PulsaPageState();
}

class _PulsaPageState extends State<PulsaPage> {
  int _currentIndex = 0;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nominalController = TextEditingController();

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
                          text: 'PUL',
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
                          text: 'SA',
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
              'Masukkan Nomor Telepon:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Contoh: 081234567890',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Masukkan Nominal Pembelian:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: nominalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Contoh: 50000',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
    // Check if the text fields are empty
    if (phoneNumberController.text.isEmpty || nominalController.text.isEmpty) {
  // Show a custom AlertDialog with a brown background
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.brown, // Set the background color to brown
        title: Text('WARNING', style: TextStyle(color: Colors.white)), // Set text color to white
        content: Text(
          'Tolong isi Nomor Telepon dan Nominal Pembelian',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK', style: TextStyle(color: Colors.white)), // Set text color to white
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
} else {
      // Clear the TextField values
      phoneNumberController.clear();
      nominalController.clear();

      showDialog(
  context: context,
  builder: (BuildContext context) {
    String password = ''; // Initialize an empty password variable

    return AlertDialog(
      backgroundColor: Colors.brown, // Set the background color to brown
      title: Text('Enter PIN', style: TextStyle(color: Colors.white)), // Set text color to white
      content: TextField(
        obscureText: true, // Mask the input text for password
        style: TextStyle(color: Colors.white), // Set text color to white
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)), // Set hint text color to white with opacity
        ),
        onChanged: (value) {
          // Update the password variable when the text field value changes
          password = value;
        },
      ),
      actions: <Widget>[
        TextButton(
          child: Text('OK', style: TextStyle(color: Colors.white)), // Set text color to white
          onPressed: () {
            // Validate the password here, and perform actions accordingly
            if (password == '123456') {
              // Password is correct, perform your desired action
              // Show the awesome dialog
              showAwesomeDialog(context);
              // Add your code here for a successful password entry
            } else {
              // Password is incorrect, you can display an error message or take appropriate action
              // Show the awesome dialog
              falseAwesomeDialog(context);
              // Add your code here for an incorrect password
            }
          },
        ),
      ],
    );
  },
);
    }
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
  
              child: Text(
                'Beli Paket',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
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

  void showAwesomeDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Transaksi Berhasil',
      desc: 'Transaksi Pulsa Anda Telah Berhasil.',
      btnOkOnPress: () {
       Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PembelianPage(), // Ganti dengan halaman yang sesuai
        ),
      );
      },
    ).show();
  }


void falseAwesomeDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Transaksi Gagal',
    desc: 'Anda Salah Memasukan PIN',
      btnOkOnPress: () {
       Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>PulsaPage(), // Ganti dengan halaman yang sesuai
        ),
      );
      },
    ).show();
  }
}


