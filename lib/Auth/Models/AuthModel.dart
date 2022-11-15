class AuthModel {
  final String userid;
  final String email;
  final String username;
  final String password;
  final String userProfile;
  final String bio;
  final String createdOn;
  // final String lastSeen;
  // final bool online;

  AuthModel({
    this.userid,
    this.email,
    this.password,
    this.username,
    this.userProfile,
    this.bio,
    this.createdOn,
    // required this.lastSeen,
    // required this.online
  });

  factory AuthModel.fromJson(dynamic json) {
    return AuthModel(
        userid: json["userid"],
        email: json["email"],
        username: json["username"] ?? " ",
        userProfile: json["userProfile"] ?? " ",
        bio: json["bio"] ?? " ");
    // lastSeen: json["lastSeen"],
    // online: json["online"]);
  }

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "email": email,
        "username": username,
        "userProfile": userProfile,
        "bio": bio
      };
}
