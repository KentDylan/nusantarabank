import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:uts_mobileprog/pages/account.dart';
import 'package:uts_mobileprog/pages/home_page.dart';
import 'package:uts_mobileprog/pages/n_payment.dart';
import 'package:uts_mobileprog/pages/qrcode.dart';

class TokenListrikPage extends StatefulWidget {
  const TokenListrikPage({Key? key}) : super(key: key);

  @override
  _TokenListrikPageState createState() => _TokenListrikPageState();
}

class _TokenListrikPageState extends State<TokenListrikPage> {
  TextEditingController customerIdController = TextEditingController();
  String selectedNominal = '100000'; // Ubah dengan nilai awal yang sesuai
  List<String> nominalList = ['100000', '200000', '500000', '1000000'];
  int _currentIndex = 0;

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
                          text: 'Token',
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
                          text: '-Listrik',
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
            top: 180, // Atur letak vertikal gambar
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 76),
                Text(
                  'Masukkan ID Token Listrik:',
                  style: TextStyle(fontSize: 18),
                ),
                TextField(
                  controller: customerIdController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'ID Pelanggan',
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Pilih Nominal Token:',
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButton<String>(
                  value: selectedNominal,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedNominal = newValue!;
                    });
                  },
                  items: nominalList.map((String nominal) {
                    return DropdownMenuItem<String>(
                      value: nominal,
                      child: Text('Rp $nominal'),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Check if the text fields are empty
    if (customerIdController.text.isEmpty) {
      // Show an error message or perform any desired action
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
        backgroundColor: Colors.brown, // Set the background color to brown
        title: Text('WARNING', style: TextStyle(color: Colors.white)), // Set text color to white
        content: Text(
          'Masukan ID Token',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK', style: TextStyle(color: Colors.white)), // Set text color to white
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
} else {
                    // Reset nilai input setelah pembayaran
                    customerIdController.clear();
                    selectedNominal = nominalList[0];

                    showDialog(
  context: context,
  builder: (BuildContext context) {
    String password = ''; // Initialize an empty password variable

    return AlertDialog(
      backgroundColor: Colors.brown, // Set the background color to brown
      title: Text('Enter PIN', style: TextStyle(color: Colors.white)), // Set text color to white
      content: TextField(
        obscureText: true, // Mask the input text for password
        style: TextStyle(color: Colors.white), // Set text color to white
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)), // Set hint text color to white with opacity
        ),
        onChanged: (value) {
          // Update the password variable when the text field value changes
          password = value;
        },
      ),
      actions: <Widget>[
        TextButton(
          child: Text('OK', style: TextStyle(color: Colors.white)), // Set text color to white
          onPressed: () {
            // Validate the password here, and perform actions accordingly
            if (password == '123456') {
              // Password is correct, perform your desired action
              // Show the awesome dialog
              showAwesomeDialog(context);
              // Add your code here for a successful password entry
            } else {
              // Password is incorrect, you can display an error message or take appropriate action
              // Show the awesome dialog
              falseAwesomeDialog(context);
              // Add your code here for an incorrect password
            }
          },
        ),
      ],
    );
  },
);
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
                  child: Text(
                    'Bayar Token',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QrCodePage(),
                ),
              );
            } else if (index == 2) {
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

  @override
  void dispose() {
    customerIdController.dispose();
    super.dispose();
  }

  void showAwesomeDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Transaksi Berhasil!',
      desc: 'Transaksi Token Listrik Anda Telah Berhasil.',
      btnOkOnPress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                NPayment(), // Ganti dengan halaman yang sesuai
          ),
        );
      },
    ).show();
  }


void falseAwesomeDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Transaksi Gagal',
    desc: 'Anda Salah Memasukan PIN',
      btnOkOnPress: () {
       Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>TokenListrikPage(), // Ganti dengan halaman yang sesuai
        ),
      );
      },
    ).show();
  }
}

