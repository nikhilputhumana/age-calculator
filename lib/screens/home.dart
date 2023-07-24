import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:age_calculator/age_calculator.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _formKey = GlobalKey<FormState>();

  final _day = TextEditingController();
  final _month = TextEditingController();
  final _year = TextEditingController();

  String _zodiac = '';
  DateDuration? _realAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Age Calculator',
          style: TextStyle(
            color: Color.fromARGB(255, 37, 1, 31),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Your Date of Birth',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 75,
                    child: TextFormField(
                      controller: _day,
                      textAlign: TextAlign.center,
                      inputFormatters: [LengthLimitingTextInputFormatter(2)],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Day',
                        hintText: 'dd',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter date';
                        } else if (int.parse(value) > 31 ||
                            int.parse(value) < 1) {
                          return 'wrong';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Text('   -   '),
                  SizedBox(
                    width: 75,
                    child: TextFormField(
                      controller: _month,
                      textAlign: TextAlign.center,
                      inputFormatters: [LengthLimitingTextInputFormatter(2)],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Month',
                        hintText: 'mm',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter date';
                        } else if (int.parse(value) > 12 ||
                            int.parse(value) < 1) {
                          return 'wrong';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Text('   -   '),
                  SizedBox(
                    width: 85,
                    child: TextFormField(
                      controller: _year,
                      textAlign: TextAlign.center,
                      inputFormatters: [LengthLimitingTextInputFormatter(4)],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Year',
                        hintText: 'yyyy',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter date';
                        } else if (int.parse(value) > 2023) {
                          return 'wrong';
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ageCalc(_day.text, _month.text, _year.text);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'Your age is \n $_realAge',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.purple,
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: Image.asset(
                                  'assets/images-png/$_zodiac.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Your zodiac sign is',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    ' $_zodiac'.toUpperCase(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          )
                        ],
                      ),
                    );
                  }
                },
                child: const Text('How old am I?'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ageCalc(d, m, y) {
    DateTime birthday = DateTime(int.parse(y), int.parse(m), int.parse(d));

    DateDuration duration;
    duration = AgeCalculator.age(birthday);

    setState(() {
      _realAge = duration;
      _zodiac = zodiacFnder(d, m);
    });
  }

  String zodiacFnder(d, m) {
    m = int.parse(m);
    d = int.parse(d);
    if (m == 1) {
      if (d <= 19) {
        _zodiac = 'capricorn';
      } else {
        _zodiac = 'aquarius';
      }
    } else if (m == 2) {
      if (d <= 18) {
        _zodiac = 'aquarius';
      } else {
        _zodiac = 'pisces';
      }
    } else if (m == 3) {
      if (d <= 20) {
        _zodiac = 'pisces';
      } else {
        _zodiac = 'aries';
      }
    } else if (m == 4) {
      if (d <= 20) {
        _zodiac = 'aries';
      } else {
        _zodiac = 'taurus';
      }
    } else if (m == 5) {
      if (d <= 20) {
        _zodiac = 'taurus';
      } else {
        _zodiac = 'gemini';
      }
    } else if (m == 6) {
      if (d <= 20) {
        _zodiac = 'gemini';
      } else {
        _zodiac = 'cancer';
      }
    } else if (m == 7) {
      if (d <= 22) {
        _zodiac = 'cancer';
      } else {
        _zodiac = 'leo';
      }
    } else if (m == 8) {
      if (d <= 23) {
        _zodiac = 'leo';
      } else {
        _zodiac = 'virgo';
      }
    } else if (m == 9) {
      if (d <= 22) {
        _zodiac = 'virgo';
      } else {
        _zodiac = 'libra';
      }
    } else if (m == 10) {
      if (d <= 23) {
        _zodiac = 'libra';
      } else {
        _zodiac = 'scorpio';
      }
    } else if (m == 11) {
      if (d <= 22) {
        _zodiac = 'scorpio';
      } else {
        _zodiac = 'sagittarius';
      }
    } else if (m == 12) {
      if (d <= 21) {
        _zodiac = 'sagittarius';
      } else {
        _zodiac = 'capricorn';
      }
    } else {
      _zodiac = 'undefied';
    }

    return _zodiac;
  }
}
