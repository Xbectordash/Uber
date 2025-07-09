import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uber_clone/features/homepage/data/create_ride_model.dart';
import 'package:uber_clone/features/homepage/data/ride_model.dart';
/// Enum defining each stage of the ride booking process
enum RideFlowStep {
  search,
  vehicleSelection,
  confirmation,
  confirmedByDriver, // ✅ New step
  rideStarted,
  rideCompleted,
}

/// State class representing data for each step
class RideFlowState extends Equatable {
  final RideFlowStep step;
  final CreateRideRequest? searchResult;   // pickup/dropoff/vehicleType
  final String? selectedVehicle;          // vehicle type string
  final String? selectedFare;             // selected fare
  final RideModel? confirmationData;           // ride data
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
    RideModel? confirmationData,
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
  List<Object?> get props => [
        step,
        searchResult,
        selectedVehicle,
        selectedFare,
        confirmationData,
        error,
      ];
}

/// Cubit to manage the full ride booking flow
class RideFlowCubit extends Cubit<RideFlowState> {
  RideFlowCubit() : super(const RideFlowState(step: RideFlowStep.search));

  /// Step 1: User selected pickup/dropoff → show vehicle options
  void toVehicleSelection(CreateRideRequest searchResult) {
    emit(state.copyWith(
      step: RideFlowStep.vehicleSelection,
      searchResult: searchResult,
      error: null,
    ));
  }

  /// Step 2: User selected a vehicle & fare → confirm screen
  void toConfirmation(String selectedVehicle, String selectedFare) {
    emit(state.copyWith(
      step: RideFlowStep.confirmation,
      selectedVehicle: selectedVehicle,
      selectedFare: selectedFare,
      error: null,
    ));
  }
  void rideStarted(RideModel confirmationData) {
    emit(state.copyWith(
      step: RideFlowStep.rideStarted,
      confirmationData: confirmationData,
      error: null,
    ));
  }

  /// Step 3: Driver has accepted → show waiting/accepted screen
  void toConfirmedByDriver(RideModel confirmationData) {
    emit(state.copyWith(
      step: RideFlowStep.confirmedByDriver,
      confirmationData: confirmationData,
      error: null,
    ));
  }

  /// Step 4: Ride created → show live ride tracking
  void toRideCreated(RideModel confirmationData) {
    emit(state.copyWith(
      step: RideFlowStep.rideStarted,
      confirmationData: confirmationData,
      error: null,
    ));
  }

  /// Step 5: Ride completed → show thank you or rate screen
  void toRideCompleted() {
    emit(state.copyWith(
      step: RideFlowStep.rideCompleted,
      error: null,
    ));
  }

  /// Go back to search step
  void backToSearch() {
    emit(const RideFlowState(step: RideFlowStep.search));
  }

  /// Set an error while staying in the current step
  void setError(String error) {
    emit(state.copyWith(error: error));
  }

  /// Full reset to initial state
  void resetFlow() {
    emit(const RideFlowState(step: RideFlowStep.search));
  }
}
