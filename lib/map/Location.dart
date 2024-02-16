class Location {
  final String name;
  final String country;
  final double latitude;
  final double longitude;

  Location({required this.name, required this.country, required this.latitude, required this.longitude});
}

final List<Location> predefinedLocations = [
  Location(name: "Downtown Los Angeles", country: "USA", latitude: 34.044727, longitude: -118.249283),
  Location(name: "Bangalore", country: "India", latitude: 12.9716, longitude: 77.5946),
  Location(name: "Corfu", country: "Europe", latitude: 39.6243, longitude: 19.9217),
  Location(name: "Tokyo Tower, Tokyo", country: "Japan", latitude: 35.658581, longitude: 139.745438),
  Location(name: "Burj Khalifa", country: "Dubai",latitude: 25.1972, longitude: 55.2744),
];