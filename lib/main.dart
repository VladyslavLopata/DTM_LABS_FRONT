import 'package:dtm_front/bindings/app_bindings.dart';
import 'package:dtm_front/lab2/lab2_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lab1/lab1_view.dart';
import 'lab3/lab3_view.dart';
import 'lab4/lab4_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Лопата В',
      initialRoute: '/lab1',
      initialBinding: AppBindings(),
      getPages: [
        GetPage(
          name: '/lab1',
          page: () => Lab1View(),
        ),
        GetPage(
          name: '/lab2',
          page: () => Lab2View(),
        ),
        GetPage(
          name: '/lab3',
          page: () => Lab3View(),
        ),
        GetPage(
          name: '/lab4',
          page: () => Lab4View(),
        ),
      ],
    );
  }
}
