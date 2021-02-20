import 'package:dtm_front/widgets/lab_drawer.dart';
import 'package:dtm_front/widgets/matrix_input.dart';
import 'package:dtm_front/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lab4_controller.dart';

class Lab4View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Лабораторні роботи Лопати Владислава, ІС-02мп'),
      ),
      drawer: LabDrawer(
        lab: 4,
      ),
      body: Center(
        child: GetBuilder<Lab4Controller>(
          init: Lab4Controller(),
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MatrixInput(
                onInputChanged: controller.updateValue,
                columnHeader: 'Альтернативи',
                rowHeader: 'Рейтинг експерта',
              ),
              SizedBox(
                height: 30,
              ),
              SubmitButton(
                onSubmit: controller.submit,
              ),
              SizedBox(
                height: 10,
              ),
              if (controller.answer != null) ...[
                Text('У відношення Парето увійдуть такі альтернативи:'),
                Text(controller.answer.answer.toString()),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
