import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PanelBodyContent extends StatefulWidget {
  const PanelBodyContent({super.key});

  @override
  State<PanelBodyContent> createState() => _PanelBodyContentState();
}

class _PanelBodyContentState extends State<PanelBodyContent> {
  late GoogleMapController _mapController;
  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(37.7749, -122.4194), // Example: San Francisco
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 300, // Set a fixed height or use constraints as needed
        child: GoogleMap(
          initialCameraPosition: _initialPosition,
          onMapCreated: (controller) {
            _mapController = controller;
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: true,
        ),
      ),
    );
  }
}
