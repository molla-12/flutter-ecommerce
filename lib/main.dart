import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/blocks/wishlist_bloc.dart';
import 'package:shop_now/config/app_router.dart';
import 'package:shop_now/config/theme.dart';
import 'package:shop_now/home_screen/splash_screen/splash-screen.dart';
import 'package:shop_now/repository/category/category_repo.dart';
import 'package:shop_now/repository/checkout/checkout.dart';
import 'package:shop_now/repository/product/product_repo.dart';

import 'blocks/cart/cart_bloc.dart';
import 'blocks/category/category_bloc.dart';
import 'blocks/checkout/checkout_bloc.dart';
import 'blocks/product/product_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategories())),
        BlocProvider(
            create: (_) => ProductBloc(productRepository: ProductRepository())
              ..add(LoadProduct())),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ET Shop now',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        home: IntroPage(),
        // initialRoute: HomeScreen.routeName,
      ),
    );
  }

  // Widget Splash() {
  //   return AnimatedSplashScreen(
  //       duration: 3000,
  //       splash: Icons.h_mobiledata,
  //       nextScreen: HomeScreen(),
  //       splashTransition: SplashTransition.fadeTransition,
  //       pageTransitionType: PageTransitionType.scale,
  //       backgroundColor: Colors.blue);
  // }
}
