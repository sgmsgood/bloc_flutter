import 'package:test_getx/api/response/response_oauth.dart';

class AuthEntity {
  String userToken;
  String id;
  String email;
  String name;
  int registrationTimestamp;
  int updateTimestamp;
  int level;
  int deviceType;
  String dateOfBirth;
  String picture;
  String gender;
  String nationCode;
  String mobile;
  String tel;
  String zipCode;
  String bio;
  String state;
  String city;
  String address;

  AuthEntity(
      {this.userToken,
      this.id,
      this.email,
      this.name,
      this.registrationTimestamp,
      this.updateTimestamp,
      this.level = 0,
      this.deviceType,
      this.dateOfBirth = '',
      this.picture = '',
      this.gender = '',
      this.nationCode = '82',
      this.mobile = '',
      this.tel = '',
      this.zipCode = '',
      this.bio = '',
      this.state = '',
      this.city = '',
      this.address = ''});

  factory AuthEntity.fromResponse(ResponseOauth response) {
    var user = response.user;
    var userToken = response.userToken;

    return AuthEntity(
        userToken: userToken,
        id: user.id,
        email: user.email,
        name: user.name,
        registrationTimestamp: user.registrationTimestamp,
        updateTimestamp: user.updateTimestamp,
        level: user.level,
        deviceType: user.deviceType,
        picture: user.picture,
        gender: user.gender,
        nationCode: user.nationCode,
        mobile: user.mobile,
        tel: user.tel,
        zipCode: user.zipCode,
        bio: user.bio,
        state: user.state,
        city: user.city,
        address: user.address);
  }

  factory AuthEntity.fromMap(Map<String, dynamic> map) {
    return new AuthEntity(
      userToken: map['userToken'] as String,
      id: map['id'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      registrationTimestamp: map['registrationTimestamp'] as int,
      updateTimestamp: map['updateTimestamp'] as int,
      level: map['level'] as int,
      deviceType: map['deviceType'] as int,
      picture: map['picture'] as String,
      gender: map['gender'] as String,
      nationCode: map['nationCode'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      mobile: map['mobile'] as String,
      tel: map['tel'] as String,
      zipCode: map['zipCode'] as String,
      bio: map['bio'] as String,
      state: map['state'] as String,
      city: map['city'] as String,
      address: map['address'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userToken': this.userToken,
      'id': this.id,
      'email': this.email,
      'name': this.name,
      'registrationTimestamp': this.registrationTimestamp,
      'updateTimestamp': this.updateTimestamp,
      'level': this.level,
      'deviceType': this.deviceType,
      'picture': this.picture,
      'gender': this.gender,
      'nationCode': this.nationCode,
      'dateOfBirth': this.dateOfBirth,
      'mobile': this.mobile,
      'tel': this.tel,
      'zipCode': this.zipCode,
      'bio': this.bio,
      'state': this.state,
      'city': this.city,
      'address': this.address,
    };
  }

  @override
  String toString() {
    return '''
      AuthEntity: userToken: $userToken, id: $id, email: $email, name: $name, registrationTimestamp: $registrationTimestamp, updateTimestamp: $updateTimestamp, level: $level, deviceType: $deviceType, picture: $picture, gender: $gender, nationCode: $nationCode, dateOfBirth: $dateOfBirth, mobile: $mobile, tel: $tel, zipCode: $zipCode, bio: $bio, state: $state, city: $city, address: $address    
    ''';
  }
}

enum OAuthProviderType { google, apple }

extension ParseString on OAuthProviderType {
  String parseString() {
    switch (this) {
      case OAuthProviderType.google:
        return "google";
      case OAuthProviderType.apple:
        return "apple";
      default:
        return "none";
    }
  }
}
