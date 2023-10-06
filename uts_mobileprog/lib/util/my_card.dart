import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
  final int balance;
  final String cardVip;
  final int expiryMonth;
  final int expiryYear;
  final List<Color> gradientColors;

  const MyCards({
    Key? key,
    required this.balance,
    required this.cardVip,
    required this.expiryMonth,
    required this.expiryYear,
    required this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 350,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors, // Gunakan gradasi warna di sini
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(13),
        ),
        // ignore: prefer_const_constructors
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nusantara Bank',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black, // Warna bayangan
                        offset: Offset(
                          2,
                          2,
                        ), // Posisi bayangan (horizontal, vertical)
                        blurRadius: 9, // Radius blur bayangan
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'lib/icons/visa.png',
                  height: 50,
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              '**** **** **** ' + balance.toString(),
              style: TextStyle(
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black, // Warna bayangan
                    offset:
                        Offset(2, 2), // Posisi bayangan (horizontal, vertical)
                    blurRadius: 9, // Radius blur bayangan
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // card info
                Text(
                  cardVip.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black, // Warna bayangan
                        offset: Offset(
                            2, 2), // Posisi bayangan (horizontal, vertical)
                        blurRadius: 9, // Radius blur bayangan
                      ),
                    ],
                  ),
                ),
                // card expiry date
                Text(
                  expiryMonth.toString() + '/' + expiryYear.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black, // Warna bayangan
                        offset: Offset(
                            2, 2), // Posisi bayangan (horizontal, vertical)
                        blurRadius: 9, // Radius blur bayangan
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // card info
                Text(
                  'Hanvin Aditya',
                  style: TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black, // Warna bayangan
                        offset: Offset(
                            2, 2), // Posisi bayangan (horizontal, vertical)
                        blurRadius: 9, // Radius blur bayangan
                      ),
                    ],
                  ),
                ),
                // card expiry date
                Text(
                  'NB',
                  style: TextStyle(
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black, // Warna bayangan
                          offset: Offset(
                              2, 2), // Posisi bayangan (horizontal, vertical)
                          blurRadius: 10, // Radius blur bayangan
                        ),
                      ],
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
