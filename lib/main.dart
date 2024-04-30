import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_bread_app/core/const/constant_var.dart';
import 'package:pro_bread_app/features/home/presentation/controllers/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:pro_bread_app/splash/splash_screen.dart';
// import 'package:pro_bread_app/splash/splash_screen.dart';

// void main() {
//   runApp(
//     EasyLocalization(
//         supportedLocales: const [Locale('ar', "EG"), Locale('en', "US")],
//         path: 'assets/translations',
//         startLocale: const Locale('en', "US"),
//         saveLocale: true,
//         child: const MyApp()),
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  // await CacheHelper.init();
  // await CacheHelper.getData(key:  "lang") == null ? "en":"ar";
  // await FastCachedImageConfig.init(clearCacheAfter: const Duration(days: 15));
  await EasyLocalization.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarBrightness: Brightness.light,
  //     statusBarIconBrightness: Brightness.dark));
  // Bloc.observer = AppBlocObserver();
  // await PushNotificationService().setupInteractedMessage();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('ar', "EG"), Locale('en', "US")],
        path: 'assets/translations',
        startLocale: const Locale('ar', "EG"),
        saveLocale: true,
        child: const MyApp()),
  );
  // RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
  // if (initialMessage != null) {
  //   // App received a notification when it was killed
  // }
  // await Permission.notification.isDenied.then(
  //   (bool value) {
  //     if (value) {
  //       Permission.notification.request();
  //     }
  //   },
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    context.locale == const Locale('en', "US") ? "en" : "ar";
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BottomNavBarCubit>(
            create: (context) => BottomNavBarCubit(),
          ),
        ],
        child: MaterialApp(
          locale: context.locale,
          title: 'Pro Bread',
          theme: ThemeData(
            fontFamily: 'Teshrin',
            colorScheme: ColorScheme.fromSeed(seedColor: AppConst.kPrimaryColor),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(), body: const Center());
//   }
// }
