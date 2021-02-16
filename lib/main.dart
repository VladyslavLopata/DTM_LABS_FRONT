import 'package:dtm_front/app_front/app_front_binding.dart';
import 'package:dtm_front/lab2/views/lab2_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_front/app_front.dart';
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
      getPages: [
        GetPage(
          name: '/lab1',
          page: () => AppFront(),
          bindings: [
            AppFrontBinding(),
          ],
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
