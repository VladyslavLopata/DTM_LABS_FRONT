class CommonUtils {
  static List<List<num>> matrixFromString(String matrix) => matrix
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
}
