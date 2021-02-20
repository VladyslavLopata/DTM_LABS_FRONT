import 'dart:math';

import 'package:dtm_front/services/request_service.dart';
import 'package:dtm_front/lab2/lab2_serializers.dart';
import 'package:get/get.dart';

class Lab2Controller extends GetxController {
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
        matrix.take(x).map((e) => e.take(y).toList()).toList());
    final connectInstance = RequestService();
    final response = await connectInstance.postLab2(data.toJson());
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
