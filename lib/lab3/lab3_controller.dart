import 'package:dtm_front/services/common_utils.dart';
import 'package:dtm_front/services/request_service.dart';
import 'package:dtm_front/lab3/lab3_serializers.dart';
import 'package:get/get.dart';

class Lab3Controller extends GetxController {
  String matrix;

  TaskData data;
  AnswerData answer;

  void updateValue(String value) {
    matrix = value;
  }

  Future submit() async {
    final localMatrix = CommonUtils.matrixFromString(matrix);
    data = TaskData(
      List.generate(localMatrix.length, (index) => '${index + 1}'),
      List.generate(localMatrix[0].length, (index) => '$index'),
      localMatrix,
    );
    final connectInstance = Get.find<RequestService>();
    final response = await connectInstance.postLab3(data.toJson());
    assert(!response.hasError, 'Error in response. Is server active?');
    try {
      answer = AnswerData.fromJson(response.body);
    } catch (e) {
      answer = null;
    }

    update();
  }
}
