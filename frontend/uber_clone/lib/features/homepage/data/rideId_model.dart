class RideIdModel {
	String? rideId;

	RideIdModel({this.rideId});

	RideIdModel.fromJson(Map<String, dynamic> json) {
		rideId = json['rideId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['rideId'] = this.rideId;
		return data;
	}
}
