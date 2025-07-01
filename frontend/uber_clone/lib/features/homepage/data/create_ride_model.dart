// This class represents the request body for creating a ride.
class CreateRideRequest {
  String? _pickupLocation;
  String? _dropoffLocation;
  String? _vehicleType;

  CreateRideRequest(
      {String? pickupLocation, String? dropoffLocation, String? vehicleType}) {
    if (pickupLocation != null) {
      this._pickupLocation = pickupLocation;
    }
    if (dropoffLocation != null) {
      this._dropoffLocation = dropoffLocation;
    }
    if (vehicleType != null) {
      this._vehicleType = vehicleType;
    }
  }

  String? get pickupLocation => _pickupLocation;
  set pickupLocation(String? pickupLocation) =>
      _pickupLocation = pickupLocation;
  String? get dropoffLocation => _dropoffLocation;
  set dropoffLocation(String? dropoffLocation) =>
      _dropoffLocation = dropoffLocation;
  String? get vehicleType => _vehicleType;
  set vehicleType(String? vehicleType) => _vehicleType = vehicleType;

  CreateRideRequest.fromJson(Map<String, dynamic> json) {
    _pickupLocation = json['pickupLocation'];
    _dropoffLocation = json['dropoffLocation'];
    _vehicleType = json['vehicleType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pickupLocation'] = this._pickupLocation;
    data['dropoffLocation'] = this._dropoffLocation;
    data['vehicleType'] = this._vehicleType;
    return data;
  }
}

// This class represents the response body for creating a ride.

class CreateRideResponse {
  String? _message;
  Ride? _ride;

  CreateRideResponse({String? message, Ride? ride}) {
    if (message != null) {
      this._message = message;
    }
    if (ride != null) {
      this._ride = ride;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  Ride? get ride => _ride;
  set ride(Ride? ride) => _ride = ride;

  CreateRideResponse.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _ride = json['ride'] != null ? new Ride.fromJson(json['ride']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    if (this._ride != null) {
      data['ride'] = this._ride!.toJson();
    }
    return data;
  }
}

class Ride {
  String? _userId;
  String? _pickup;
  String? _destination;
  int? _fare;
  String? _status;
  String? _otp;
  String? _sId;
  String? _createdAt;
  int? _iV;

  Ride(
      {String? userId,
      String? pickup,
      String? destination,
      int? fare,
      String? status,
      String? otp,
      String? sId,
      String? createdAt,
      int? iV}) {
    if (userId != null) {
      this._userId = userId;
    }
    if (pickup != null) {
      this._pickup = pickup;
    }
    if (destination != null) {
      this._destination = destination;
    }
    if (fare != null) {
      this._fare = fare;
    }
    if (status != null) {
      this._status = status;
    }
    if (otp != null) {
      this._otp = otp;
    }
    if (sId != null) {
      this._sId = sId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  String? get userId => _userId;
  set userId(String? userId) => _userId = userId;
  String? get pickup => _pickup;
  set pickup(String? pickup) => _pickup = pickup;
  String? get destination => _destination;
  set destination(String? destination) => _destination = destination;
  int? get fare => _fare;
  set fare(int? fare) => _fare = fare;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get otp => _otp;
  set otp(String? otp) => _otp = otp;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Ride.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _pickup = json['pickup'];
    _destination = json['destination'];
    _fare = json['fare'];
    _status = json['status'];
    _otp = json['otp'];
    _sId = json['_id'];
    _createdAt = json['createdAt'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this._userId;
    data['pickup'] = this._pickup;
    data['destination'] = this._destination;
    data['fare'] = this._fare;
    data['status'] = this._status;
    data['otp'] = this._otp;
    data['_id'] = this._sId;
    data['createdAt'] = this._createdAt;
    data['__v'] = this._iV;
    return data;
  }
}



