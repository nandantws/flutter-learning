import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/screens/widgets/popup.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  void _setLoading(BuildContext context, bool state) async {
    if (state) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
    } else {
      Navigator.pop(context);
    }
  }

  void login(BuildContext context, String email, String password) async {
    _setLoading(context, true);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      user = FirebaseAuth.instance.currentUser;
      notifyListeners();
      _setLoading(context, false);
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } catch (e) {
      showMessage(e.toString(), context);
      _setLoading(context, false);
    }
  }

  void logout(BuildContext context) async {
    await _auth.signOut();
    user = FirebaseAuth.instance.currentUser;
    notifyListeners();
    Navigator.pushNamedAndRemoveUntil(context, '/loading', (route) => false);
  }

  void signup(BuildContext context, String email, String password,
      String confirmPassword) async {
    _setLoading(context, true);
    if (password != confirmPassword) {
      showMessage('Password does not match', context);
      _setLoading(context, false);
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _setLoading(context, false);

      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } on FirebaseAuthException catch (e) {
      showMessage(e.code, context);
      _setLoading(context, false);
    }
  }
}
