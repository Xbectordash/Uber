class GetDistanceTime {
  String? _message;
  DistanceTime? _distanceTime;

  GetDistanceTime({String? message, DistanceTime? distanceTime}) {
    if (message != null) {
      this._message = message;
    }
    if (distanceTime != null) {
      this._distanceTime = distanceTime;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  DistanceTime? get distanceTime => _distanceTime;
  set distanceTime(DistanceTime? distanceTime) => _distanceTime = distanceTime;

  GetDistanceTime.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _distanceTime = json['distanceTime'] != null
        ? new DistanceTime.fromJson(json['distanceTime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    if (this._distanceTime != null) {
      data['distanceTime'] = this._distanceTime!.toJson();
    }
    return data;
  }
}

class DistanceTime {
  Distance? _distance;
  Distance? _duration;

  DistanceTime({Distance? distance, Distance? duration}) {
    if (distance != null) {
      this._distance = distance;
    }
    if (duration != null) {
      this._duration = duration;
    }
  }

  Distance? get distance => _distance;
  set distance(Distance? distance) => _distance = distance;
  Distance? get duration => _duration;
  set duration(Distance? duration) => _duration = duration;

  DistanceTime.fromJson(Map<String, dynamic> json) {
    _distance = json['distance'] != null
        ? new Distance.fromJson(json['distance'])
        : null;
    _duration = json['duration'] != null
        ? new Distance.fromJson(json['duration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._distance != null) {
      data['distance'] = this._distance!.toJson();
    }
    if (this._duration != null) {
      data['duration'] = this._duration!.toJson();
    }
    return data;
  }
}

class Distance {
  String? _text;
  int? _value;

  Distance({String? text, int? value}) {
    if (text != null) {
      this._text = text;
    }
    if (value != null) {
      this._value = value;
    }
  }

  String? get text => _text;
  set text(String? text) => _text = text;
  int? get value => _value;
  set value(int? value) => _value = value;

  Distance.fromJson(Map<String, dynamic> json) {
    _text = json['text'];
    _value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this._text;
    data['value'] = this._value;
    return data;
  }
}
