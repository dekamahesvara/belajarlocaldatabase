import 'package:belajar_local_database/db/db_helper.dart';
import 'package:belajar_local_database/pages/create/binding.dart';
import 'package:belajar_local_database/pages/create/create.dart';
import 'package:belajar_local_database/pages/home/binding.dart';
import 'package:belajar_local_database/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(
            name: "/", page: () => const HomePage(), binding: HomeBinding()),
        GetPage(
            name: "/create",
            page: () => const CreatePage(),
            binding: CreateBinding())
      ],
    );
  }
}
