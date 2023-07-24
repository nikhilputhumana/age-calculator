import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:age_calculator/age_calculator.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  String data = '';

  int num = 100;

  final _textCtrl = TextEditingController();
  final _day = TextEditingController();
  final _month = TextEditingController();
  final _year = TextEditingController();
  DateDuration? _realAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Age Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter Your Date of Birth',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 75,
                  child: TextFormField(
                    controller: _day,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'Day',
                      hintText: 'dd',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 5.0,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Text('   -   '),
                SizedBox(
                  width: 75,
                  child: TextFormField(
                    controller: _month,
                    decoration: InputDecoration(
                      labelText: 'Month',
                      hintText: 'mm',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 5.0,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Text('   -   '),
                SizedBox(
                  width: 85,
                  child: TextFormField(
                    controller: _year,
                    decoration: InputDecoration(
                      labelText: 'Year',
                      hintText: 'yyyy',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 5.0,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                ageCalc(_day.text, _month.text, _year.text);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Your age is \n $_realAge',
                      textAlign: TextAlign.center,
                    ),
                    content: Column(
                      children: [
                        Image.asset(
                          'assets/images/virgo.jpg',
                          // height: 150,
                        ),
                        const Text('Your zodiac sign is dollr sign_name'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      )
                    ],
                  ),
                );
              },
              child: Text('How old am I?'),
            ),
          ],
        ),
      ),
    );
  }

  void ageCalc(d, m, y) {
    DateTime birthday = DateTime(int.parse(y), int.parse(m), int.parse(d));

    DateDuration duration;

    // Find out your age as of today's date 2021-03-08
    duration = AgeCalculator.age(birthday);
    // print('Type is $duration.runtimeType');

    print('Your age is $duration'); // Your age is Years: 24, Months: 0, Days: 3
    setState(() {
      _realAge = duration;
    });
  }
}
