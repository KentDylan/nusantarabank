import 'package:flutter/material.dart';

class TokenListrikPage extends StatefulWidget {
  const TokenListrikPage({Key? key}) : super(key: key);

  @override
  _TokenListrikPageState createState() => _TokenListrikPageState();
}

class _TokenListrikPageState extends State<TokenListrikPage> {
  TextEditingController customerIdController = TextEditingController();
  String selectedNominal = '100000'; // Ubah dengan nilai awal yang sesuai
  List<String> nominalList = ['100000', '200000', '500000', '1000000'];

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
                    // Proses pembayaran token listrik
                    String customerId = customerIdController.text;
                    String selectedNom = selectedNominal;

                    // Implementasikan logika pembayaran di sini

                    // Reset nilai input setelah pembayaran
                    customerIdController.clear();
                    selectedNominal = nominalList[0];
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 206, 118, 92),
                    minimumSize: Size(230, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
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
    );
  }

  @override
  void dispose() {
    customerIdController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: TokenListrikPage(),
  ));
}
