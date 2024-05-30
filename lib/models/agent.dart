class Agent {
  final String displayName;
  final String displayIcon;
  final String description;
  final String role;
  final List<Ability> abilities;

  Agent({
    required this.displayName,
    required this.displayIcon,
    required this.description,
    required this.role,
    required this.abilities,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      displayName: json['displayName'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
      description: json['description'] ?? '',
      role: json['role'] != null ? json['role']['displayName'] ?? '' : '',
      abilities: json['abilities'] != null
          ? (json['abilities'] as List)
              .map((ability) => Ability.fromJson(ability))
              .toList()
          : [],
    );
  }
}

class Ability {
  final String displayName;
  final String description;
  final String displayIcon;

  Ability({
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      displayName: json['displayName'] ?? '',
      description: json['description'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
    );
  }
}