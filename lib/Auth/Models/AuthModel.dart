class AuthModel {
  final String userid;
  final String phone;
  final String username;
  final String password;
  final String userProfile;
  final String bio;
  // final String lastSeen;
  // final bool online;

  AuthModel({
    this.userid,
    this.phone,
    this.password,
    this.username,
    this.userProfile,
    this.bio,
    // required this.lastSeen,
    // required this.online
  });

  factory AuthModel.fromJson(dynamic json) {
    return AuthModel(
        userid: json["userid"],
        phone: json["phone"],
        username: json["username"] ?? " ",
        userProfile: json["userProfile"] ?? " ",
        bio: json["bio"] ?? " ");
    // lastSeen: json["lastSeen"],
    // online: json["online"]);
  }

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "phone": phone,
        "username": username,
        "userProfile": userProfile,
        "bio": bio
      };
}
