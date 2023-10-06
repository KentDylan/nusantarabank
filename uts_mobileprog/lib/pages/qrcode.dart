import 'package:flutter/material.dart';
import 'package:uts_mobileprog/pages/account.dart';
import 'package:uts_mobileprog/pages/home_page.dart';
import 'package:uts_mobileprog/pages/qrshow.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepOrange[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(32),
          child: Container(
            color: Colors.brown,
            child: Column(
              children: [
                SizedBox(height: 39),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'SCAN',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.red[700],
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
                        Text(
                          'QR',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(3, 3),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            // Tambahkan widget lain di sini jika diperlukan.

            // Menambahkan gambar scanner dengan posisi kustom
            Positioned(
              top: 100, // Atur posisi dari atas (top) sesuai kebutuhan Anda
              left: 43, // Atur posisi dari kiri (left) sesuai kebutuhan Anda
              child: Column(
                children: [
                  Image.asset(
                    'lib/icons/scanner.png', // Ubah sesuai dengan lokasi gambar Anda
                    width: 300, // Atur lebar gambar sesuai kebutuhan Anda
                    height: 300, // Atur tinggi gambar sesuai kebutuhan Anda
                    color: Colors.black,
                  ),
                  SizedBox(height: 70), // Jarak antara gambar dan tombol
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan aksi yang ingin Anda lakukan ketika tombol ditekan
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => QrShowPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 280, // Atur lebar tombol sesuai kebutuhan Anda
                      height: 50, // Atur tinggi tombol sesuai kebutuhan Anda
                      alignment:
                          Alignment.center, // Pusatkan teks di dalam tombol
                      child: Text(
                        'SHOW QR',
                        style: TextStyle(
                          color: Colors.white, // Ubah warna teks menjadi putih
                          fontSize:
                              18, // Atur ukuran teks sesuai kebutuhan Anda
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.brown[
                          400]), // Ubah warna tombol menjadi cokelat (brown)
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Atur melengkung sesuai kebutuhan Anda
                        ),
                      ),
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
                // Anda sudah berada di halaman AccountNav, jadi tidak perlu navigasi lagi.
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
                child: Icon(Icons.qr_code, color: Colors.white),
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
      ),
    );
  }
}
