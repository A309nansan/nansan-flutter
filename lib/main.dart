import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:nansan_flutter/app_module.dart';
import 'package:nansan_flutter/shared/widgets/toase_message.dart';

void main() async {
  await dotenv.load();
  String? kakaoNativeAppKey = dotenv.env['KAKAO_NATIVE_APP_KEY'];
  String? kakaoJavaScriptAppKey = dotenv.env['KAKAO_JAVASCRIPT_APP_KEY'];
  KakaoSdk.init(
    nativeAppKey: kakaoNativeAppKey,
    javaScriptAppKey: kakaoJavaScriptAppKey,
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(ModularApp(module: AppModule(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Nansan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 249, 241, 196),
        ),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
