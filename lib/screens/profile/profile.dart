import 'package:flutter/material.dart';
import 'package:helloworld/providers/authentication.dart';
import 'package:helloworld/screens/detail/utils.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = AuthProvider();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: authProvider.user != null
            ? Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    initialValue: authProvider.user!.email,
                  ),
                  const SizedBox(height: 40),
                  OrangeButton(
                    text: "Logout",
                    onPressed: () {
                      authProvider.logout(context);
                    },
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You are not logged in yet"),
                  const SizedBox(height: 20),
                  OrangeButton(
                      text: "Login",
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      })
                ],
              ),
      ),
    );
  }
}
