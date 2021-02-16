import 'dart:math';

import 'package:dtm_front/app_front/app_front_connector.dart';
import 'package:dtm_front/lab3/lab3_serializers.dart';
import 'package:get/get.dart';

class Lab3Controller extends GetxController {
  int x, y;

  List<List<int>> matrix;

  AnswerData answer;

  void updateX(String newX) {
    x = int.tryParse(newX) ?? x;
    x = min(x, 15);
    update();
  }

  void updateY(String newY) {
    y = int.tryParse(newY) ?? y;
    y = min(y, 15);
    update();
  }

  void updateValue(int x, int y, String value) {
    matrix[y][x] = int.parse(value) ?? matrix[x][y];
  }

  Future submit() async {
    data = TaskData(
        List.generate(y, (index) => '${index + 1}'),
        List.generate(x, (index) => '$index'),
        matrix.take(y).map((e) => e.take(x).toList()).toList());
    final connectInstance = AppFrontConnect();
    final response = await connectInstance.postLab3(data.toJson());
    answer = AnswerData.fromJson(response.body);
    update();
  }

  TaskData data;

  @override
  void onInit() {
    super.onInit();
    x = 1;
    y = 1;
    matrix = List.generate(100, (_) => List.generate(100, (_) => 0));
  }
}
