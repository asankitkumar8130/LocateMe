import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'Location.dart';

class MapScreen extends StatefulWidget {
  final Location location;

  @override
  _MapScreenState createState() => _MapScreenState(location : location);

  const MapScreen({super.key, required this.location});
}

class _MapScreenState extends State<MapScreen> {
  final Location location;
  late GoogleMapController mapController;

  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _markers.clear();
      for (final place in predefinedLocations) {
        final marker = Marker(
          markerId: MarkerId(place.name),
          position: LatLng(place.latitude, place.longitude),
          infoWindow: InfoWindow(
            title: place.name,
            snippet: place.country,
          ),
        );
        _markers[place.name] = marker;
      }
    });
  }

  _MapScreenState({required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
        title: Text(location.name, style : const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(location.latitude, location.longitude),
            zoom: 13.4746,
          ),
          markers: _markers.values.toSet()
      ),
    );
  }
}
