import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // tambahkan import ini
import '../models/map.dart';

class MapDetailScreen extends StatelessWidget {
  final ValorantMap map;

  MapDetailScreen({required this.map});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(map.displayIcon),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              map.splash,
              height: 200, // Menyesuaikan tinggi gambar
              width: double.infinity, // Mengisi lebar
              fit: BoxFit.cover, // Memastikan gambar terisi dengan benar
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final url = 'https://valorant-api.com/v1/maps/${map.displayIcon}';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Text('Open Map in Browser'), // Perbaiki di sini
            ),
          ],
        ),
      ),
    );
  }
}
