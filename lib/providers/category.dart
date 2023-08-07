import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  final List<String> categories = ['All'];

  CategoryProvider() {
    getCategories();
  }

  Future getCategories() async {
    var collection = FirebaseFirestore.instance.collection('categories');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      categories.add(queryDocumentSnapshot.data()['name']);
      // print(queryDocumentSnapshot.data()['name']);
    }
  }
}
