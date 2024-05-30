class Agent {
  final String uuid;
  final String displayName;
  final String description;
  final String displayIcon;
  final String fullPortrait;
  final List<dynamic> abilities;
  final String displayIconSmall;

  Agent({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.fullPortrait,
    required this.abilities,
    required this.displayIconSmall,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      uuid: json['uuid'],
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'],
      displayIconSmall: json['displayIconSmall'],
      fullPortrait: json['fullPortrait'] ?? '',
      abilities: json['abilities'],
    );
  }
}



class AgentDetail {
  final String uuid;
  final String displayName;
  final String description;
  final String developerName;
  final String characterTags; 
  final String displayIcon;
  final String largeIcon;
  final String bustPortrait;
  final String fullPortrait;
  final String assetPath;

  AgentDetail({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    required this.characterTags,
    required this.displayIcon,
    required this.largeIcon,
    required this.bustPortrait,
    required this.fullPortrait,
    required this.assetPath,
  });

  factory AgentDetail.fromJson(Map<String, dynamic> json) {
    return AgentDetail(
      uuid: json['uuid'],
      displayName: json['displayName'],
      description: json['description'],
      developerName: json['developerName'],
      characterTags: json['characterTags'],
      displayIcon: json['displayIcon'],
      largeIcon: json['largeIcon'],
      bustPortrait: json['bustPortrait'],
      fullPortrait: json['fullPortrait'],
      assetPath: json['assetPath'],
    );
  }
}

class MapInfo {
  final String uuid;
  final String displayName;
  final String location;
  final String thumbnail;

  MapInfo({
    required this.uuid,
    required this.displayName,
    required this.location,
    required this.thumbnail,
  });

  factory MapInfo.fromJson(Map<String, dynamic> json) {
    return MapInfo(
      uuid: json['uuid'],
      displayName: json['displayName'],
      location: json['location'],
      thumbnail: json['thumbnail'],
    );
  }
}
