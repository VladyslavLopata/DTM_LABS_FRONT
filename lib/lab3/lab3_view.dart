import 'package:dtm_front/widgets/lab_drawer.dart';
import 'package:dtm_front/widgets/matrix_input.dart';
import 'package:dtm_front/widgets/submit_button.dart';
import 'package:flutter/material.dart';
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
              MatrixInput(
                onInputChanged: controller.updateValue,
                columnHeader: 'Події',
                rowHeader: 'Альтернативи',
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
                Text('Альтернативи методом Севіджа'),
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
              ]
            ],
          ),
        ),
      ),
    );
  }
}
