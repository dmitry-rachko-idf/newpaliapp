import 'package:flutter/material.dart';
import 'package:newpaliapp/di/injector.dart';
import 'package:presentation/app.dart';

void main() async {
  configureDependencies();
  runApp(const MyApp());
}
