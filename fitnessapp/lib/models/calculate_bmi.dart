import 'dart:math';

class BmiLogic {
  BmiLogic({
    required this.height,
    required this.weight,
    required this.age,
  });

  final int height;
  final int weight;
  final int age;

  double? _bmi;

  double get calculateBMI {
    _bmi = weight / pow(height / 100, 2);
    if (_bmi! >= 30) {
      return _bmi = 30.0;
    }
    print(_bmi);

    return _bmi!.floorToDouble();
  }

  double get calculateBMIFatPErcentage {
    var maletakeout = 16.2;
    var femaletakeout = 5.4;

    return (1.20 * calculateBMI) + (0.23 * age) - maletakeout;
  }

  String get getResult {
    if (_bmi! < 18.5) {
      print('underweight');
      return 'Underweight';
    } else if (_bmi! >= 18.5 && _bmi! <= 24.9) {
      print('normal');
      return 'Normal';
    } else if (_bmi! >= 25 && _bmi! <= 29.9) {
      print('overweight');
      return 'Overweight ';
    } else if (_bmi! >= 30.0) {
      print('Obesity');
      return 'Obesity';
    } else {
      return 'Calculation Error';
    }
  }
}
