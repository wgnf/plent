import 'package:intl/intl.dart';
import 'package:plent/views/plent_app.dart';
import 'package:flutter/material.dart';

void main() {
  Intl.defaultLocale = 'en';
  WidgetsFlutterBinding.ensureInitialized();

  runApp(PlentApp());
}
