/*
 * This step involves creating a provider for managing the state
 * of student data in my app. The provider will include functions
 * to add, remove, and update students (CRUD)
 * 
*/

// file: lib/student_provider.dart

import 'package:flutter/material.dart';
import 'student_model.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

class StudentProvider with ChangeNotifier {
  // A class to manage the list of students
  final LocalStorage storage;
  List<Student> _students = [];

  StudentProvider({required this.storage}) {
    _loadStudentsFromStorage();
  }

  List<Student> get students => _students;

  void _loadStudentsFromStorage() async {
    var data = storage.getItem('students');
    if (data != null) {
      _students = List<Student>.from(
        (jsonDecode(data) as List).map(
          (item) => Student.fromMap(item as Map<String, dynamic>),
        ),
      );
      notifyListeners();
    }
  }

  void addStudent(Student student) {
    _students.add(student);
    _saveToStorage();
    notifyListeners();
    // Notifies listeners about changes to rebuild the UI.
  }

  void deleteStudent(int id) {
    _students.removeWhere((element) => element.id == id);
    _saveToStorage();
    notifyListeners();
  }

  void updateStudent(Student student) {
    var index = _students.indexWhere((element) => element.id == student.id);
    if (index != -1) {
      _students[index] = student;
      _saveToStorage();
      notifyListeners();
    }
  }

  void _saveToStorage() {
    storage.setItem(
      'students',
      jsonEncode(_students.map((student) => student.toMap()).toList()),
    );
  }

  // methods to add, remove, and update student data in the provider's list
}
