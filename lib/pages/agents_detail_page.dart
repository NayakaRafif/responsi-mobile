import 'package:flutter/material.dart';
import '../models/agent.dart';

class AgentDetailPage extends StatelessWidget {
  final Agent agent;

  const AgentDetailPage({Key? key, required this.agent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(agent.displayName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (agent.fullPortrait.isNotEmpty)
                Image.network(
                  agent.fullPortrait,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return Icon(Icons.error);
                  },
                ),
              SizedBox(height: 10),
              Text(
                agent.description.isNotEmpty ? agent.description : 'No description available',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Abilities:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ...agent.abilities.map((ability) {
                return ListTile(
                  leading: Image.network(ability['displayIcon']),
                  title: Text(ability['displayName']),
                  subtitle: Text(ability['description']),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
