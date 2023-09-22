import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/providers/category.dart';
import 'package:helloworld/providers/product.dart';
import 'package:helloworld/screens/Authentication/auth_page.dart';
import 'package:helloworld/screens/Authentication/login.dart';
import 'package:helloworld/screens/Authentication/signup.dart';
import 'package:helloworld/screens/cart/cart.dart';
import 'package:helloworld/screens/checkout/summary.dart';
import 'package:helloworld/screens/onboarding/onboarding.dart';
import 'package:provider/provider.dart';
import 'screens/home/home.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider()),
        ChangeNotifierProvider<ProductProvider>(
            create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.orange,
          // fontFamily: 'Baloo'
        ),
        initialRoute: '/splash',
        // home: showHome ? OnboardingScreen() : Home(),
        routes: {
          '/splash': (context) => const Onboarding(),
          '/auth': (context) => const AuthPage(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/home': (context) => const Home(),
          '/cart': (context) => CartScreen(),
          '/checkout': (context) => const CheckoutScreen(),
        },
      ),
    );
  }
}
