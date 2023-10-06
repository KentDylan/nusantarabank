import 'package:flutter/material.dart';

class ads extends StatelessWidget {
  const ads({Key? key}) : super(key: key);

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
            // Tombol login telah dihapus dari sini
          ],
        ),
      ),
    );
  }
}
