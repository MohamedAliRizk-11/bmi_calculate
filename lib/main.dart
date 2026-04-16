import 'package:flutter/material.dart';
import 'result.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Appnew()));
}

class Appnew extends StatefulWidget {
  @override
  State<Appnew> createState() => _AppnewState();
}

class _AppnewState extends State<Appnew> {
  String? typeGender;
  int Weight = 0;
  int Age = 0;
  double startHeight = 160;
  double BMI = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text("BMI CALCULATOR", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Column(
        children: [
       
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                typeGender = "Male";
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: typeGender == "Male"
                                    ? Colors.blue
                                    : Color.fromARGB(74, 97, 109, 128),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.male,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  Text(
                                    "MALE",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                typeGender = "Female";
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: typeGender == "Female"
                                    ? Colors.blue
                                    : Color.fromARGB(74, 97, 109, 128),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.female,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  Text(
                                    "FEMALE",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                 
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(74, 97, 109, 128),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("HEIGHT", style: TextStyle(color: Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${startHeight.round()}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                ),
                              ),
                              Text(
                                " cm",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Slider(
                            value: startHeight,
                            min: 100,
                            max: 220,
                            activeColor: Colors.blue,
                            onChanged: (value) {
                              setState(() {
                                startHeight = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                 
                  Expanded(
                    child: Row(
                      children: [
                      
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(74, 97, 109, 128),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "WEIGHT",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "$Weight",
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      color: Colors.white,
                                      onPressed: () {
                                        setState(() {
                                          if (Weight > 0) Weight--;
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      color: Colors.white,
                                      onPressed: () {
                                        setState(() {
                                          Weight++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),

                        /// AGE
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(74, 97, 109, 128),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "AGE",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "$Age",
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      color: Colors.white,
                                      onPressed: () {
                                        setState(() {
                                          if (Age > 0) Age--;
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      color: Colors.white,
                                      onPressed: () {
                                        setState(() {
                                          Age++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        
          Expanded(
            child: InkWell(
              onTap: () {
             
                BMI = Weight / ((startHeight / 100) * (startHeight / 100));

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => result(BMI: BMI)),
                );
              },
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
