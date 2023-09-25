import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // final prefs = await SharedPreferences.getInstance();
  late SharedPreferences prefs;
  late bool showHome;
  // bool showHome = true;

  @override
  void initState() {
    super.initState();
    getShowHome();
  }

  void getShowHome() async {
    prefs = await SharedPreferences.getInstance();
    showHome = prefs.getBool('showHome') ?? true;
    if (!showHome) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF58524),
              Color(0xFFF2923E),
              Color(0xFFF6A656),
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Image(
              image: AssetImage('assets/shoe.png'),
            ),
            const SizedBox(height: 50),
            const Text(
              'Comfort is everything',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                'Find the best shoes for your comfort in your daily activities',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white54,
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor:
                    MaterialStateProperty.all(const Color(0xFFF2923E)),
                fixedSize: MaterialStateProperty.all(const Size(300, 50)),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
                prefs.setBool('showHome', false);
              },
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
