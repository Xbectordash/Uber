class RideWithUser {
  final String id;
  final String userId;
  final String userFirstName;
  final String userLastName;
  final String userEmail;
  final String userSocketId;
  final String pickup;
  final String destination;
  final double fare;
  final String status;
  final DateTime? createdAt;

  RideWithUser({
    required this.id,
    required this.userId,
    required this.userFirstName,
    required this.userLastName,
    required this.userEmail,
    required this.userSocketId,
    required this.pickup,
    required this.destination,
    required this.fare,
    required this.status,
    this.createdAt,
  });

  factory RideWithUser.fromJson(Map<String, dynamic> json) {
    final user = json['userId'] ?? {};

    return RideWithUser(
      id: json['_id'] ?? '',
      userId: user['_id'] ?? '',
      userFirstName: user['fullname']?['firstname'] ?? '',
      userLastName: user['fullname']?['lastname'] ?? '',
      userEmail: user['email'] ?? '',
      userSocketId: user['socketId'] ?? '',
      pickup: json['pickup'] ?? '',
      destination: json['destination'] ?? '',
      fare: (json['fare'] ?? 0).toDouble(),
      status: json['status'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': {
        '_id': userId,
        'fullname': {
          'firstname': userFirstName,
          'lastname': userLastName,
        },
        'email': userEmail,
        'socketId': userSocketId,
      },
      'pickup': pickup,
      'destination': destination,
      'fare': fare,
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
