class GetCaptain {
  Captain? _captain;

  GetCaptain({Captain? captain}) {
    if (captain != null) {
      this._captain = captain;
    }
  }

  Captain? get captain => _captain;
  set captain(Captain? captain) => _captain = captain;

  GetCaptain.fromJson(Map<String, dynamic> json) {
    _captain = json['captain'] != null
        ? new Captain.fromJson(json['captain'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._captain != null) {
      data['captain'] = this._captain!.toJson();
    }
    return data;
  }
}

class Captain {
  Fullname? _fullname;
  Vehicle? _vehicle;
  String? _sId;
  String? _email;
  String? _status;
  String? _createdAt;
  int? _iV;

  Captain({
    Fullname? fullname,
    Vehicle? vehicle,
    String? sId,
    String? email,
    String? status,
    String? createdAt,
    int? iV,
  }) {
    if (fullname != null) {
      this._fullname = fullname;
    }
    if (vehicle != null) {
      this._vehicle = vehicle;
    }
    if (sId != null) {
      this._sId = sId;
    }
    if (email != null) {
      this._email = email;
    }
    if (status != null) {
      this._status = status;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  Fullname? get fullname => _fullname;
  set fullname(Fullname? fullname) => _fullname = fullname;
  Vehicle? get vehicle => _vehicle;
  set vehicle(Vehicle? vehicle) => _vehicle = vehicle;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  Captain.fromJson(Map<String, dynamic> json) {
    _fullname = json['fullname'] != null
        ? new Fullname.fromJson(json['fullname'])
        : null;
    _vehicle = json['vehicle'] != null
        ? new Vehicle.fromJson(json['vehicle'])
        : null;
    _sId = json['_id'];
    _email = json['email'];
    _status = json['status'];
    _createdAt = json['createdAt'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._fullname != null) {
      data['fullname'] = this._fullname!.toJson();
    }
    if (this._vehicle != null) {
      data['vehicle'] = this._vehicle!.toJson();
    }
    data['_id'] = this._sId;
    data['email'] = this._email;
    data['status'] = this._status;
    data['createdAt'] = this._createdAt;
    data['__v'] = this._iV;
    return data;
  }
}

class Fullname {
  String? _firstname;
  String? _lastname;

  Fullname({String? firstname, String? lastname}) {
    if (firstname != null) {
      this._firstname = firstname;
    }
    if (lastname != null) {
      this._lastname = lastname;
    }
  }

  String? get firstname => _firstname;
  set firstname(String? firstname) => _firstname = firstname;
  String? get lastname => _lastname;
  set lastname(String? lastname) => _lastname = lastname;

  Fullname.fromJson(Map<String, dynamic> json) {
    _firstname = json['firstname'];
    _lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    return data;
  }
}

class Vehicle {
  String? _color;
  String? _plate;
  int? _capacity;
  String? _vehicleType;

  Vehicle({String? color, String? plate, int? capacity, String? vehicleType}) {
    if (color != null) {
      this._color = color;
    }
    if (plate != null) {
      this._plate = plate;
    }
    if (capacity != null) {
      this._capacity = capacity;
    }
    if (vehicleType != null) {
      this._vehicleType = vehicleType;
    }
  }

  String? get color => _color;
  set color(String? color) => _color = color;
  String? get plate => _plate;
  set plate(String? plate) => _plate = plate;
  int? get capacity => _capacity;
  set capacity(int? capacity) => _capacity = capacity;
  String? get vehicleType => _vehicleType;
  set vehicleType(String? vehicleType) => _vehicleType = vehicleType;

  Vehicle.fromJson(Map<String, dynamic> json) {
    _color = json['color'];
    _plate = json['plate'];
    _capacity = json['capacity'];
    _vehicleType = json['vehicleType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this._color;
    data['plate'] = this._plate;
    data['capacity'] = this._capacity;
    data['vehicleType'] = this._vehicleType;
    return data;
  }
}
