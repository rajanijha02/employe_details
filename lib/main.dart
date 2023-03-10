import 'package:employe_details/app/data/models/docs_model.dart';
import 'package:employe_details/app/data/models/employe_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DocsAdapter());
  await Hive.openBox<Docs>('docs');
  Hive.registerAdapter(EmployeAdapter());
  await Hive.openBox<Employe>('employe');
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      title: "Employee Details",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
