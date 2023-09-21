import 'package:flutter/material.dart';
import 'package:helloworld/screens/Authentication/input_fields.dart';
import 'package:helloworld/screens/detail/utils.dart';

// write a void callback function
void callback() {
  print('Hello World');
}

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Style Footwear',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Create an account to view wishlist \nand continue transaction',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                TextInputField(
                  label: "Email",
                  controller: emailController,
                ),
                SizedBox(
                  height: 20,
                ),
                TextInputField(
                  label: "Password",
                  controller: passwordController,
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                TextInputField(
                  label: "Confirm Password",
                  controller: confirmPasswordController,
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                OrangeButton(
                  text: 'Sign Up',
                  onPressed: callback,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SquareTile(),
                    SquareTile(),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
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
