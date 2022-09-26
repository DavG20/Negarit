import 'package:http/http.dart' as http;
import 'package:negarit/libs.dart';

class AuthDataProvider {
  final http.Client httpClient;
  static const _baseUrl = "http://localhost:5000";

  AuthDataProvider({@required this.httpClient});

  // get token from sharedpreference
  Future<String> getTokenFromSharedPreference() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") ?? "";
    return token;
  }

  // add token to shared preference
  Future<bool> addTokenToSharedPreference(String token) async {
    final pref = await SharedPreferences.getInstance();
    bool isadded = await pref.setString("token", token);
    return isadded;
  }

  // remove token from shared preference
  Future<bool> removeTokenFromSharedPreference(String token) async {
    final pref = await SharedPreferences.getInstance();
    bool isremoved = await pref.remove("token");
    return isremoved;
  }

  Future<bool> userLoggedInCheck() async {
    String token = await getTokenFromSharedPreference();
    if (token == "") {
      return false;
    } else {
      return true;
    }
  }

  Future<String> uploadUserProfilePicture(File profilepic) async {
    String name;
    var req =
        http.MultipartRequest("POST", Uri.parse('$_baseUrl/user/profile'));
    req.files.add(http.MultipartFile(
        "profile",
        File(profilepic.path).readAsBytes().asStream(),
        File(profilepic.path).lengthSync(),
        filename: profilepic.path.split("/").last));
    try {
      var result = await req.send();
      name = await result.stream.transform(utf8.decoder).elementAt(0);
    } catch (e) {
      print("error uploading image $e");
    }
    return name;
  }

  Future<bool> createUser(AuthModel authModel, File profile) async {
    String res = await uploadUserProfilePicture(profile);
    var data = jsonDecode(res);
    String message = data["message"];
    if (message != "success") {
      return null;
    }

    try {
      final response = await httpClient.post(
        Uri.parse("$_baseUrl/user/creat"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(
          <String, dynamic>{
            "phone": authModel.email,
            "username": authModel.username,
            "password": authModel.password,
            "userProfile": data["pic"],
            "bio": authModel.bio,
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception("failed to create user");
      }
    } catch (e) {
      print("User create error $e");
      return false;
    }
  }

  Future<bool> userLogoutCheck() async {
    String tn = await getTokenFromSharedPreference();
    bool state = await removeTokenFromSharedPreference(tn);
    if (state) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> getUserInfo() async {
    String token = await getTokenFromSharedPreference();

    try {
      final response = await httpClient.post(
        Uri.parse("$_baseUrl/user/getsingleuser"),
        headers: <String, String>{
          "Content-Type": "application/json; charset:UTF-8",
          "token": token,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> resData = jsonDecode(response.body);
        var user = resData["user"];
        AuthModel userModel = AuthModel(
          userid: user["userid"],
          username: user["username"],
          email: user["phone"],
          userProfile: user["userProfile"],
          bio: user["bio"],
        );
        return [true, userModel];
      } else {
        return [false, "failed to get user info"];
      }
    } catch (e) {
      return [false, "error getting user"];
    }
  }

  Future<List<dynamic>> userLogIn(String email, String password) async {
    try {
      final response = await httpClient.post(
        Uri.parse("$_baseUrl/user/login"),
        headers: <String, String>{
          "Content-Type": "application/json; charset:UTF-8",
        },
        body: jsonEncode(
          <String, dynamic>{
            "email": email,
            "password": password,
          },
        ),
      );
      if (response.statusCode == 200) {
        await addTokenToSharedPreference(jsonDecode(response.body)["token"]);
        return [true, jsonDecode(response.body)["token"].toString()];
      } else {
        return [false, "failed to login"];
      }
    } catch (e) {
      return [false, "error login"];
    }
  }
}
