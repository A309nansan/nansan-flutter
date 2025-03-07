import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nansan_flutter/modules/auth/src/models/user_model.dart';
import 'package:nansan_flutter/modules/auth/src/services/auth_service.dart';

class GoogleSignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  final authService = Modular.get<AuthService>();

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();

      if (account == null) {
        return null;
      }

      // final GoogleSignInAuthentication auth = await account.authentication;
      // String? googleIdToken = auth.idToken;

      String email = account.email;
      String platformId = account.id;
      String userName = account.displayName!;

      UserModel userModel = UserModel(
        socialPlatform: "google",
        email: email,
        platformId: "google-$platformId",
        nickName: userName,
      );

      await authService.createOrGetUser(userModel);

      return account;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
