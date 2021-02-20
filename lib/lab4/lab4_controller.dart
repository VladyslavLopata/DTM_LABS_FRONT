import 'package:dtm_front/services/common_utils.dart';
import 'package:dtm_front/services/request_service.dart';
import 'package:dtm_front/lab4/lab4_serializers.dart';
import 'package:get/get.dart';

class Lab4Controller extends GetxController {
  String matrix;

  TaskData data;
  AnswerData answer;

  void updateValue(String value) {
    matrix = value;
  }

  Future submit() async {
    data = TaskData(CommonUtils.matrixFromString(matrix));
    final connectInstance = RequestService();
    final response = await connectInstance.postLab4(data.toJson());
    answer = AnswerData.fromJson(response.body);
    update();
  }
}
