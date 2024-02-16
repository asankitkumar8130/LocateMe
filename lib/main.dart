import 'package:flutter/material.dart';
import 'map/Location.dart';
import 'map/_MapScreenState.dart';

void main() {
  runApp(const LocationsListScreen());
}

// To show location list
class LocationsListScreen extends StatelessWidget {
  const LocationsListScreen({super.key});

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




