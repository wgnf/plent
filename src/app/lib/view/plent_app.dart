import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class PlentApp extends StatelessWidget {
  const PlentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plent',
      home: Home()
    );
  }
}
