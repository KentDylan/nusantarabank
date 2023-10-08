import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:uts_mobileprog/pages/account.dart';
import 'package:uts_mobileprog/pages/home_page.dart';
import 'package:uts_mobileprog/pages/n_transfer.dart';
import 'package:uts_mobileprog/pages/qrcode.dart';

class TransferLocalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransferLocalPageState(),
    );
  }
}

class TransferLocalPageState extends StatefulWidget {
  @override
  _TransferLocalPageStateState createState() => _TransferLocalPageStateState();
}

class _TransferLocalPageStateState extends State<TransferLocalPageState> {
  int _currentIndex = 0;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nominalController = TextEditingController();
  TextEditingController anotherController =
      TextEditingController(); // New controller

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
      body: Stack(
        children: [
          Positioned(
            top: 180,
            left: 0,
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'lib/icons/pura.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Masukkan Nomor Rekening:',
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

                // New TextField
                Text(
                  'Masukkan Jumlah Transfer:',
                  style: TextStyle(fontSize: 18),
                ),
                TextField(
                  controller: anotherController,
                  keyboardType:
                      TextInputType.number, // Change the keyboard type as needed
                  decoration: InputDecoration(
                    hintText: 'Contoh: 100000',
                  ),
                ),
                SizedBox(height: 16),

                ElevatedButton(
  onPressed: () {
    // Check if the text fields are empty
    if (phoneNumberController.text.isEmpty || anotherController.text.isEmpty) {
      // Show an error message or perform any desired action
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
        backgroundColor: Colors.brown, // Set the background color to brown
        title: Text('WARNING', style: TextStyle(color: Colors.white)), // Set text color to white
        content: Text(
          'Masukan Nomor rekening dan Nominal Transfer',
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
      anotherController.clear(); // Clear the new TextField value

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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Transfer ',
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
        ],
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
    title: 'Transaksi Berhasil!',
    desc: 'Transaksi  Anda Telah Berhasil.',
    btnOkOnPress: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NTransfer(), // Ganti dengan halaman yang sesuai
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
          builder: (context) =>TransferLocalPage(), // Ganti dengan halaman yang sesuai
        ),
      );
      },
    ).show();
  }
}
