class GameMap {
  final String uuid;
  final String displayName;
  final String coordinates;
  final String displayIcon;
  final String splash;
  final String thumbnail;

  GameMap({
    required this.uuid,
    required this.displayName,
    required this.coordinates,
    required this.displayIcon,
    required this.splash,
    required this.thumbnail,
  });

  factory GameMap.fromJson(Map<String, dynamic> json) {
    return GameMap(
      uuid: json['uuid'],
      displayName: json['displayName'],
      coordinates: json['coordinates'],
      displayIcon: json['displayIcon'],
      splash: json['splash'],
      thumbnail: json['thumbnail'],
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