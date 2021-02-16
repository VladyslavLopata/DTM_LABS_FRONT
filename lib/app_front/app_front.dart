import 'package:dtm_front/app_front/app_front_controller.dart';
import 'package:dtm_front/widgets/lab_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppFront extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Лабораторні роботи Лопати Владислава, ІС-02мп'),
      ),
      drawer: LabDrawer(
        lab: 1,
      ),
      body: Center(
        child: GetBuilder<AppFrontController>(
          init: AppFrontController(),
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    hint: Text('Кількість експертів'),
                    isDense: true,
                    value: controller.yLength,
                    onChanged: controller.onYChanged,
                    items: List.generate(
                      10,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text(
                          (index + 1).toString(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton(
                    hint: Text('Кількість альтернатив'),
                    isDense: true,
                    value: controller.xLength,
                    onChanged: controller.onAlternativeChanged,
                    items: List.generate(
                      10,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text(
                          (index + 1).toString(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              DataTable(
                columns: List.generate(
                  (controller.xLength ?? 1) + 1,
                  (index) => index == 0
                      ? DataColumn(label: Text(''))
                      : DataColumn(
                          label: Expanded(
                            child: Center(
                              child: SizedBox(
                                width: 150,
                                height: 20,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: TextEditingController(
                                      text: controller.xAxisNames[index] ?? ''),
                                  onChanged: (text) {
                                    controller.xAxisNames[index] = text;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Альтернатива $index',
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                rows: List.generate(
                  controller.yLength ?? 1,
                  (row) => DataRow(
                    cells: List.generate(
                      (controller.xLength ?? 1) + 1,
                      (cell) => cell == 0
                          ? DataCell(
                              TextField(
                                controller: TextEditingController(
                                    text: controller.yAxisNames[row] ?? ''),
                                onChanged: (text) {
                                  controller.yAxisNames[row] = text;
                                },
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'Експерт ${row + 1}',
                                  isDense: true,
                                ),
                              ),
                            )
                          : DataCell(
                              TextField(
                                onChanged: (String value) {
                                  controller.updateText(row, cell - 1, value);
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: controller.onSubmitLab1,
                child: Text('Розрахувати'),
              ),
              SizedBox(
                height: 20,
              ),
              if (controller.status == AnswerStatus.loading)
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(),
                ),
              if (controller.status == AnswerStatus.recieved)
                DataTable(
                  columns: List.generate(
                    controller.answerList.length,
                    (index) => DataColumn(
                      label: Text(
                        controller.answerList[index].name,
                      ),
                    ),
                  ),
                  rows: [
                    DataRow(
                      cells: List.generate(
                        controller.answerList.length,
                        (index) => DataCell(
                          Text(
                            controller.answerList[index].value
                                .toStringAsFixed(3),
                          ),
                        ),
                      ),
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
