// this is a map in which the user selects the location and get data about the place
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as maps_tool;
import 'package:vac_app/pages/show_warn.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool isSafe = true;

  // this is the inital pos of the map
  static const CameraPosition _initialCameraPostion = CameraPosition(
    target: LatLng(12.924416, 79.115194),
    zoom: 11.4,
  );
  
  // user for creating the danger areas
  List<LatLng> polyPoints = [
    LatLng(12.895953, 79.056542),
    LatLng(12.917705, 79.039719),
    LatLng(12.931759, 79.091904),
    LatLng(12.964215, 79.115250),
    LatLng(13.001684, 79.127266),
    LatLng(12.981277, 79.161255),
    LatLng(12.927075, 79.183228),
    LatLng(12.896957, 79.154732),
    LatLng(12.835037, 79.163315),
    LatLng(12.797208, 79.127610),   
  ];

  


  

  // to check if the location is safe when the marker is moved 
  void checkUpdatedLocation(LatLng pointLatLng){
    List<maps_tool.LatLng> convertPoints = polyPoints.map((e) => maps_tool.LatLng(e.latitude, e.longitude)).toList();
    setState(() {
      isSafe = maps_tool.PolygonUtil.containsLocation(
        maps_tool.LatLng(pointLatLng.latitude, pointLatLng.longitude), convertPoints, false);
    });
    print(isSafe);
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [GoogleMap(
        initialCameraPosition: _initialCameraPostion,
        markers: {
          Marker(
            markerId: MarkerId("this feeling is horible"),
            position: LatLng(12.924416, 79.115194),
            draggable: true,
            onDrag: (value){
             checkUpdatedLocation(value);
            }
            )
        },
        
        polygons: {
          Polygon(
            polygonId: PolygonId("1"),
            points: polyPoints,
            fillColor:  Color.fromARGB(0, 219, 2, 2).withOpacity(0.2),
            strokeWidth: 2,
          ),
          
        },

      ),
       
      Positioned(
       top: 625,
       left: 5,
       child: Container(
        height: 100,
        width: 330,
        child: isSafe ?  ShowWarn(name: "This area has typhoid consider taking ty21a vaccine") : ShowWarn(name: "good to go"),
       ),
      )
      ]
    );
  }
}