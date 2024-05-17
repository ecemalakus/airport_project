import 'package:airport_project/app/bindings/login_binding.dart';
import 'package:airport_project/app/bindings/root_binding.dart';
import 'package:airport_project/app/ui/pages/login_page/login_page.dart';
import 'package:airport_project/app/ui/pages/root_page/root_page.dart';
import 'package:airport_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initServices();

  runApp(
    const MyApp(),
  );
}

initServices() async {
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: GetMaterialApp(
        enableLog: true,
        navigatorKey: Get.key,
        logWriterCallback: localLogWriter,
        title: "Airport Project",
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        opaqueRoute: Get.isOpaqueRouteDefault,
        popGesture: Get.isPopGestureEnable,
        transitionDuration: Get.defaultTransitionDuration,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('tr'),
        ],
        initialRoute: "/login",
        getPages: [
          GetPage(
            name: "/root",
            page: () => const RootPage(),
            binding: RootBinding(),
          ),
          GetPage(
            name: "/login",
            page: () => const LoginPage(),
            binding: LoginBinding(),
          ),
        ],
      ),
    );
  }

  void localLogWriter(String text, {bool isError = false}) {
    if (kDebugMode) {
      debugPrint(text);

      return;
    }
  }
}
