import 'package:dtm_front/lab2/lab2_controller.dart';
import 'package:dtm_front/widgets/lab_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Lab2View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Лабораторні роботи Лопати Владислава, ІС-02мп'),
      ),
      drawer: LabDrawer(
        lab: 2,
      ),
      body: Center(
        child: GetBuilder<Lab2Controller>(
          init: Lab2Controller(),
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
                Text('Альтернативи методом Гурвіца'),
              if (controller.answer != null)
                DataTable(
                  columns: controller.answer.gurvizza
                      .map(
                        (tuple) => DataColumn(
                          label: Text(tuple[1]),
                        ),
                      )
                      .toList(),
                  rows: [
                    DataRow(
                      cells: controller.answer.gurvizza
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
                Text('Альтернативи методом maxmax'),
              if (controller.answer != null)
                DataTable(
                  columns: controller.answer.maxmax
                      .map(
                        (tuple) => DataColumn(
                          label: Text(tuple[1]),
                        ),
                      )
                      .toList(),
                  rows: [
                    DataRow(
                      cells: controller.answer.maxmax
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
                Text('Альтернативи методом Вальде'),
              if (controller.answer != null)
                DataTable(
                  columns: controller.answer.valde
                      .map(
                        (tuple) => DataColumn(
                          label: Text(tuple[1]),
                        ),
                      )
                      .toList(),
                  rows: [
                    DataRow(
                      cells: controller.answer.valde
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
