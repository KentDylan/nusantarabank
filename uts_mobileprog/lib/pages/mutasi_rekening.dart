import 'package:flutter/material.dart';
import 'package:uts_mobileprog/pages/account.dart';
import 'package:uts_mobileprog/pages/home_page.dart';
import 'package:uts_mobileprog/pages/qrcode.dart';

class mutasirekeningPage extends StatefulWidget {
  const mutasirekeningPage({Key? key});

  @override
  State<mutasirekeningPage> createState() => _mutasirekeningPageState();
}

class _mutasirekeningPageState extends State<mutasirekeningPage> {
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
                          text: 'MUTASI',
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
                          text: ' REKENING',
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

          //mutasi Rekening
          Column(
            children: [
              Container(
                color:
                    Color.fromARGB(161, 255, 255, 255), // Warna background box
                padding: EdgeInsets.all(16), // Padding untuk isi box
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No Rekening:                                                          535220089',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // Spasi antara teks
                    Text(
                      'Tanggal Injury:                                           31/09/2023 08:01',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10), // Spasi antara teks
                    Text(
                      'Jenis Transaksi:                                                            Semua',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                //Copy

                //Copy

                //Copy

                //Copy

                //Copy

                //Copy

                //Copy
              ),
            ],
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
