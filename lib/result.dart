import 'package:flutter/material.dart';

class result extends StatefulWidget {
  final double BMI;
  const result({super.key, required this.BMI});
  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  late double BMI;
  String status = "";
  String message = "";
  @override
  void initState() {
    super.initState();
    BMI = widget.BMI;
    if (BMI < 18.5) {
      status = "Underweight";
      message =
          "You are under the normal body weight. Try to eat healthy and gain some weight.";
    } else if (BMI < 25) {
      status = "Normal";
      message = "You have a normal body weight. Good job!";
    } else if (BMI < 30) {
      status = "Overweight";
      message =
          "You are slightly above the normal weight. Try to exercise more and eat balanced meals.";
    } else {
      status = "Obese";
      message =
          "Your body weight is much higher than normal. Consider improving your diet and lifestyle.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("RESULT", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color.fromARGB(74, 97, 109, 128),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      status,
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      BMI.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "RE-CALCULATE",
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
