import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
      children: [
        SafeArea(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(target: , zoom: 14.5),
          ),
        ),
      ],
    ));
  }
}
