import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/providers/authentication.dart';

// Function to check Firebase user authentication and redirect accordingly
Future<void> checkAuthAndRedirect(
  BuildContext context,
  String authenticatedRoute,
) async {
  AuthProvider authProvider = AuthProvider();

  // Check if a user is currently authenticated
  User? user = authProvider.user;
  print('------------------------------------------');
  print(user);
  print(authenticatedRoute);
  print('------------------------------------------');
  if (user != null) {
    // User is authenticated, redirect to the authenticated route
    Navigator.of(context).pushNamed(authenticatedRoute);
  } else {
    // User is not authenticated, redirect to the login route
    Navigator.of(context).pushNamed('/login');
  }
}
