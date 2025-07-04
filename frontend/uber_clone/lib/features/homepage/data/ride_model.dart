class RideModel {
  final String id;
  final String userId;
  final String pickup;
  final String destination;
  final int fare;
  final String status;
  final String otp;
  final DateTime createdAt;
  final String captainId;
  final Captain captain;

  RideModel({
    required this.id,
    required this.userId,
    required this.pickup,
    required this.destination,
    required this.fare,
    required this.status,
    required this.otp,
    required this.createdAt,
    required this.captainId,
    required this.captain,
  });

  factory RideModel.fromJson(Map<String, dynamic> json) {
    return RideModel(
      id: json['_id'] ?? '',
      userId: json['user']?['_id'] ?? '',
      pickup: json['pickup'] ?? '',
      destination: json['destination'] ?? '',
      fare: json['fare'] ?? 0,
      status: json['status'] ?? '',
      otp: json['otp'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      captainId: json['captain']?['_id'] ?? '',
      captain: Captain.fromJson(json['captain'] ?? {}),
    );
  }
}

class Captain {
  final FullName fullname;
  final Vehicle vehicle;
  final Location location;
  final String id;
  final String email;
  final String status;
  final DateTime createdAt;
  final String socketId;

  Captain({
    required this.fullname,
    required this.vehicle,
    required this.location,
    required this.id,
    required this.email,
    required this.status,
    required this.createdAt,
    required this.socketId,
  });

  factory Captain.fromJson(Map<String, dynamic> json) {
    return Captain(
      fullname: FullName.fromJson(json['fullname'] ?? {}),
      vehicle: Vehicle.fromJson(json['vehicle'] ?? {}),
      location: Location.fromJson(json['location'] ?? {}),
      id: json['_id'] ?? '',
      email: json['email'] ?? '',
      status: json['status'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      socketId: json['socketId'] ?? '',
    );
  }
}

class FullName {
  final String firstname;
  final String lastname;

  FullName({
    required this.firstname,
    required this.lastname,
  });

  factory FullName.fromJson(Map<String, dynamic> json) {
    return FullName(
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
    );
  }
}

class Vehicle {
  final String color;
  final String plate;
  final int capacity;
  final String vehicleType;

  Vehicle({
    required this.color,
    required this.plate,
    required this.capacity,
    required this.vehicleType,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      color: json['color'] ?? '',
      plate: json['plate'] ?? '',
      capacity: json['capacity'] ?? 0,
      vehicleType: json['vehicleType'] ?? '',
    );
  }
}

class Location {
  final double ltd;
  final double lng;

  Location({
    required this.ltd,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      ltd: (json['ltd'] as num?)?.toDouble() ?? 0.0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
