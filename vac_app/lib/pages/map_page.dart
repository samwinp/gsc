// this is a map in which the user selects the location and get data about the place
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const CameraPosition _initialCameraPostion = CameraPosition(
    target: LatLng(12.880388, 74.84990),
    zoom: 11.4,
  );




  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        initialCameraPosition: _initialCameraPostion,
      ),
    );
  }
}