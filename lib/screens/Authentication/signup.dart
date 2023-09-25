import 'package:flutter/material.dart';
import 'package:helloworld/screens/Authentication/input_fields.dart';
import 'package:helloworld/screens/detail/utils.dart';

import '../../providers/authentication.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  AuthProvider authProvider = AuthProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to Style Footwear',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Create an account to view wishlist \nand continue transaction',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextInputField(
                  label: "Email",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextInputField(
                  label: "Password",
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextInputField(
                  label: "Confirm Password",
                  controller: confirmPasswordController,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                OrangeButton(
                  text: 'Sign Up',
                  onPressed: () {
                    authProvider.signup(
                        context,
                        emailController.text,
                        passwordController.text,
                        confirmPasswordController.text);
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Or Continue with',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                        ),
                      )
                    ],
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SquareTile(),
                    SquareTile(),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            // color: Colors.orange[800]
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
