import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_distance_time/get_distance_time_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_distance_time/get_distance_time_event.bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/suggestion/suggestion_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/suggestion/suggestion_event.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/suggestion/suggestion_state.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_fare/get_fare_bloc.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/get_fare/get_fare_event.dart';
import 'package:uber_clone/features/homepage/presentation/bloc/ride_flow_cubit.dart';
import 'package:uber_clone/features/homepage/data/create_ride_model.dart';

class SearchPanelWidget extends StatefulWidget {
  final FocusNode? pickupFocusNode;
  final FocusNode? destinationFocusNode;
  const SearchPanelWidget({super.key, this.pickupFocusNode, this.destinationFocusNode});

  @override
  State<SearchPanelWidget> createState() => _SearchPanelWidgetState();
}

class _SearchPanelWidgetState extends State<SearchPanelWidget> {
  final TextEditingController _pickupController = TextEditingController();
  Timer? _debounce;
  bool _initialPrefillDone = false;


  @override
  void initState() {
    super.initState();
    _setCurrentLocation();
  }


  Future<void> _setCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever)
      return;

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      String address =
          '${place.name}, ${place.locality}, ${place.administrativeArea}';
      _initialPrefillDone = false;
      _pickupController.text = address;
      Future.delayed(const Duration(milliseconds: 100), () {
        _initialPrefillDone = true;
      });
    }
  }

  void _onPickupChanged(String value) {
    if (!_initialPrefillDone) return;
     if (value.trim().length < 3) {
      if (_debounce?.isActive ?? false)
        _debounce!.cancel(); // cancel old debounce
      BlocProvider.of<SuggestionBloc>(context).add(ResetSuggestionsEvent());
      return;
    } else {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      final debouncedValue = value;
      _debounce = Timer(const Duration(milliseconds: 600), () {
        BlocProvider.of<SuggestionBloc>(
          context,
        ).add(FetchSuggestionsEvent(debouncedValue));
      });
    }
  }

  void _onDestinationChanged(String value) {
    if (value.trim().length < 3) {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      BlocProvider.of<SuggestionBloc>(context).add(ResetSuggestionsEvent());
      return;
    } else {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      final debouncedValue = value;
      _debounce = Timer(const Duration(milliseconds: 600), () {
        BlocProvider.of<SuggestionBloc>(context).add(FetchSuggestionsEvent(debouncedValue));
      });
    }
  }

  @override
  void dispose() {
    _pickupController.dispose();
    _debounce?.cancel();
    // Do not dispose focus nodes here, they are managed by the parent
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          onChanged: _onPickupChanged,
          controller: _pickupController,
          focusNode: widget.pickupFocusNode,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w800,
            color: Colors.black54,
          ),
          decoration: InputDecoration(
            hintText: 'Pickup location',
            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
            prefixIcon: const Icon(
              Icons.my_location_outlined,
              color: Colors.black54,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.grey[100],
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          onChanged: _onDestinationChanged,
          focusNode: widget.destinationFocusNode,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w800,
            color: Colors.black54,
          ),
          decoration: InputDecoration(
            hintText: 'Where to?',
            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
            prefixIcon: const Icon(
              Icons.location_on_outlined,
              color: Colors.black54,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.grey[100],
          ),
        ),
        const SizedBox(height: 16),
        BlocBuilder<SuggestionBloc, SuggestionState>(
          builder: (context, state) {
            if (state is SuggestionInitialState) {
              return Center(child: Text('Start typing to see suggestions.'));
            } else if (state is SuggestionLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuggestionLoadedState) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.suggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = state.suggestions[index];
                  return ListTile(
                    title: Text(
                      suggestion.description!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    onTap: () {
                      debugPrint('Selected suggestion: \\${suggestion.description}');
                      debugPrint('Pickup controller text: \\${_pickupController.text}');
                      // If pickup is empty or matches, set pickup and clear destination
                      if (_pickupController.text.isEmpty ||
                          _pickupController.text == suggestion.description) {
                        _pickupController.text = suggestion.description!;
                        // Optionally, clear destination field if you have a controller for it
                        // _destinationController?.clear();
                        return;
                      } else {
                        // Update destination field if you have a controller for it
                        // _destinationController?.text = suggestion.description!;
                        // Fire both distance/time and fare events
                        BlocProvider.of<GetDistanceTimeBloc>(context).add(
                          FetchDistanceTimeEvent(
                            origin: _pickupController.text,
                            destination: suggestion.description!,
                          ),
                        );
                        // Also fire fare event if you have a GetFareBloc
                        try {
                          BlocProvider.of<GetFareBloc>(context).add(
                            FetchFareEvent(
                              pickup: _pickupController.text,
                              destination: suggestion.description!,
                            ),
                          );
                        } catch (e) {
                          debugPrint('GetFareBloc not found: $e');
                        }
                        // Optionally, unfocus destination field to hide keyboard
                        widget.destinationFocusNode?.unfocus();

                        // Stepper flow: If both pickup and destination are set, move to vehicle selection
                        
                        final pickup = _pickupController.text;
                        final dropoff = suggestion.description!;
                        if (pickup.isNotEmpty && dropoff.isNotEmpty) {
                          final createRideRequest = CreateRideRequest(
                            pickupLocation: pickup,
                            dropoffLocation: dropoff,
                          );
                          BlocProvider.of<RideFlowCubit>(context).toVehicleSelection(createRideRequest);
                        }
                      }
                    },
                  );
                },
              );
            } else if (state is SuggestionEmptyState) {
              return Center(child: Text('No suggestions found.'));
            } else if (state is SuggestionInitialState) {
              return Center(child: Text('Start typing to see suggestions.'));
            } else if (state is SuggestionErrorState) {
              return Center(child: Text('Error: \\${state.error}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
