import 'package:flutter/material.dart';
import 'package:helloworld/providers/authentication.dart';
import 'package:helloworld/screens/Authentication/input_fields.dart';
import 'package:helloworld/screens/detail/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  'Login to view wishlist \nand continue transaction',
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
                OrangeButton(
                  text: 'Login',
                  onPressed: () {
                    authProvider.login(
                        context, emailController.text, passwordController.text);
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
                            'Or Sign In with',
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
                      'Don\'t have an account?',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: const Text(
                          'Sign Up',
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
