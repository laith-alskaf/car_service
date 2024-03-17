import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:car_service/core/translation/app_translation.dart';
import 'package:car_service/ui/views/splash_screen_view/splash_screen_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(540, 960),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: false,
      child: GetMaterialApp(
        defaultTransition:
            GetPlatform.isAndroid ? Transition.fadeIn : Transition.cupertino,
        transitionDuration: const Duration(microseconds: 300),
        translations: AppTranslation(),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreenView(),
      ),
    );
  }
}
