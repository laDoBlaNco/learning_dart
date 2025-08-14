/*
 * In this step we will defin a model for student data. This model
 * will help strucure the data used throughout the application. I'll
 * create a Student class with properties for ID, firstname, lastname,
 * age and major
 */

// file: lib/student_model.dart

class Student {
  // Defines a class named Student
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final String major;
  // final fields are immutable

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.major,
  });

  factory Student.fromMap(Map<String, dynamic> json) {
    // factory function for creating a Student instance
    // from a map
    return Student(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
      major: json['major'],
    );
  }

  Map<String, dynamic> toMap() {
    // A method to conver a Student instance into a map
    return {
      'id':id,
      'firstName':firstName,
      'lastName':lastName,
      'age':age,
      'major':major,
    };
  }
}
