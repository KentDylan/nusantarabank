import 'package:flutter/material.dart';
import 'package:uts_mobileprog/pages/account.dart';
import 'package:uts_mobileprog/pages/home_page.dart';
import 'package:uts_mobileprog/pages/info_saldo.dart';
import 'package:uts_mobileprog/pages/mutasi_rekening.dart';
import 'package:uts_mobileprog/pages/qrcode.dart';

class Ninfo extends StatefulWidget {
  const Ninfo({Key? key});

  @override
  State<Ninfo> createState() => _NinfoState();
}

class _NinfoState extends State<Ninfo> {
  int _currentIndex = 0;

  void _navigateToHomePage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

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
                          text: 'N',
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
                          text: ' - INFO',
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
      body: Stack(
        children: [
          Positioned(
            top: 238, // Atur letak vertikal gambar
            left: 0, // Atur letak horizontal gambar
            height: 500, // Atur tinggi gambar
            width: MediaQuery.of(context)
                .size
                .width, // Sesuaikan lebar dengan lebar layar
            child: Image.asset(
              'lib/icons/pura.png',
              fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Aksi saat tombol pertama ditekan
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => infosaldoPage(),
                      ),
                    );
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
                        '                               Info Saldo                             ',
                        style: TextStyle(
                          fontSize:
                              16, // Ubah ukuran teks sesuai kebutuhan Anda
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
                SizedBox(height: 20), // Spasi antara tombol
                ElevatedButton(
                  onPressed: () {
                    // Aksi saat tombol kedua ditekan
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => mutasirekeningPage(),
                      ),
                    );
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
                        '                         Mutasi Rekening                        ',
                        style: TextStyle(
                          fontSize:
                              16, // Ubah ukuran teks sesuai kebutuhan Anda
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white),
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
