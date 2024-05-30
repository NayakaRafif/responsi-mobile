import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/agent.dart';
import '../models/map.dart';

class ApiService {
  static const String baseUrl = 'https://valorant-api.com/v1';

  static Future<List<Agent>> fetchAgents() async {
    final response = await http.get(Uri.parse('$baseUrl/agents'));
    if (response.statusCode == 200) {
      final List agents = jsonDecode(response.body)['data'];
      return agents.map((agent) => Agent.fromJson(agent)).toList();
    } else {
      throw Exception('Failed to load agents');
    }
  }


  static Future<List<ValorantMap>> fetchMaps() async {
    final response = await http.get(Uri.parse('$baseUrl/maps'));
    if (response.statusCode == 200) {
      final List maps = jsonDecode(response.body)['data'];
      return maps.map((map) => ValorantMap.fromJson(map)).toList();
    } else {
      throw Exception('Failed to load maps');
    }
  }
}
