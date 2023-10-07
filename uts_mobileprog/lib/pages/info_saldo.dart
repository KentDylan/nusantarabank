import 'package:flutter/material.dart';
import 'package:uts_mobileprog/pages/account.dart';
import 'package:uts_mobileprog/pages/home_page.dart';
import 'package:uts_mobileprog/pages/n_info.dart';
import 'package:uts_mobileprog/pages/qrcode.dart';

class infosaldoPage extends StatefulWidget {
  const infosaldoPage({Key? key});

  @override
  State<infosaldoPage> createState() => _infosaldoPageState();
}

class _infosaldoPageState extends State<infosaldoPage> {
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
                          text: 'INFO',
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
                          text: ' - SALDO',
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
            top: 238,
            left: 0,
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'lib/icons/pura.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 150,
            left: 30,
            right: 30,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tanggal :',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.white,
                            offset: Offset(1, 1),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Sabtu, 07 Oktober 2023',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.white,
                            offset: Offset(1, 1),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Jam :',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.white,
                            offset: Offset(1, 1),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '09.00',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.white,
                            offset: Offset(1, 1),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Saldo :',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.white,
                            offset: Offset(1, 1),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Rp 45.000.000,00',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.white,
                            offset: Offset(1, 1),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Aksi saat tombol pertama ditekan
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => Ninfo(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary:
                              Colors.brown[400], // Ubah warna latar belakang
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30), // Membuat sudut melengkung
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
                              '                     OK                   ',
                              style: TextStyle(
                                fontSize:
                                    16, // Ubah ukuran teks sesuai kebutuhan Anda
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
