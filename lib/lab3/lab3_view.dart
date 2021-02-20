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
                children: [
                  Text(
                    'Події',
                    style: TextStyle(fontSize: 30),
                  ),
                  Icon(Icons.arrow_right)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 220.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        'Альтернативи',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Icon(Icons.arrow_downward),
                    SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(border: Border.all()),
                      width: 300,
                      child: TextField(
                        minLines: 1,
                        maxLines: 10,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9 \n]'))
                        ],
                        onChanged: controller.updateValue,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
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
