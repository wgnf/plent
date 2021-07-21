import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

class PlentApp extends StatelessWidget {
  const PlentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var analytics = FirebaseAnalytics();

    return MaterialApp(
        title: 'Plent',
        theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
        home: Home(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics)
        ]);
  }
}
