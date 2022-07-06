import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmiResult,required this.interpre,required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpre;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeColor,
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: resultStyle,
                  ),
                  Text(
                    bmiResult,
                    style: BMItextstyle,
                  ),
                  Text(
                    interpre,
                    textAlign: TextAlign.center,
                    style: bodystyle,
                  ),
                ],
              ),
            ),
          ),
          bottom_button(onTap: (){
            Navigator.pop(context);
          }, buttonTitle: 'RECALCULATE')
        ],
      ),
    );
  }
}
