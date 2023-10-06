import 'package:flutter/material.dart';
import 'package:uts_mobileprog/pages/account_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/icons/nusantara.png', // Pastikan path gambar yang sesuai
              width: 350, // Ubah ukuran sesuai kebutuhan
              height: 350,
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman Account saat tombol Login ditekan
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AccountPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(180, 206, 118, 92),
                  minimumSize: Size(230, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                child: Container(
                  width: 170,
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
