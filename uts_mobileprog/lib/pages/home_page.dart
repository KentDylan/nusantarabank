import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uts_mobileprog/pages/account.dart';
import 'package:uts_mobileprog/pages/login_page.dart';
import 'package:uts_mobileprog/pages/n_info.dart';
import 'package:uts_mobileprog/pages/n_payment.dart';
import 'package:uts_mobileprog/pages/n_transfer.dart';
import 'package:uts_mobileprog/pages/qrcode.dart';
import 'package:uts_mobileprog/util/my_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  int _currentIndex = 0; // Indeks terpilih pada navbar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(95),
        child: Container(
          color: Colors.brown,
          child: Column(
            children: [
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 15),
                  Row(
                    children: [
                      Text(
                        'NUSAN',
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
                        'TARA',
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
                  SizedBox(width: 9),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 190,
                  width: 450,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    children: [
                      MyCards(
                        balance: 8102,
                        cardVip: 'VIP Pass',
                        expiryMonth: 01,
                        expiryYear: 22,
                        gradientColors: [
                          Color.fromARGB(255, 115, 88, 21),
                          Colors.white,
                        ],
                      ),
                      MyCards(
                        balance: 8102,
                        cardVip: 'Royal Blue Pass',
                        expiryMonth: 01,
                        expiryYear: 22,
                        gradientColors: [
                          const Color.fromARGB(255, 18, 125, 114),
                          Colors.white,
                        ],
                      ),
                      MyCards(
                        balance: 8102,
                        cardVip: 'Silver Pass',
                        expiryMonth: 01,
                        expiryYear: 22,
                        gradientColors: [
                          const Color.fromARGB(221, 0, 0, 0),
                          Color.fromARGB(255, 244, 211, 211),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect:
                      ExpandingDotsEffect(activeDotColor: Colors.grey.shade700),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => Ninfo(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white.withOpacity(0.7),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(16),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'lib/icons/credit-card.png',
                            width: 70,
                            height: 60,
                          ),
                          Text(
                            'N - Info',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => NPayment(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white.withOpacity(0.7),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(16),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'lib/icons/payment-method.png',
                            width: 60,
                            height: 60,
                          ),
                          Text(
                            'N - Payment',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => NTransfer(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white.withOpacity(0.7),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(16),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'lib/icons/info.png',
                            width: 60,
                            height: 60,
                          ),
                          Text(
                            'N - Transfer',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountNav()),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QrCodePage(),
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
              child: Icon(Icons.home, color: Colors.white),
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
