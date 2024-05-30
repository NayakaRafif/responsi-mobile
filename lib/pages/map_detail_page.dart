import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/map.dart';

class MapDetailPage extends StatelessWidget {
  final GameMap map;

  const MapDetailPage({required this.map});

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(map.displayName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(map.splash),
            SizedBox(height: 10),
            Text('Coordinates: ${map.coordinates}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                _launchURL(map.displayIcon);
              },
              child: Text('Open in Browser'),
            ),
          ],
        ),
      ),
    );
  }
}
