import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uber_clone/features/homepage/data/create_ride_model.dart';


// Enum for ride flow steps
enum RideFlowStep {
  search,
  vehicleSelection,
  confirmation,
  rideCreated,
  rideCompleted,
}

// State for the RideFlowCubit
class RideFlowState extends Equatable {
  final RideFlowStep step;
  final CreateRideRequest? searchResult; // Holds pickup/dropoff/vehicleType
  final String? selectedVehicle; // Vehicle type string
  final String? selectedFare; // Fare for selected vehicle
  final Ride? confirmationData; // Ride object after creation
  final String? error;

  const RideFlowState({
    required this.step,
    this.searchResult,
    this.selectedVehicle,
    this.selectedFare,
    this.confirmationData,
    this.error,
  });

  RideFlowState copyWith({
    RideFlowStep? step,
    CreateRideRequest? searchResult,
    String? selectedVehicle,
    String? selectedFare,
    Ride? confirmationData,
    String? error,
  }) {
    return RideFlowState(
      step: step ?? this.step,
      searchResult: searchResult ?? this.searchResult,
      selectedVehicle: selectedVehicle ?? this.selectedVehicle,
      selectedFare: selectedFare ?? this.selectedFare,
      confirmationData: confirmationData ?? this.confirmationData,
      error: error,
    );
  }

  @override
  List<Object?> get props => [step, searchResult, selectedVehicle, selectedFare, confirmationData, error];
}

/// Cubit to manage the ride flow stepper
class RideFlowCubit extends Cubit<RideFlowState> {
  RideFlowCubit() : super(const RideFlowState(step: RideFlowStep.search));

  /// Move to vehicle selection step with search result (pickup/dropoff)
  void toVehicleSelection(CreateRideRequest searchResult) {
    emit(state.copyWith(step: RideFlowStep.vehicleSelection, searchResult: searchResult, error: null));
  }

  /// Move to confirmation step with selected vehicle type and fare
  void toConfirmation(String selectedVehicle, String selectedFare) {
    emit(state.copyWith(step: RideFlowStep.confirmation, selectedVehicle: selectedVehicle, selectedFare: selectedFare, error: null));
  }

  /// Move to ride created step with ride data
  void toRideCreated(Ride confirmationData) {
    emit(state.copyWith(step: RideFlowStep.rideCreated, confirmationData: confirmationData, error: null));
  }
  /// Move to completed step after ride creation
  void toRideCompleted() {
    emit(state.copyWith(step: RideFlowStep.rideCompleted, error: null));
  }

  /// Go back to search step and clear errors
  void backToSearch() {
    emit(const RideFlowState(step: RideFlowStep.search));
  }

  /// Set error message (does not change step)
  void setError(String error) {
    emit(state.copyWith(error: error));
  }

  /// Reset the entire flow to initial state
  void resetFlow() {
    emit(const RideFlowState(step: RideFlowStep.search));
  }

}
