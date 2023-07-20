import 'dart:math';

import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'theme/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int height = 150;
  int weight = 100;
  int age = 23;
  bool isMale = true;
  final activeColor = const Color(0xff1d1e40);
  final inActiveColor = const Color(0x011d1e33);
  late double bmi;

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return "Overweight";
    } else if (bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String feedBack() {
    if (bmi >= 25) {
      return "Your BMI of more than 25 indicates that you are underweight, so you may need to put on some weight. You are recommended to ask your doctor or a dietitian for advice.";
    } else if (bmi > 18.5) {
      return "Congratulations! Your BMI indicates that you are at a healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.";
    } else {
      return "Your BMI of less than 18.5 indicates that you are underweight, so you may need to put on some weight. You are recommended to ask your doctor or a dietitian for advice.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 13, 40, 0.984),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: SafeArea(
            child: Drawer(
              backgroundColor: const Color.fromARGB(255, 122, 141, 174),
              child: Column(
                children: [
                  DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 1, 54, 56),
                      ),
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Icon(FontAwesomeIcons.userTie,
                          size: 50,
                          color: iconColor,),
                          Text("Profile",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: textWhite
                          ),)
                        ],
                      )),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.person),
                    title: const Text("account"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.settings),
                    title: const Text("settings"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.settings_accessibility),
                    title: const Text("tools"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.help_center),
                    title: const Text("help center"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.logout),
                    title: const Text("logout"),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            elevation: 10,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            title: const Text(
              "BMI CALCULATOR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 20, right: 5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isMale ? activeColor : inActiveColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.mars,
                                size: 50,
                                color: iconColor,
                              ),
                              Text(
                                "MALE",
                                style: TextStyle(
                                    color: textWhite,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isMale ? inActiveColor : activeColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.venus,
                                size: 50,
                                color: iconColor,
                              ),
                              Text(
                                "FMALE",
                                style: TextStyle(
                                    color: textWhite,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
                  ],
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff1d1e40),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: TextStyle(
                            color: textWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: TextStyle(
                                  color: textWhite,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "cm",
                              style: TextStyle(
                                  color: unitColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              trackHeight: 2,
                              thumbShape: const RoundSliderThumbShape(
                                disabledThumbRadius: 25,
                                enabledThumbRadius: 15,
                              )),
                          child: Slider(
                              activeColor: Colors.white,
                              inactiveColor: Colors.white60,
                              thumbColor: Colors.pink[300],
                              min: 120,
                              max: 220,
                              value: height.toDouble(),
                              onChanged: (double newValue) {
                                height = newValue.toInt().round();
                                setState(() {});
                              }),
                        ),
                      ],
                    ),
                  ),
                )),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 20, right: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff1d1e40),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WEIGHT",
                              style: TextStyle(
                                  color: textWhite,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              mainAxisAlignment: MainAxisAlignment.center,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  weight.toString(),
                                  style: TextStyle(
                                      color: textWhite,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "kg",
                                  style: TextStyle(
                                      color: unitColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.circleMinus,
                                      color: iconColor,
                                      size: 40,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.circlePlus,
                                        color: iconColor,
                                        size: 40,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff1d1e40),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style: TextStyle(
                                  color: textWhite,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              age.toString(),
                              style: TextStyle(
                                  color: textWhite,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.circleMinus,
                                      color: iconColor,
                                      size: 40,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.circlePlus,
                                        color: iconColor,
                                        size: 40,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: ElevatedButton(
                      onPressed: () {
                        String calculate = calculateBMI();
                        String result = getResult();
                        String advice = feedBack();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Result(
                            bmi: calculate,
                            result: result,
                            advice: advice,
                          );
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[300],
                          foregroundColor: textWhite,
                          minimumSize: const Size(350, 70),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      child: const Text(
                        "CALCULATE YOUR BMI",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                        ),
                      )),
                )
              ],
            )),
          )),
    );
  }
}
