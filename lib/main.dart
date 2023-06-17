import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/app/my_app.dart';
import 'package:meal_monkey/core/data/repositories/shared_preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });
  Get.put(SharedPreferencesRepository());
  runApp(const MyApp());
}
