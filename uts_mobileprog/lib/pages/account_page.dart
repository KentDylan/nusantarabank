import 'package:flutter/material.dart';
import 'package:uts_mobileprog/pages/home_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  double currentChildSize = 0.1; // Ukuran awal konten (hanya bar putih)

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Transform.scale(
              scale: 0.95,
              child: Image.asset(
                'lib/icons/pura.png',
                fit: BoxFit.fill,
              ),
            ),
          ),

          // Text "HELLO," di 1/4 layar
          Positioned(
            top: screenHeight * 0.30,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "HELLO,",
                  style: TextStyle(
                    fontFamily: 'Calibri',
                    color: Colors.black,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Text "Welcome Back" di 1/4 layar
          Positioned(
            top: screenHeight * 0.37,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontFamily: 'Calibri',
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: screenHeight * 0.80,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Swipe Up",
                  style: TextStyle(
                    fontFamily: 'Calibri',
                    color: Colors.black,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Stack untuk menempatkan kotak putih
          Stack(
            children: [
              // DraggableScrollableSheet
              DraggableScrollableSheet(
                initialChildSize: currentChildSize, // Ukuran awal konten
                maxChildSize:
                    0.5, // Ukuran maksimum yang dapat digesek (1/2 layar)
                minChildSize:
                    0.1, // Ukuran minimum yang dapat digesek (hanya bar putih)
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ListView(
                      controller: scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        SizedBox(height: 20),

                        // Text "Enter your Account" di tengah
                        Center(
                          child: Text(
                            "Enter your Account",
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 22,
                            ),
                          ),
                        ),

                        SizedBox(height: 30),

                        // Kotak email
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Colors.grey[300],
                          ),
                        ),

                        SizedBox(height: 20),

                        // Kotak password
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Colors.grey[300],
                          ),
                          obscureText: true,
                        ),

                        SizedBox(height: 20),

                        // Tombol Login
                        ElevatedButton(
                          onPressed: () {
                             // Check if the phoneNumberController is empty
                    if (emailController.text.isEmpty || passwordController.text.isEmpty ) {
      // Show an error message or perform any desired action
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WARNING'),
            content: Text('Tolong isi Account'),
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
    }
else {
                            // Implementasi fungsi login di sini
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(180, 206, 118, 92),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Calibri',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
