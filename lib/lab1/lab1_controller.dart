import 'package:get/get.dart';

import '../services/request_service.dart';

class Lab1Controller extends GetxController {
  LabState labState;

  String get header => labState.header;
  String get xAxis => labState.xAxis;
  String get yAxis => labState.yAxis;

  int get yLength => labState.yLength;
  int get xLength => labState.xLength;

  Map<int, String> get xAxisNames => labState.xAxisNames;
  Map<int, String> get yAxisNames => labState.yAxisNames;

  List<List<int>> get matrix => labState.matrix;

  AnswerStatus get status => labState.status;

  List<AnswerItem> get answerList => labState.answerList;

  @override
  void onInit() {
    super.onInit();

    labState = LabState(
      header: 'Лабораторна 1',
      xAxis: 'Альтернатива',
      yAxis: 'Експерт',
      yLength: 1,
      xLength: 1,
      status: AnswerStatus.none,
      matrix: List.generate(
        10,
        (i) => List.generate(10, (j) => 0),
      ),
    );
  }

  void onYChanged(dynamic expert) {
    labState.yLength = expert as int;
    if (labState.yAxisNames.length < labState.yLength) {}
    update();
  }

  void onAlternativeChanged(dynamic alternative) {
    labState.xLength = alternative as int;
    update();
  }

  void updateText(int row, int column, String value) {
    labState.matrix[row][column] = value.isEmpty ? 0 : int.parse(value);
  }

  Future onSubmitLab1() async {
    await labState.onSubmit();
    update();
  }
}

enum AnswerStatus { none, loading, recieved }

class LabState {
  final String header;
  final String xAxis;
  final String yAxis;

  int yLength;
  int xLength;

  AnswerStatus status;

  final Map<int, String> xAxisNames;
  final Map<int, String> yAxisNames;

  final List<List<int>> matrix;

  List<AnswerItem> answerList;

  Future onSubmit() async {
    status = AnswerStatus.loading;
    // update();

    final connect = RequestService();
    final request = {
      'alternatives': List.generate(xLength,
          (alternativeIndex) => xAxisNames[alternativeIndex + 1] ?? ''),
      'experts': List.generate(
          yLength ?? 1,
          (expertIndex) => {
                'name': yAxisNames[expertIndex] ?? '',
                'grades': List.generate(xLength,
                    (alternativeIndex) => matrix[expertIndex][alternativeIndex])
              })
    };
    final answer = await connect.postLab1(request);

    answerList = List.generate(
      answer.body.length,
      (index) => AnswerItem(
        value: answer.body[index],
        name: xAxisNames[index + 1],
      ),
    );
    answerList
        .sort((answer1, answer2) => answer2.value.compareTo(answer1.value));
    status = AnswerStatus.recieved;
    // update();
  }

  LabState({
    this.header,
    this.xAxis,
    this.yAxis,
    this.xLength,
    this.yLength,
    this.matrix,
    this.answerList,
    this.status,
  })  : xAxisNames =
            Map.of(List.generate(10, (index) => '$xAxis $index').asMap()),
        yAxisNames =
            Map.of(List.generate(10, (index) => '$yAxis ${index + 1}').asMap());
}

class AnswerItem {
  String name;
  double value;

  AnswerItem({this.name, this.value});
}
