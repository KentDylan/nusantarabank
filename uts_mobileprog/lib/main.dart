import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uts_mobileprog/pages/login_page.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          SplashScreen(), // Menggunakan halaman SplashScreen sebagai halaman awal
      title: 'NUSANTARA',
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Durasi animasi
    );

    // Menggunakan Tween untuk mengatur perubahan dari 0.0 ke 1.0
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    // Memulai animasi
    _controller.forward();

    // Setelah animasi selesai, navigasikan ke halaman login
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Pastikan untuk menghapus controller animasi
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange[100],
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: _animation
                .value, // Menggunakan nilai animasi sebagai faktor skala
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
