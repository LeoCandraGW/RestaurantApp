import 'package:flutter/material.dart';
import 'package:restaurant_app/detail_resto.dart';
import 'package:restaurant_app/local_restaurant.dart';
import 'package:restaurant_app/resto_list.dart';
import 'package:restaurant_app/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: primaryColor,
        onPrimary: Colors.black,
        secondary: secondaryColor,
       ),
       textTheme: myTextTheme,
       appBarTheme: const AppBarTheme(elevation: 0),
       elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: secondaryColor,
          onPrimary: Colors.white,
          textStyle: const TextStyle(),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
        ),
       ),
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const RestaurantList(),
        '/detailpage':(context) => DetailRestaurant(
              restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant),
      },
    );
  }
}