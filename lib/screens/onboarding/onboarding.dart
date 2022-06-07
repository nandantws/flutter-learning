import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helloworld/screens/home/home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // final prefs = await SharedPreferences.getInstance();
  late final prefs;
  late final showHome;
  // bool showHome = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getShowHome();
  }

  void getShowHome() async {
    prefs = await SharedPreferences.getInstance();
    showHome = prefs.getBool('showHome') ?? false;
    if (!showHome) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
            Image(
              image: AssetImage('assets/shoe.png'),
            ),
            const SizedBox(height: 50),
            Text(
              'Comfort is everything',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
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
                foregroundColor: MaterialStateProperty.all(Color(0xFFF2923E)),
                fixedSize: MaterialStateProperty.all(const Size(300, 50)),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
                prefs.setBool('showHome', false);
              },
              child: Text(
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

// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFFF58524),
//               Color(0xFFF2923E),
//               Color(0xFFF6A656),
//             ],
//           ),
//         ),
//         child: Column(
//           children: [
//             const SizedBox(height: 100),
//             Image(
//               image: AssetImage('assets/shoe.png'),
//             ),
//             const SizedBox(height: 50),
//             Text(
//               'Comfort is everything',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 50,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18),
//               child: Text(
//                 'Find the best shoes for your comfort in your daily activities',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.white54,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),
//             ElevatedButton(
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.white),
//                 foregroundColor: MaterialStateProperty.all(Color(0xFFF2923E)),
//                 fixedSize: MaterialStateProperty.all(const Size(300, 50)),
//               ),
//               onPressed: () {
//                 Navigator.pushReplacement(context,
//                     MaterialPageRoute(builder: (context) => const Home()));
//               },
//               child: Text(
//                 'Get Started',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
