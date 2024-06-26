import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/routes/app_routes.dart';
import 'config/routes/navigator_observer.dart';
import 'features/categories/categories_injection.dart';
import 'features/favorites/favorites_injection.dart';
import 'features/home/presentation/controllers/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'features/language/language_injection.dart';
import 'features/language/presentation/cubit/locale_cubit/locale_cubit.dart';
import 'features/orders/orders_injection.dart';
import 'features/address/address_injection.dart';
import 'features/auth/auth_injection.dart';
import 'injection_container.dart';
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
  await ServiceLocator.init();
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarBrightness: Brightness.light,
  //     statusBarIconBrightness: Brightness.dark));
  // Bloc.observer = AppBlocObserver();
  // await PushNotificationService().setupInteractedMessage();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        path: 'assets/lang',
        startLocale: const Locale('ar'),
        assetLoader: const RootBundleAssetLoader(),
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
    //context.locale == const Locale('en', 'US') ? 'en' : 'ar';
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
          providers: [
            ...languageBlocs,
            ...addressBlocs,
            ...authBlocs,
            ...categoriesBlocs,
            ...favoritesBlocs,
            ...ordersBlocs,
            BlocProvider<BottomNavBarCubit>(
              create: (context) => ServiceLocator.instance<BottomNavBarCubit>(),
            ),
          ],
          child: BlocBuilder<LocaleCubit, LocaleState>(
              builder: (context, state) {
              return MaterialApp(
                title: 'Pro Bread',
                theme: ThemeData(
                  fontFamily: 'Teshrin',
                  useMaterial3: true,
                  brightness: Brightness.light,
                  /* light theme settings */
                ),
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  /* dark theme settings */
                ),
                themeMode: ThemeMode.light,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: state.locale,

                navigatorObservers: [AppNavigatorObserver()],
                /* ThemeMode.system to follow system theme,
                       ThemeMode.light for light theme,
                       ThemeMode.dark for dark theme
                    */
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppRoutes.onGenerateRoute,
              );
            }
          )

          // MaterialApp(
          //   locale: context.locale,
          //   title: 'Pro Bread',
          //   theme: ThemeData(
          //     fontFamily: 'Teshrin',
          //     colorScheme:
          //         ColorScheme.fromSeed(seedColor: AppConst.kPrimaryColor),
          //     useMaterial3: true,
          //   ),
          //   home: const SplashScreen(),
          //   debugShowCheckedModeBanner: false,
          // ),
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
