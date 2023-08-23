import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:space_practice/mobx/favorite_mobx.dart';
import 'package:space_practice/screens/home_screen.dart';
import 'package:space_practice/utils/routes.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Favorite>(create: (context) => Favorite(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Electrical Store',
        theme: ThemeData(
          textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
          primaryColor: kPrimaryColor,
          hintColor: kPrimaryColor,
        ),
        // Arabic RTL
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale("ar")],
        locale: const Locale("ar"),
        onGenerateRoute: Routes.generateRoute,
        
      ),
    );
  }
}
