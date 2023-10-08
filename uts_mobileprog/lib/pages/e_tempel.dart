import 'package:flutter/material.dart';
import 'package:uts_mobileprog/pages/E-money.dart';
import 'package:uts_mobileprog/pages/account.dart';
import 'package:uts_mobileprog/pages/home_page.dart';
import 'package:uts_mobileprog/pages/qrcode.dart';

class Etempel extends StatefulWidget {
  const Etempel({Key? key}) : super(key: key);

  @override
  State<Etempel> createState() => _EtempelState();
}

class _EtempelState extends State<Etempel> {
  int _currentIndex = 0;
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
                          text: 'SCAN',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.red, // Warna merah untuk "N"
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
                          text: ' KARTU',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white, // Warna putih untuk "INFO"
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
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/icons/nfc-card.png', // Pastikan path gambar yang sesuai
                  width: 300, // Ubah ukuran sesuai kebutuhan
                  height: 300,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman Account saat tombol Login ditekan
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EMonetPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(180, 206, 118, 92),
                    minimumSize: Size(20, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Container(
                    width: 100,
                    height: 50,
                    child: Center(
                      child: Text(
                        'OK',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
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
