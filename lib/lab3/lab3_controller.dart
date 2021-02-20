import 'package:dtm_front/app_front/app_front_connector.dart';
import 'package:dtm_front/lab3/lab3_serializers.dart';
import 'package:get/get.dart';

class Lab3Controller extends GetxController {
  String matrix;

  AnswerData answer;

  void updateValue(String value) {
    matrix = value;
  }

  Future submit() async {
    Get.focusScope.unfocus();
    final localMatrix = matrix
        .split('\n')
        .map(
          (line) => line
              .split(' ')
              .map(
                (digit) => int.parse(digit),
              )
              .toList(),
        )
        .toList();
    data = TaskData(
      List.generate(localMatrix.length, (index) => '${index + 1}'),
      List.generate(localMatrix[0].length, (index) => '$index'),
      localMatrix,
    );
    final connectInstance = AppFrontConnect();
    final response = await connectInstance.postLab3(data.toJson());
    assert(!response.hasError, 'Error in response. Is server active?');
    try {
      answer = AnswerData.fromJson(response.body);
    } catch (e) {
      answer = null;
    }

    update();
  }

  TaskData data;

  @override
  void onInit() {
    super.onInit();
  }
}
