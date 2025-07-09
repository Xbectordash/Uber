import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_route_bloc/get_route_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_route_bloc/get_route_state.dart';

class MapServices extends StatefulWidget {
  const MapServices({super.key});

  @override
  State<MapServices> createState() => _MapServicesState();
}

class _MapServicesState extends State<MapServices> {
  late GoogleMapController _mapController;
  CameraPosition? _currentPosition;
  bool _locationPermissionGranted = false;
  LatLng? _currentLatLng;

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
      _currentLatLng = LatLng(position.latitude, position.longitude);
    });
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(_currentPosition!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRoutesBloc, GetRoutesState>(
      builder: (context, state) {
        Set<Marker> markers = {};
        Set<Polyline> polylines = {};
        if(state is IntialGetRoutesState){
          if (_currentLatLng != null) {
            markers.add(
              Marker(
                markerId: const MarkerId('current_location'),
                position: _currentLatLng!,
              ),
            );}
        }
        else if (state is LoadedGetRoutesState) {
          // Only add markers if lat/lng are not null
          if (state.origin.lat != null && state.origin.lng != null) {
            LatLng sourceLatLng = LatLng(state.origin.lat!, state.origin.lng!);
            markers.add(
              Marker(
                markerId: const MarkerId('source'),
                position: sourceLatLng,
                infoWindow: const InfoWindow(title: 'Source'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen,
                ),
              ),
            );
          }
          if (state.destination.lat != null && state.destination.lng != null) {
            LatLng destLatLng = LatLng(state.destination.lat!, state.destination.lng!);
            markers.add(
              Marker(
                markerId: const MarkerId('destination'),
                position: destLatLng,
                infoWindow: const InfoWindow(title: 'Destination'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed,
                ),
              ),
            );
          }
          // Decode polyline
          final PolylinePoints polylinePoints = PolylinePoints();
          List<PointLatLng> result = polylinePoints.decodePolyline(
            state.polyline,
          );
          debugPrint("Polyline raw string: ${state.polyline}");

          polylines.add(
            Polyline(
              polylineId: const PolylineId('route'),
              points: result
                  .map((point) => LatLng(point.latitude, point.longitude))
                  .toList(),
              color: Colors.blue,
              width: 5,
            ),
          );
        }
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
              markers: markers,
              polylines: polylines,
              myLocationEnabled: _locationPermissionGranted,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
            ),
          ),
        );
      },
    );
  }
}
