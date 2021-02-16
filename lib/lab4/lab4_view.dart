import 'package:dtm_front/widgets/lab_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Builder(builder: (_) {
                    return SizedBox(
                      width: 100,
                      child: TextField(
                        onChanged: controller.updateY,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    );
                  }),
                  SizedBox(
                    width: 30,
                  ),
                  Builder(builder: (_) {
                    return SizedBox(
                      width: 100,
                      child: TextField(
                        onChanged: controller.updateX,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    );
                  }),
                ],
              ),
              DataTable(
                columns: List.generate(
                    controller.x,
                    (index) =>
                        DataColumn(label: Text('Альтернатива ${index + 1}'))),
                rows: List.generate(
                  controller.y,
                  (y) => DataRow(
                    cells: List.generate(
                      controller.x,
                      (x) => DataCell(
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: Builder(builder: (_) {
                            return TextField(
                              onChanged: (String value) {
                                controller.updateValue(x, y, value);
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  onPressed: controller.submit,
                  child: Text('Розрахувати'),
                ),
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
