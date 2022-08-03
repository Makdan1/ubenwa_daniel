/// data : {"type":"newborns","attributes":{"name":"ife","gestation":"2021-08-26T12:04:50.821Z","gender":"male"}}

class CreateNewBornModel {
  CreateNewBornModel({
      Data? data,}){
    _data = data;
}

  CreateNewBornModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;
CreateNewBornModel copyWith({  Data? data,
}) => CreateNewBornModel(  data: data ?? _data,
);
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// type : "newborns"
/// attributes : {"name":"ife","gestation":"2021-08-26T12:04:50.821Z","gender":"male"}

class Data {
  Data({
      String? type, 
      Attributes? attributes,}){
    _type = type;
    _attributes = attributes;
}

  Data.fromJson(dynamic json) {
    _type = json['type'];
    _attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
  }
  String? _type;
  Attributes? _attributes;
Data copyWith({  String? type,
  Attributes? attributes,
}) => Data(  type: type ?? _type,
  attributes: attributes ?? _attributes,
);
  String? get type => _type;
  Attributes? get attributes => _attributes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    if (_attributes != null) {
      map['attributes'] = _attributes?.toJson();
    }
    return map;
  }

}

/// name : "ife"
/// gestation : "2021-08-26T12:04:50.821Z"
/// gender : "male"

class Attributes {
  Attributes({
      String? name, 
      String? gestation, 
      String? gender,}){
    _name = name;
    _gestation = gestation;
    _gender = gender;
}

  Attributes.fromJson(dynamic json) {
    _name = json['name'];
    _gestation = json['gestation'];
    _gender = json['gender'];
  }
  String? _name;
  String? _gestation;
  String? _gender;
Attributes copyWith({  String? name,
  String? gestation,
  String? gender,
}) => Attributes(  name: name ?? _name,
  gestation: gestation ?? _gestation,
  gender: gender ?? _gender,
);
  String? get name => _name;
  String? get gestation => _gestation;
  String? get gender => _gender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['gestation'] = _gestation;
    map['gender'] = _gender;
    return map;
  }

}