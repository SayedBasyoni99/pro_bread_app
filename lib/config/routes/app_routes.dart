import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/cart_page.dart';
import '../../features/auth/presentation/screens/create_acc_page.dart';
import '../../features/auth/presentation/screens/forget_password.dart';
import '../../features/auth/presentation/screens/lang_page.dart';
import '../../features/auth/presentation/screens/log_in_page.dart';
import '../../features/auth/presentation/screens/new_acc_page.dart';
import '../../features/auth/presentation/screens/product_details_page.dart';
import '../../features/auth/presentation/screens/products_page.dart';
import '../../features/auth/presentation/screens/recipient_info_page.dart';
import '../../features/auth/presentation/screens/welcome_page.dart';
import '../../features/categories/domain/entities/get_dish_response.dart';
import '../../features/home/presentation/screens/main_page.dart';
import '../../features/splash/on_boarding_screen.dart';
import '../../features/splash/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoardingRoute = '/OnBoardingScreen';
  static const String welcomeRoute = '/WelcomePage';
  static const String createAccountRoute = '/CreateAccountPage';
  static const String registerRoute = '/NewAccPage';
  static const String loginRoute = '/LogInPage';
  static const String mainPageRoute = '/MainPage';
  static const String productDetailsRoute = '/ProductDetailsPage';
  static const String recipientInfoPageRoute = '/RecipientInfoPage';
  static const String forgotPasswordRoute = '/ForgetPasswordPage';
  static const String cartScreenRoute = '/CartScreen';
  static const String myAccountScreen = '/MyAccountScreen';
  static const String productsScreen = '/ProductsScreen';
  static const String favouritesScreen = '/FavouritesScreen';

  static const String categoryDetailsScreen = '/CategoryDetailsScreen';

  static const String settingsScreen = '/SettingsScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) {
            return const SplashScreen();
          },
        );

      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) {
            return const OnBoardingScreen();
          },
        );

      case Routes.welcomeRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) {
            return const WelcomePage();
          },
        );

      case Routes.createAccountRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const CreateAccPage(),
        );

      case Routes.registerRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const NewAccPage(),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const LogInPage(),
        );

      case Routes.mainPageRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const MainPage(),
        );

      case Routes.productDetailsRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => ProductDetailsPage(
            dish: routeSettings.arguments as Dish,
          ),
        );

      case Routes.recipientInfoPageRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) =>  RecipientInfoPage(),
        );

      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const ForgetPasswordPage(),
        );

      case Routes.cartScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const CartPage(),
        );

      case Routes.myAccountScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const MainPage(),
        );
      case Routes.productsScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const MainPage(),
        );
      case Routes.favouritesScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const MainPage(),
        );

      case Routes.categoryDetailsScreen:
        return MaterialPageRoute(settings: routeSettings, builder: (BuildContext context) => const ProductsPage());

      case Routes.settingsScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const LanguagePage(),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const Scaffold(
        body: Center(
          child: Text('Not Found Route!'),
        ),
      ),
    );
  }
}
