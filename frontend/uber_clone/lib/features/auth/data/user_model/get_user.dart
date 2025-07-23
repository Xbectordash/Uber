class GetUser {
  Fullname? _fullname;
  String? _sId;
  String? _email;
  int? _iV;

  GetUser({Fullname? fullname, String? sId, String? email, int? iV}) {
    if (fullname != null) {
      this._fullname = fullname;
    }
    if (sId != null) {
      this._sId = sId;
    }
    if (email != null) {
      this._email = email;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  Fullname? get fullname => _fullname;
  set fullname(Fullname? fullname) => _fullname = fullname;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get email => _email;
  set email(String? email) => _email = email;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  GetUser.fromJson(Map<String, dynamic> json) {
    _fullname = json['fullname'] != null
        ? new Fullname.fromJson(json['fullname'])
        : null;
    _sId = json['_id'];
    _email = json['email'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._fullname != null) {
      data['fullname'] = this._fullname!.toJson();
    }
    data['_id'] = this._sId;
    data['email'] = this._email;
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
