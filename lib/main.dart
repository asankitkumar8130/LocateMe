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
        appBar: AppBar(
          title: const Text('Locate Me'),
        ),
        body: ListView.separated(
          itemCount: predefinedLocations.length,
          itemBuilder: (context, index) {
            final location = predefinedLocations[index];
            return ListTile(
                title: Text(location.name),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapScreen(location: location)));
                }
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}




