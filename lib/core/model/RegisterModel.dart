/// first_name : ""
/// last_name : ""
/// email : ""
/// password : ""
/// password_confirmation : ""

class RegisterModel {
  RegisterModel({
      String? firstName, 
      String? lastName, 
      String? email, 
      String? password, 
      String? passwordConfirmation,}){
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _password = password;
    _passwordConfirmation = passwordConfirmation;
}

  RegisterModel.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
  }
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _password;
  String? _passwordConfirmation;
RegisterModel copyWith({  String? firstName,
  String? lastName,
  String? email,
  String? password,
  String? passwordConfirmation,
}) => RegisterModel(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  password: password ?? _password,
  passwordConfirmation: passwordConfirmation ?? _passwordConfirmation,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get password => _password;
  String? get passwordConfirmation => _passwordConfirmation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['password'] = _password;
    map['password_confirmation'] = _passwordConfirmation;
    return map;
  }

}