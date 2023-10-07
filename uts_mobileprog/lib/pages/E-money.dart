import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:uts_mobileprog/pages/account.dart';
import 'package:uts_mobileprog/pages/home_page.dart';
import 'package:uts_mobileprog/pages/n_payment.dart';
import 'package:uts_mobileprog/pages/qrcode.dart';

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
  int _currentIndex = 0;
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
              'Saldo E-Money Anda: \Rp${emoneyBalance.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                shadows: [
                  Shadow(
                    color: Colors.white,
                    offset: Offset(3, 3),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: topupController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Jumlah Top Up',
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 10.0), // Mengurangi padding horizontal
                isDense: true, // Mengurangi tinggi secara keseluruhan
                // Mengatur lebar maksimum TextField
                // Anda dapat menyesuaikan nilai width sesuai dengan kebutuhan Anda
                // Contoh untuk mengurangi lebar menjadi setengah
                // width: 150,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Aksi saat tombol kedua ditekan
                double amount = double.tryParse(topupController.text) ?? 0.0;
                if (amount > 0) {
                  topupEMoney(amount);
                  topupController.clear();
                }

              },
              style: ElevatedButton.styleFrom(
                primary: Colors.brown[400], // Ubah warna latar belakang
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), // Membuat sudut melengkung
                ),
                elevation: 10, // Tambahkan bayangan
                padding: EdgeInsets.symmetric(
                  horizontal:
                      10, // Sesuaikan dengan ukuran horizontal yang Anda inginkan
                  vertical:
                      18, // Sesuaikan dengan ukuran vertikal yang Anda inginkan
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '                         OK                        ',
                    style: TextStyle(
                      fontSize: 16, // Ubah ukuran teks sesuai kebutuhan Anda
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
              // Menavigasi ke halaman beranda
              // Ganti dengan perintah navigasi ke halaman beranda Anda
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
              // Anda sudah berada di halaman AccountNav, jadi tidak perlu navigasi lagi.
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
        iconSize: 50, // Mengatur ukuran ikon menjadi lebih besar
        selectedFontSize: 0, // Hapus label teks di bawah ikon
        unselectedFontSize: 0, // Hapus label teks di bawah ikon
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(
                  top: 9), // Atur ketinggian letak ikon ke bawah
              child: Icon(Icons.home, color: Colors.grey),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(
                  top: 9), // Atur ketinggian letak ikon ke bawah
              child: Icon(Icons.qr_code, color: Colors.grey),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(
                  top: 9), // Atur ketinggian letak ikon ke bawah
              child: Icon(Icons.account_circle, color: Colors.grey),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
  
}
