// register user request model
class RegisterUserRequest {
  String? _firstname;
  String? _lastname;
  String? _email;
  String? _password;

  RegisterUserRequest({
    String? firstname,
    String? lastname,
    String? email,
    String? password,
  }) {
    if (firstname != null) {
      this._firstname = firstname;
    }
    if (lastname != null) {
      this._lastname = lastname;
    }
    if (email != null) {
      this._email = email;
    }
    if (password != null) {
      this._password = password;
    }
  }

  String? get firstname => _firstname;
  set firstname(String? firstname) => _firstname = firstname;
  String? get lastname => _lastname;
  set lastname(String? lastname) => _lastname = lastname;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get password => _password;
  set password(String? password) => _password = password;

  RegisterUserRequest.fromJson(Map<String, dynamic> json) {
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _email = json['email'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['email'] = this._email;
    data['password'] = this._password;
    return data;
  }
}





// register user response model
class RegisterUserResponse {
  String? _message;
  User? _user;
  String? _token;

  RegisterUserResponse({String? message, User? user, String? token}) {
    if (message != null) {
      this._message = message;
    }
    if (user != null) {
      this._user = user;
    }
    if (token != null) {
      this._token = token;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  User? get user => _user;
  set user(User? user) => _user = user;
  String? get token => _token;
  set token(String? token) => _token = token;

  RegisterUserResponse.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    data['token'] = this._token;
    return data;
  }
}

class User {
  String? _id;
  Fullname? _fullname;
  String? _email;

  User({String? id, Fullname? fullname, String? email}) {
    if (id != null) {
      this._id = id;
    }
    if (fullname != null) {
      this._fullname = fullname;
    }
    if (email != null) {
      this._email = email;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  Fullname? get fullname => _fullname;
  set fullname(Fullname? fullname) => _fullname = fullname;
  String? get email => _email;
  set email(String? email) => _email = email;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _fullname = json['fullname'] != null
        ? new Fullname.fromJson(json['fullname'])
        : null;
    _email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._fullname != null) {
      data['fullname'] = this._fullname!.toJson();
    }
    data['email'] = this._email;
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
