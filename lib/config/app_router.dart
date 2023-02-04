import 'package:flutter/material.dart';

import '../home_screen/screens.dart';
import '../models/models.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return HomeScreen.route();

      case HomeScreen.routeName:
        return HomeScreen.route();

      case CartScreen.routeName:
        return CartScreen.route();

      case CheckoutScreen.routeName:
        return CheckoutScreen.route();

      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case ProfileScreen.routeName:
        return ProfileScreen.route();

      case WatchlistScreen.routeName:
        return WatchlistScreen.route();

      // case SplashScreen.routeName:
      //   return SplashScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('error'),
              ),
            ));
  }
}
