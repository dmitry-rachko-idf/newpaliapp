import 'package:flutter/material.dart';
import 'package:newpaliapp/di/injector_getit.dart';
import 'package:presentation/app.dart';

void main() async {
  await initInjector();
  runApp(const MyApp());
}
