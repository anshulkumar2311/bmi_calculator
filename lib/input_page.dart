import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'constants.dart';
import 'package:bmi_calculator/result_page.dart';
import 'bottom_button.dart';
import 'package:bmi_calculator/round_iconbutton.dart';
import 'calculator_brain.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender{
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  late Gender selectedGender = Gender.female;
  int height=180;
  int weight=60;
  int age=21;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: GestureDetector(
                onTap: (){
                  setState((){
                      selectedGender = Gender.male;
                      print('Male');
                  });
                },
                child: ReusableCard(
                    onPress: (){
                      setState((){
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender ==Gender.male ? activeColor : inactiveColor ,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.mars, size: 80.0,),
                        SizedBox(height: 15.0,),
                        Text('MALE' , style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF8D8E98),
                        ),)

                      ],
                    ),
                ),
              ),
              ),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState((){
                    selectedGender = Gender.female;
                    print('FeMale');
                  });
                },
                child: ReusableCard(
                  onPress: (){
                    setState((){
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female ? activeColor : inactiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.venus, size: 80.0,),
                      SizedBox(height: 15.0,),
                      Text('FEMALE' , style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF8D8E98),
                      ),)

                    ],
                  ),
                ),
              ),
              ),
            ],
          )),
          Expanded(child: ReusableCard(
            onPress: (){},
            colour: activeColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT' , style: labelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: heavyTextStyle),
                    Text('cm', style: labelTextStyle,),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x15EB1555),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98) ,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(value: height.toDouble(),min: 120.0,max: 220.0,
                      // activeColor: Color(0xFFEB1555),
                      // inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue){
                         setState((){
                           height = newValue.round();
                         });
                      },),
                )
              ],
            ),
          ),
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                onPress: (){
                },
                colour: activeColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('WEIGHT' ,style: labelTextStyle,),
                    Text(weight.toString(),style: heavyTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundButtonIcon(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState((){
                              weight--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundButtonIcon(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState((){
                              weight++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState((){
                    selectedGender = Gender.female;
                  });
                },
                colour: activeColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('AGE' , style: labelTextStyle,),
                    Text(age.toString(), style: heavyTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundButtonIcon(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState((){
                              age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundButtonIcon(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState((){
                              age++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),),
            ],
          )),
          bottom_button(buttonTitle: 'CALCULATE',onTap: (){
              Calculator_brain calc = Calculator_brain(weight: weight, height: height);
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ResultPage(
              bmiResult:calc.calculateBMI() ,
              resultText:calc.getResults() ,
              interpre:calc.getInterpretstion() ,
              );
            }));

          } ,),
        ],
      ),
    );
  }
}



