import 'dart:convert';
import 'package:coba/models/agent.dart';
import 'package:http/http.dart' as http;


class ApiService {

Future<List<Map<String, dynamic>>> fetchAgents() async {
  final response = await http.get(Uri.parse('https://valorant-api.com/v1/agents'));
  if (response.statusCode == 200) {
    final List<dynamic> agentsJson = jsonDecode(response.body)['data'];
    return agentsJson.map((agent) => agent as Map<String, dynamic>).toList();
  } else {
    throw Exception('Failed to load agents');
  }
}

Future<Map<String, dynamic>> fetchAgentDetails(String agentUUID) async {
  final response = await http.get(Uri.parse('https://valorant-api.com/v1/agents/$agentUUID'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body)['data'] as Map<String, dynamic>;
  } else {
    throw Exception('Failed to load agent details');
  }
}

Future<List<Map<String, dynamic>>> fetchMaps() async {
  final response = await http.get(Uri.parse('https://valorant-api.com/v1/maps'));
  if (response.statusCode == 200) {
    final List<dynamic> mapsJson = jsonDecode(response.body)['data'];
    return mapsJson.map((map) => map as Map<String, dynamic>).toList();
  } else {
    throw Exception('Failed to load maps');
  }
}

void main() async {
  try {
    // Fetch and print list of agents
    final agents = await fetchAgents();
    print('List of agents:');
    for (final agent in agents) {
      print(agent['displayName']);
    }

    // Fetch and print details of an agent
    final agentUUID = 'some_agent_uuid'; // Replace with actual agent UUID
    final agentDetails = await fetchAgentDetails(agentUUID);
    print('Details of agent:');
    print(agentDetails);

    // Fetch and print list of maps
    final maps = await fetchMaps();
    print('List of maps:');
    for (final map in maps) {
      print(map['displayName']);
    }
  } catch (e) {
    print('Error: $e');
  }
}
}
