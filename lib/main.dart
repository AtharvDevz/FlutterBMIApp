import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtconttroller = TextEditingController();
  var ftconttroller = TextEditingController();
  var inconttroller = TextEditingController();
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: 700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "BMI",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 11),
            TextField(
              controller: wtconttroller,
              decoration: const InputDecoration(
                label: Text('Enter Your Weight'),
                prefixIcon: Icon(Icons.line_weight_rounded),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 11,
            ),
            TextField(
              controller: ftconttroller,
              decoration: const InputDecoration(
                label: Text('Enter Your Height in feet'),
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 11),
            TextField(
              controller: inconttroller,
              decoration: const InputDecoration(
                  label: Text('Enter Height in inches'),
                  prefixIcon: Icon(Icons.height)),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 50),
            Container(
              width: 100,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  var wt = wtconttroller.text.toString();
                  var ft = ftconttroller.text.toString();
                  var inch = inconttroller.text.toString();

                  if (wt != "" && ft != "" && inch != "") {
                    setState(() {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iinch = int.parse(inch);

                      var tM = (((ift * 12) + iinch) * 2.54) / 100;

                      var bmi = (iwt / (tM * tM));

                      result = 'Your BMI is $bmi';
                    });
                  } else {
                    setState(() {
                      result = "Please Fill All Required Fills";
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 139, 192, 235), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // Rounded corners
                  ),
                  elevation: 5, // Add a shadow
                  shadowColor: Colors.grey, // Set shadow color
                  textStyle: const TextStyle(
                    fontSize: 15, // Increase text size
                    fontWeight: FontWeight.bold, // Set font weight
                    color: Colors.white, // Set text color
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10), // Adjust padding
                  // Add more properties as needed
                ),
                child: const Text(
                  'Calculate',
                  selectionColor: CupertinoColors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              result,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    ));
  }
}
