import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uber_clone/features/auth/data/captain_model/get_captain.dart';
import 'package:uber_clone/features/homepage/data/ride_with_user_model.dart';

/// Enum representing steps in the driver's ride flow
enum DriverSideStep {
  idle,
  rideRequested,
  forConfirmingOtp
}

/// State class representing the current step and ride/captain data
class DriverSideFlowState extends Equatable {
  final DriverSideStep step;
  final RideWithUser? rideData;
  final GetCaptain? captainData;

  const DriverSideFlowState({
    required this.step,
    this.rideData,
    this.captainData,
  });

  DriverSideFlowState copyWith({
    DriverSideStep? step,
    RideWithUser? rideData,
    GetCaptain? captainData,
  }) {
    return DriverSideFlowState(
      step: step ?? this.step,
      rideData: rideData ?? this.rideData,
      captainData: captainData ?? this.captainData,
    );
  }

  @override
  List<Object?> get props => [step, rideData, captainData];
}

/// Cubit class to manage driver side ride flow
class DriverSideFlowCubit extends Cubit<DriverSideFlowState> {
  DriverSideFlowCubit()
      : super(const DriverSideFlowState(step: DriverSideStep.idle));

  /// Set captain data once it's fetched
  void setCaptainData(GetCaptain captainData) {
    emit(state.copyWith(captainData: captainData));
  }

  /// Move to ride requested step
  void toRideRequested(RideWithUser rideData) {
    emit(state.copyWith(
      step: DriverSideStep.rideRequested,
      rideData: rideData,
    ));
  }
  void toConfirmingOtp(){
        emit(state.copyWith(
      step: DriverSideStep.forConfirmingOtp,

    ));

  }

  /// Reset to idle step while retaining captain data
  void reset() {
    emit(DriverSideFlowState(
      step: DriverSideStep.idle,
      captainData: state.captainData,
    ));
  }
}
