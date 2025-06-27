// captain login request 
class CaptainLoginRequest {
  String? _email;
  String? _password;

  CaptainLoginRequest({String? email, String? password}) {
    if (email != null) {
      this._email = email;
    }
    if (password != null) {
      this._password = password;
    }
  }

  String? get email => _email;
  set email(String? email) => _email = email;
  String? get password => _password;
  set password(String? password) => _password = password;

  CaptainLoginRequest.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this._email;
    data['password'] = this._password;
    return data;
  }
}



// captain login response
class CaptaiLoginResponse {
  String? _message;
  Captain? _captain;
  String? _token;

  CaptaiLoginResponse({String? message, Captain? captain, String? token}) {
    if (message != null) {
      this._message = message;
    }
    if (captain != null) {
      this._captain = captain;
    }
    if (token != null) {
      this._token = token;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  Captain? get captain => _captain;
  set captain(Captain? captain) => _captain = captain;
  String? get token => _token;
  set token(String? token) => _token = token;

  CaptaiLoginResponse.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _captain = json['captain'] != null
        ? new Captain.fromJson(json['captain'])
        : null;
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    if (this._captain != null) {
      data['captain'] = this._captain!.toJson();
    }
    data['token'] = this._token;
    return data;
  }
}

class Captain {
  String? _id;
  Fullname? _fullname;
  String? _email;
  Vehicle? _vehicle;

  Captain({String? id, Fullname? fullname, String? email, Vehicle? vehicle}) {
    if (id != null) {
      this._id = id;
    }
    if (fullname != null) {
      this._fullname = fullname;
    }
    if (email != null) {
      this._email = email;
    }
    if (vehicle != null) {
      this._vehicle = vehicle;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  Fullname? get fullname => _fullname;
  set fullname(Fullname? fullname) => _fullname = fullname;
  String? get email => _email;
  set email(String? email) => _email = email;
  Vehicle? get vehicle => _vehicle;
  set vehicle(Vehicle? vehicle) => _vehicle = vehicle;

  Captain.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _fullname = json['fullname'] != null
        ? new Fullname.fromJson(json['fullname'])
        : null;
    _email = json['email'];
    _vehicle = json['vehicle'] != null
        ? new Vehicle.fromJson(json['vehicle'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._fullname != null) {
      data['fullname'] = this._fullname!.toJson();
    }
    data['email'] = this._email;
    if (this._vehicle != null) {
      data['vehicle'] = this._vehicle!.toJson();
    }
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
