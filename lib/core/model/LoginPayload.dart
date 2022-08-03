/// phone : "08169545791"
/// password : "1234"
/// rememberMe : true

class LoginPayload {
  LoginPayload({
      String? phone, 
      String? password,}){
    _phone = phone;
    _password = password;
}

  LoginPayload.fromJson(dynamic json) {
    _phone = json['email'];
    _password = json['password'];
  }
  String? _phone;
  String? _password;
LoginPayload copyWith({  String? phone,
  String? password,
  bool? rememberMe,
}) => LoginPayload(  phone: phone ?? _phone,
  password: password ?? _password,
);
  String? get phone => _phone;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _phone;
    map['password'] = _password;
    return map;
  }

}