import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/api_service.dart';
import '../models/map.dart';

class MapListScreen extends StatefulWidget {
  @override
  _MapListScreenState createState() => _MapListScreenState();
}

class _MapListScreenState extends State<MapListScreen> {
  late Future<List<ValorantMap>> futureMaps;

  @override
  void initState() {
    super.initState();
    futureMaps = ApiService.fetchMaps();
  }

  Future<void> _launchURL(String url) async {
  final uri = Uri.parse(url);
  if (!await launch(uri.toString())) { // Ubah ke uri.toString()
    throw 'Could not launch $url';
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Maps List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 217, 73, 73),
              Color.fromARGB(255, 237, 44, 15)
            ],
          ),
        ),
        child: FutureBuilder<List<ValorantMap>>(
          future: futureMaps,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No maps found'));
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final map = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      _launchURL(map.splash);
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.vertical(top: Radius.circular(15)),
                              child: Image.network(
                                map.splash,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  map.displayName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4), // Jarak antara nama map dan koordinat
                                Text(
                                  'Coordinates: ${map.coordinates}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
