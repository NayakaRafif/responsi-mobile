import 'package:flutter/material.dart';
import 'agent_list_screen.dart';
import 'map_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valorant App',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red, // Warna latar belakang app bar merah
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.red.shade300, Colors.white], // Gradasi dari merah ke putih
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AgentListScreen()),
                  );
                },
                child: Text('Agents List',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Warna latar belakang tombol merah
                ),
              ),
              SizedBox(height: 20), // Jarak antara tombol
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapListScreen()),
                  );
                },
                child: Text('Maps List',style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Warna latar belakang tombol merah
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
