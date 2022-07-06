import 'dart:math';
class Calculator_brain{
  Calculator_brain({required this.weight,required this.height});

  final int height;
  final int weight;
  // double _bmi=24;
  String calculateBMI(){
    double bmi = weight / pow(height/100,2);
    return bmi.toStringAsFixed(1);
  }

  String getResults(){
    double bmi = weight / pow(height/100,2);
    if(bmi >=25){
      return 'Overweight';
    }
    else if(bmi >18.5 && bmi <25){
      return 'Normal';
    }
    else{
      return 'UnderWright';
    }
  }

  String getInterpretstion(){
    double bmi = weight / pow(height/100,2);
    if(bmi >=25){
      return 'You have a higher than normal body weight. try to exercise more.';
    }
    else if(bmi >=18.5 && bmi <25){
      return 'You have a normal body weight. Good Job!!';
    }
    else{
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}