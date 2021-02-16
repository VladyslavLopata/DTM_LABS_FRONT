import 'package:dtm_front/widgets/lab_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'lab3_controller.dart';

class Lab3View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Лабораторні роботи Лопати Владислава, ІС-02мп'),
      ),
      drawer: LabDrawer(
        lab: 3,
      ),
      body: Center(
        child: GetBuilder<Lab3Controller>(
          init: Lab3Controller(),
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
                columns: [
                  DataColumn(
                    label: Text(''),
                  ),
                  ...List.generate(
                    controller.x,
                    (index) => DataColumn(
                      label: Text(''),
                    ),
                  ),
                ],
                rows: List.generate(
                  controller.y,
                  (y) => DataRow(cells: [
                    DataCell(Text('Альтернатива ${y + 1}')),
                    ...List.generate(
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
                  ]),
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
              if (controller.answer != null)
                Text('Альтернативи методом Севіджа'),
              if (controller.answer != null)
                DataTable(
                  columns: controller.answer.savige
                      .map(
                        (tuple) => DataColumn(
                          label: Text('Альтернатива ${tuple[1]}'),
                        ),
                      )
                      .toList(),
                  rows: [
                    DataRow(
                      cells: controller.answer.savige
                          .map(
                            (tuple) => DataCell(
                              Text(tuple[0].toString()),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              SizedBox(
                height: 10,
              ),
              if (controller.answer != null)
                Text('Альтернативи методом Лапласа'),
              if (controller.answer != null)
                DataTable(
                  columns: controller.answer.laplasus
                      .map(
                        (tuple) => DataColumn(
                          label: Text('Альтернатива ${tuple[1]}'),
                        ),
                      )
                      .toList(),
                  rows: [
                    DataRow(
                      cells: controller.answer.laplasus
                          .map(
                            (tuple) => DataCell(
                              Text(tuple[0].toString()),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
