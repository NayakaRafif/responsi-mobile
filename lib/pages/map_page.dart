
import 'package:coba/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'map_detail_page.dart';
import '../models/map.dart';



class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  List<GameMap> maps = [];

  @override
  void initState() {
    super.initState();
    fetchMaps();
  }

  Future<void> fetchMaps() async {
  try {
    final response = await http.get(Uri.parse('https://valorant-api.com/v1/maps'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      setState(() {
        maps = data.map((map) => GameMap.fromJson(map)).toList();
      });
    } else {
      throw Exception('Failed to load maps: ${response.statusCode}');
    }
  } catch (error) {
  
    throw Exception('Failed to load maps');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: maps.isNotEmpty
          ? ListView.builder(
              itemCount: maps.length,
              itemBuilder: (context, index) {
                final map = maps[index];
                return ListTile(
                
                  title: Text(map.displayName),
                  subtitle: Text(map.coordinates),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapDetailPage(map: map)),
                    );
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
