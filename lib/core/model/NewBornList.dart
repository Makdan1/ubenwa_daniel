/// id : "826"
/// type : "newborns"
/// links : {"self":"https://ubenwa-cat-api-stage.herokuapp.com/api/v1/newborns/826"}
/// attributes : {"gender":"male","gestation":"2022-07-26T03:01:24.444Z","first_cry_push_date":null,"name":"John","user_id":13,"created_at":"2022-08-02T14:41:40.949Z","updated_at":"2022-08-02T14:41:40.949Z"}

class NewBornList {
  NewBornList({
      String? id, 
      String? type, 
      Links? links, 
      Attributes? attributes,}){
    _id = id;
    _type = type;
    _links = links;
    _attributes = attributes;
}

  NewBornList.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
  }
  String? _id;
  String? _type;
  Links? _links;
  Attributes? _attributes;
NewBornList copyWith({  String? id,
  String? type,
  Links? links,
  Attributes? attributes,
}) => NewBornList(  id: id ?? _id,
  type: type ?? _type,
  links: links ?? _links,
  attributes: attributes ?? _attributes,
);
  String? get id => _id;
  String? get type => _type;
  Links? get links => _links;
  Attributes? get attributes => _attributes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    if (_links != null) {
      map['links'] = _links?.toJson();
    }
    if (_attributes != null) {
      map['attributes'] = _attributes?.toJson();
    }
    return map;
  }

}

/// gender : "male"
/// gestation : "2022-07-26T03:01:24.444Z"
/// first_cry_push_date : null
/// name : "John"
/// user_id : 13
/// created_at : "2022-08-02T14:41:40.949Z"
/// updated_at : "2022-08-02T14:41:40.949Z"

class Attributes {
  Attributes({
      String? gender, 
      String? gestation, 
      dynamic firstCryPushDate, 
      String? name, 
      int? userId, 
      String? createdAt, 
      String? updatedAt,}){
    _gender = gender;
    _gestation = gestation;
    _firstCryPushDate = firstCryPushDate;
    _name = name;
    _userId = userId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Attributes.fromJson(dynamic json) {
    _gender = json['gender'];
    _gestation = json['gestation'];
    _firstCryPushDate = json['first_cry_push_date'];
    _name = json['name'];
    _userId = json['user_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _gender;
  String? _gestation;
  dynamic _firstCryPushDate;
  String? _name;
  int? _userId;
  String? _createdAt;
  String? _updatedAt;
Attributes copyWith({  String? gender,
  String? gestation,
  dynamic firstCryPushDate,
  String? name,
  int? userId,
  String? createdAt,
  String? updatedAt,
}) => Attributes(  gender: gender ?? _gender,
  gestation: gestation ?? _gestation,
  firstCryPushDate: firstCryPushDate ?? _firstCryPushDate,
  name: name ?? _name,
  userId: userId ?? _userId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get gender => _gender;
  String? get gestation => _gestation;
  dynamic get firstCryPushDate => _firstCryPushDate;
  String? get name => _name;
  int? get userId => _userId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gender'] = _gender;
    map['gestation'] = _gestation;
    map['first_cry_push_date'] = _firstCryPushDate;
    map['name'] = _name;
    map['user_id'] = _userId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// self : "https://ubenwa-cat-api-stage.herokuapp.com/api/v1/newborns/826"

class Links {
  Links({
      String? self,}){
    _self = self;
}

  Links.fromJson(dynamic json) {
    _self = json['self'];
  }
  String? _self;
Links copyWith({  String? self,
}) => Links(  self: self ?? _self,
);
  String? get self => _self;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['self'] = _self;
    return map;
  }

}