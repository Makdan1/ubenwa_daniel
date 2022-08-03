/// token : "eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTk0NDg3MzIsImV4cCI6MTcyMjM0NzkzMiwic3ViIjoxM30.n5_a0zhmD5AjUPPHg0ATZGqWxDWNnVMZkd0wNVmgH2M"
/// user_id : 13
/// user_info : {"first_name":"John","last_name":"","email":"test@gmail.com","user_consent":false,"is_active_listening":true,"newborn":null}

class SignInResponse {
  SignInResponse({
      String? token, 
      int? userId, 
      UserInfo? userInfo,}){
    _token = token;
    _userId = userId;
    _userInfo = userInfo;
}

  SignInResponse.fromJson(dynamic json) {
    _token = json['token'];
    _userId = json['user_id'];
    _userInfo = json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
  }
  String? _token;
  int? _userId;
  UserInfo? _userInfo;
  SignInResponse copyWith({  String? token,
  int? userId,
  UserInfo? userInfo,
}) => SignInResponse(  token: token ?? _token,
  userId: userId ?? _userId,
  userInfo: userInfo ?? _userInfo,
);
  String? get token => _token;
  int? get userId => _userId;
  UserInfo? get userInfo => _userInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['user_id'] = _userId;
    if (_userInfo != null) {
      map['user_info'] = _userInfo?.toJson();
    }
    return map;
  }

}

/// first_name : "John"
/// last_name : ""
/// email : "test@gmail.com"
/// user_consent : false
/// is_active_listening : true
/// newborn : null

class UserInfo {
  UserInfo({
      String? firstName, 
      String? lastName, 
      String? email, 
      bool? userConsent, 
      bool? isActiveListening, 
      dynamic newborn,}){
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _userConsent = userConsent;
    _isActiveListening = isActiveListening;
    _newborn = newborn;
}

  UserInfo.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _userConsent = json['user_consent'];
    _isActiveListening = json['is_active_listening'];
    _newborn = json['newborn'];
  }
  String? _firstName;
  String? _lastName;
  String? _email;
  bool? _userConsent;
  bool? _isActiveListening;
  dynamic _newborn;
UserInfo copyWith({  String? firstName,
  String? lastName,
  String? email,
  bool? userConsent,
  bool? isActiveListening,
  dynamic newborn,
}) => UserInfo(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  userConsent: userConsent ?? _userConsent,
  isActiveListening: isActiveListening ?? _isActiveListening,
  newborn: newborn ?? _newborn,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  bool? get userConsent => _userConsent;
  bool? get isActiveListening => _isActiveListening;
  dynamic get newborn => _newborn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['user_consent'] = _userConsent;
    map['is_active_listening'] = _isActiveListening;
    map['newborn'] = _newborn;
    return map;
  }

}