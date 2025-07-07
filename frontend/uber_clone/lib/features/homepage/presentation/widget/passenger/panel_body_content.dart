import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class PanelBodyContent extends StatefulWidget {
  final bool isUser;
  final String? captainId;
  const PanelBodyContent({super.key, this.isUser = true, this.captainId});

  @override
  State<PanelBodyContent> createState() => _PanelBodyContentState();
}

class _PanelBodyContentState extends State<PanelBodyContent> {
  late GoogleMapController _mapController;
  CameraPosition? _currentPosition;
  bool _locationPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationPermissionGranted = false;
        });
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationPermissionGranted = false;
      });
      return;
    }
    setState(() {
      _locationPermissionGranted = true;
    });
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15,
      );
    });
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(_currentPosition!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 300,
        child: GoogleMap(
          initialCameraPosition:
              _currentPosition ??
              const CameraPosition(
                target: LatLng(37.7749, -122.4194),
                zoom: 12,
              ),
          onMapCreated: (controller) {
            _mapController = controller;
            if (_currentPosition != null) {
              _mapController.animateCamera(
                CameraUpdate.newCameraPosition(_currentPosition!),
              );
            }
          },
          myLocationEnabled: _locationPermissionGranted,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: true,
        ),
      ),
    );
  }
}
