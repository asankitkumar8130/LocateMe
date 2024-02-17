import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'map/Location.dart';
import 'map/_MapScreenState.dart';
import 'dart:async';
import 'firebase_options.dart';

void main() {
  runApp(const LocationsListScreen());
}

// To show location list
class LocationsListScreen extends StatelessWidget {
  const LocationsListScreen({super.key});

  Future<void> initializeDefault() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
          title: const Text('Locate Me', style : TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.separated(
          itemCount: predefinedLocations.length,
          itemBuilder: (context, index) {
            final location = predefinedLocations[index];
            return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  padding: const EdgeInsets.only(right: 12.0),
                  decoration: const BoxDecoration(
                      border: Border(
                          right: BorderSide(width: 1.0, color: Colors.green))),
                  child: const Icon(Icons.location_on_rounded, color: Colors.white),
                ),
                title: Text(
                  location.name,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MapScreen(location: location)));
                });
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
