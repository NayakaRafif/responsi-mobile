class ValorantMap {
  final String displayName;
  final String splash;
  final String? coordinates; // Ubah menjadi nullable
  final String displayIcon; // Tambahkan atribut displayIcon

  ValorantMap({
    required this.displayName,
    required this.splash,
    this.coordinates, // Jadikan nullable
    required this.displayIcon, // Tambahkan inisialisasi wajib
  });

  factory ValorantMap.fromJson(Map<String, dynamic> json) {
    return ValorantMap(
      displayName: json['displayName'] ?? '', // Penanganan untuk nilai null
      splash: json['splash'] ?? '', // Penanganan untuk nilai null
      coordinates: json['coordinates'], // Tetap menggunakan nilai dari respons API
      displayIcon: json['displayIcon'] ?? '', // Penanganan untuk nilai null
    );
  }
}
