class GetFare {
  String? _message;
  Fare? _fare;

  GetFare({String? message, Fare? fare}) {
    if (message != null) {
      this._message = message;
    }
    if (fare != null) {
      this._fare = fare;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  Fare? get fare => _fare;
  set fare(Fare? fare) => _fare = fare;

  GetFare.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _fare = json['fare'] != null ? new Fare.fromJson(json['fare']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    if (this._fare != null) {
      data['fare'] = this._fare!.toJson();
    }
    return data;
  }
}

class Fare {
  int? _auto;
  int? _car;
  int? _moto;

  Fare({int? auto, int? car, int? moto}) {
    if (auto != null) {
      this._auto = auto;
    }
    if (car != null) {
      this._car = car;
    }
    if (moto != null) {
      this._moto = moto;
    }
  }

  int? get auto => _auto;
  set auto(int? auto) => _auto = auto;
  int? get car => _car;
  set car(int? car) => _car = car;
  int? get moto => _moto;
  set moto(int? moto) => _moto = moto;

  Fare.fromJson(Map<String, dynamic> json) {
    _auto = json['auto'];
    _car = json['car'];
    _moto = json['moto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auto'] = this._auto;
    data['car'] = this._car;
    data['moto'] = this._moto;
    return data;
  }
}
