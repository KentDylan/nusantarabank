import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uts_mobileprog/pages/home_page.dart';
import 'package:uts_mobileprog/pages/qrcode.dart';
import 'package:uts_mobileprog/util/my_card.dart'; // Import library Clipboard

class AccountNav extends StatefulWidget {
  const AccountNav({Key? key}) : super(key: key);

  @override
  State<AccountNav> createState() => _AccountNavState();
}

class _AccountNavState extends State<AccountNav> {
  final _controller = PageController();
  int _currentIndex = 0; // Indeks terpilih pada navbar
  String _selectedPass =
      'VIP Pass'; // Variabel untuk menyimpan pilihan pengguna
  String _cardVip = 'VIP Pass'; // Variabel untuk konten kartu

  // Teks yang akan disalin
  final String _nomorKartu = '0878-8555-5995';

  // Fungsi untuk menyalin teks ke clipboard
  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _nomorKartu));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Teks disalin ke clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan debug banner
      home: Scaffold(
        backgroundColor: Colors.deepOrange[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(95),
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
                          'ACC',
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
                          'OUNT',
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
            // Kartu BARANG
            Positioned(
              top: 200,
              left: 0,
              child: Container(
                height: 190,
                width: 390,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  itemCount: 3, // Jumlah total kartu (VIP, Royal Blue, Silver)
                  onPageChanged: (index) {
                    setState(() {
                      if (index == 0) {
                        _cardVip = 'VIP Pass';
                      } else if (index == 1) {
                        _cardVip = 'Royal Blue Pass';
                      } else if (index == 2) {
                        _cardVip = 'Silver Pass';
                      }
                    });
                  },
                  itemBuilder: (context, index) {
                    return MyCards(
                      balance: 8102,
                      cardVip: _cardVip,
                      expiryMonth: 01,
                      expiryYear: 22,
                      gradientColors: [
                        Color.fromARGB(255, 115, 88, 21),
                        Colors.white,
                      ],
                    );
                  },
                ),
              ),
            ),
            // Tambahkan widget lain di sini sesuai kebutuhan Anda.

            // Tombol Pilihan
            Positioned(
              top: 100, // Atur posisi lebih tinggi agar ada ruang untuk judul
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'JENIS KARTU',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900, // Warna teks hitam
                      fontSize: 24.0,
                      shadows: [
                        Shadow(
                          color: Colors.white,
                          offset: Offset(3, 3),
                          blurRadius: 20,
                        ),
                      ], // Ukuran teks
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ), // Beri sedikit ruang antara judul dan DropdownButton
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Warna garis border
                        width: 2.0, // Lebar border
                      ),
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ), // Membuat sudut border menjadi melengkung
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 102),
                    child: DropdownButton<String>(
                      value: _selectedPass,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedPass = newValue!;
                          // Update jenis kartu sesuai dengan DropdownMenu
                          if (_selectedPass == 'VIP Pass') {
                            _controller.jumpToPage(0);
                          } else if (_selectedPass == 'Royal Blue Pass') {
                            _controller.jumpToPage(1);
                          } else if (_selectedPass == 'Silver Pass') {
                            _controller.jumpToPage(2);
                          }
                        });
                      },
                      items: <String>[
                        'VIP Pass',
                        'Royal Blue Pass',
                        'Silver Pass'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600, // Warna teks
                              fontSize: 16.0,
                              shadows: [
                                Shadow(
                                  color: Colors.white,
                                  offset: Offset(3, 3),
                                  blurRadius: 20,
                                ),
                              ], // Ukuran teks
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            // Tulisan "Nomor Kartu"
            Positioned(
              top: 415,
              left: 25,
              child: Text(
                'Nomor Kartu : ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),

            // Border text dengan tombol "Copy"
            Positioned(
              top: 440,
              left: 20,
              child: GestureDetector(
                onTap:
                    _copyToClipboard, // Panggil fungsi saat tombol "Copy" ditekan
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Text(
                        _nomorKartu,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 180.0),
                      Icon(Icons.copy),
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
                child: Icon(Icons.account_circle, color: Colors.white),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
