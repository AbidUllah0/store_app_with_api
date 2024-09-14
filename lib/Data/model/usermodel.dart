/// id : 1
/// email : "john@mail.com"
/// password : "changeme"
/// name : "Jhon"
/// role : "customer"
/// avatar : "https://i.imgur.com/LDOO4Qs.jpg"
/// creationAt : "2023-11-10T05:27:11.000Z"
/// updatedAt : "2023-11-10T05:27:11.000Z"

class UserModel {
  UserModel({
    num? id,
    String? email,
    String? password,
    String? name,
    String? role,
    String? avatar,
    String? creationAt,
    String? updatedAt,
  }) {
    _id = id;
    _email = email;
    _password = password;
    _name = name;
    _role = role;
    _avatar = avatar;
    _creationAt = creationAt;
    _updatedAt = updatedAt;
  }

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _password = json['password'];
    _name = json['name'];
    _role = json['role'];
    _avatar = json['avatar'];
    _creationAt = json['creationAt'];
    _updatedAt = json['updatedAt'];
  }
  num? _id;
  String? _email;
  String? _password;
  String? _name;
  String? _role;
  String? _avatar;
  String? _creationAt;
  String? _updatedAt;
  UserModel copyWith({
    num? id,
    String? email,
    String? password,
    String? name,
    String? role,
    String? avatar,
    String? creationAt,
    String? updatedAt,
  }) =>
      UserModel(
        id: id ?? _id,
        email: email ?? _email,
        password: password ?? _password,
        name: name ?? _name,
        role: role ?? _role,
        avatar: avatar ?? _avatar,
        creationAt: creationAt ?? _creationAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num? get id => _id;
  String? get email => _email;
  String? get password => _password;
  String? get name => _name;
  String? get role => _role;
  String? get avatar => _avatar;
  String? get creationAt => _creationAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['password'] = _password;
    map['name'] = _name;
    map['role'] = _role;
    map['avatar'] = _avatar;
    map['creationAt'] = _creationAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
