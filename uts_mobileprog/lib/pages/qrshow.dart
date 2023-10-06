import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
import 'package:uts_mobileprog/pages/account.dart';
import 'package:uts_mobileprog/pages/home_page.dart';
import 'package:uts_mobileprog/pages/qrcode.dart';

class QrShowPage extends StatefulWidget {
  const QrShowPage({Key? key}) : super(key: key);

  @override
  State<QrShowPage> createState() => _QrShowPageState();
}

class _QrShowPageState extends State<QrShowPage> {
  int _currentIndex = 0;
  late Timer _timer;
  String _qrData = "12345678"; // Data QR code awal

  @override
  void initState() {
    super.initState();
    // Atur timer untuk mengganti QR code setiap 2 menit
    _timer = Timer.periodic(Duration(minutes: 2), (timer) {
      setState(() {
        _qrData = "New QR Data"; // Ganti data QR code sesuai kebutuhan Anda
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Batalkan timer saat widget dihapus
    super.dispose();
  }

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
                          'SHOW',
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
            // Center(
            //   child: QrImageView(
            //     data: _qrData, // Gunakan data QR code yang telah diupdate
            //     version: QrVersions.auto,
            //     size: 300,
            //     backgroundColor: Colors.transparent,
            //   ),
            // ),
            Positioned(
              top: 80, // Atur posisi dari atas (top) sesuai kebutuhan Anda
              left: 50, // Atur posisi dari kiri (left) sesuai kebutuhan Anda
              child: Container(
                width: 300,
                height: 45,
                padding:
                    EdgeInsets.all(9.0), // Atur jarak antara border dan teks
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        Colors.black, // Ubah warna border sesuai kebutuhan Anda
                    width: 2.0, // Ubah lebar border sesuai kebutuhan Anda
                  ),
                ),
                child: Text(
                  'Rekening :                        12345678',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        offset: Offset(1, 1),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 70), // Jarak antara gambar dan tombol
            Positioned(
              top: 500, // Atur posisi dari atas (top) sesuai kebutuhan Anda
              left: 40, // Atur posisi dari kiri (left) sesuai kebutuhan Anda
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi yang ingin Anda lakukan ketika tombol ditekan
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => QrCodePage(),
                    ),
                  );
                },
                child: Container(
                  width: 280, // Atur lebar tombol sesuai kebutuhan Anda
                  height: 50, // Atur tinggi tombol sesuai kebutuhan Anda
                  alignment: Alignment.center, // Pusatkan teks di dalam tombol
                  child: Text(
                    'SCAN QR',
                    style: TextStyle(
                      color: Colors.white, // Ubah warna teks menjadi putih
                      fontSize: 18, // Atur ukuran teks sesuai kebutuhan Anda
                    ),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors
                      .brown[400]), // Ubah warna tombol menjadi cokelat (brown)
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Atur melengkung sesuai kebutuhan Anda
                    ),
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
