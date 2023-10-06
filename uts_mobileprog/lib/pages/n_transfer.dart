import 'package:flutter/material.dart';
import 'package:uts_mobileprog/pages/account.dart';
import 'package:uts_mobileprog/pages/home_page.dart';
import 'package:uts_mobileprog/pages/qrcode.dart';

class NTransfer extends StatefulWidget {
  const NTransfer({Key? key});

  @override
  State<NTransfer> createState() => _NinfoState();
}

class _NinfoState extends State<NTransfer> {
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
                          text: 'N',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.red, // Red color for "N"
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
                          text: ' - TRANSFER',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white, // White color for "TRANSFER"
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
            top: 188, // Adjust the vertical position of the image
            left: 0, // Adjust the horizontal position of the image
            height: 500, // Adjust the image height
            width: MediaQuery.of(context).size.width, // Adjust the image width
            child: Image.asset(
              'lib/icons/pura.png',
              fit: BoxFit.cover, // Adjust as needed
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Antar Rekening',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        offset: Offset(1, 1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                //PENDAFTARAN REKENING

                ElevatedButton(
                  onPressed: () {
                    // Aksi saat tombol pertama ditekan
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
                        '                     Pendaftaran Rekening                   ',
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

                SizedBox(height: 10),
                //TRANSFER

                ElevatedButton(
                  onPressed: () {
                    // Aksi saat tombol pertama ditekan
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
                        '                                   Transfer                               ',
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

                SizedBox(height: 40),
                Text(
                  'Antar Bank',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        offset: Offset(1, 1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                // PENDAFTARAN REKENING
                ElevatedButton(
                  onPressed: () {
                    // Aksi saat tombol pertama ditekan
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
                        '                     Pendaftaran Rekening                   ',
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

                SizedBox(height: 10),
                //TRANSFER
                ElevatedButton(
                  onPressed: () {
                    // Aksi saat tombol pertama ditekan
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
                        '                                   Transfer                               ',
                        style: TextStyle(
                          fontSize:
                              16, // Ubah ukuran teks sesuai kebutuhan Anda
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                )
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
