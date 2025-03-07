import 'package:flutter_modular/flutter_modular.dart';
import 'package:nansan_flutter/modules/auth/src/screens/login_screen.dart';
import 'package:nansan_flutter/modules/auth/src/services/auth_service.dart';
import 'package:nansan_flutter/modules/auth/src/services/facebook_sign_in_service.dart';
import 'package:nansan_flutter/modules/auth/src/services/google_sign_in_service.dart';
import 'package:nansan_flutter/modules/auth/src/services/kakao_sign_in_service.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(KakaoSignInService.new);
    i.addSingleton(GoogleSignInService.new);
    i.addSingleton(FacebookSignInService.new);
    i.addSingleton(AuthService.new);
  }

  @override
  void routes(r) {
    r.child('/login', child: (context) => const LoginScreen());
  }
}
