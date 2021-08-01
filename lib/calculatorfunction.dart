import 'dart:math';
import 'constants.dart';

class CalculatorFunction {
  CalculatorFunction(
      {required this.credits, required this.points, required this.courses});

  List<String> credits;
  List<int> points;
  int courses;

  String GpaCalc() {
    String res = '';
    double gpa;
    int num = 0;
    int cTotal = 0;
    for (int i = 0; i < courses; i++) {
      num += (points[i] * int.parse(credits[i]));
      cTotal += int.parse(credits[i]);
    }
    gpa = num / cTotal;
    return res = gpa.toStringAsFixed(2);
  }
}
