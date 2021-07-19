import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

enum UserStatus { Init, Authenticated, Authenticating, Unauthenticated }

class UserRepository extends ChangeNotifier {
  Map<String, dynamic>? _userData;
  UserStatus _userStatus = UserStatus.Init;
  UserStatus get userStatus => _userStatus;
  set userStatus(UserStatus newStatus) {
    _userStatus = newStatus;
    notifyListeners();
  }

  Future<void> checkLoggedIn() async {
    try {
      var accessToken = await FacebookAuth.instance.accessToken;
      if (accessToken != null) {
        userStatus = UserStatus.Authenticated;
        await getUserData();
      } else {
        userStatus = UserStatus.Unauthenticated;
      }
    } catch (e) {
      userStatus = UserStatus.Unauthenticated;
    }
  }

  Future<bool> signInWithFacebook() async {
    try {
      userStatus = UserStatus.Authenticating;
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        await getUserData();
        userStatus = UserStatus.Authenticated;
        return true;
      } else {
        userStatus = UserStatus.Unauthenticated;
        return false;
      }
    } catch (e) {
      userStatus = UserStatus.Unauthenticated;
      return false;
    }
  }

  Future<Map<String, dynamic>> getUserData() async {
    _userData = await FacebookAuth.instance.getUserData();
    return _userData ?? {};
  }
}
