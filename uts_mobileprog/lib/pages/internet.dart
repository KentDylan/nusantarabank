import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart'; // Import package Awesome Dialog
import 'package:uts_mobileprog/pages/account.dart';
import 'package:uts_mobileprog/pages/home_page.dart';
import 'package:uts_mobileprog/pages/pembelian.dart';
import 'package:uts_mobileprog/pages/qrcode.dart';

class InternetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IsiPulsaScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class IsiPulsaScreen extends StatefulWidget {
  @override
  _IsiPulsaScreenState createState() => _IsiPulsaScreenState();
}

class _IsiPulsaScreenState extends State<IsiPulsaScreen> {
  int _currentIndex = 0; // Inisialisasi _currentIndex dengan 0
  TextEditingController phoneNumberController = TextEditingController();

  // Daftar pilihan paket internet dan harganya
  List<String> paketInternetList = [
    'Paket Bagus 2.5GB (Rp 30.000)',
    'Paket Cepat 5GB (Rp 55.000)',
    'Paket Super 10GB (Rp 100.000)',
    'Paket Combo 20GB (Rp 180.000)',
  ];
  String selectedPaketInternet =
      'Paket Bagus 2.5GB (Rp 30.000)'; // Ubah nilai awal sesuai dengan salah satu elemen dalam daftar

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
                          text: 'INT',
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
                          text: 'ERNET',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 76),
            Text(
              'Masukkan Nomor Telepon:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Contoh: 081234567890',
              ),
            ),
            SizedBox(height: 46),
            Text(
              'Pilih Paket Internet:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: selectedPaketInternet,
              onChanged: (String? newValue) {
                setState(() {
                  selectedPaketInternet = newValue!;
                });
              },
              items: paketInternetList.map((String paket) {
                return DropdownMenuItem<String>(
                  value: paket,
                  child: Text(paket),
                );
              }).toList(),
            ),
            SizedBox(height: 46),
            ElevatedButton(
              onPressed: () {
    // Check if the text fields are empty
    if (phoneNumberController.text.isEmpty || paketInternetList.isEmpty) {
      // Show an error message or perform any desired action
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WARNING'),
            content: Text('Tolong isi Nomor Telepon'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
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
      paketInternetList.clear();

      // Show the awesome dialog
      showAwesomeDialog(context);
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
                      17, // Sesuaikan dengan ukuran vertikal yang Anda inginkan
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '                           Beli Paket                         ',
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

  void showAwesomeDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Transaksi Berhasil!',
      desc: 'Transaksi Internet Anda Telah Berhasil.',
      btnOkOnPress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PembelianPage(), // Ganti dengan halaman yang sesuai
          ),
        );
      },
    ).show();
  }
}
