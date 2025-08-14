/*
This step involves creating a screen to add or edit student details. I
will implement form fields to capture student information
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'student_model.dart';
import 'student_provider.dart';

class EditStudentScreen extends StatefulWidget {
  // The screen allows for adding a new student and editing an exisiting one
  // determined by whether a sttudent object is passed to it
  final Student? student;

  const EditStudentScreen({Key? key, this.student}) : super(key: key);

  @override
  _EditStudentScreenState createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();
  // Uses TextEditingController to manage form inputs

  // so controllers help separate the UI logic from the widget's visual representation
  // contributing to a cleaner andmore maintainable codebase
  // By using controllers, I can effectively manage complex interactions and
  // dynamic updates in the flutter app
  // Controllers are typically tied to specific types of widgets, allowing for
  // targeted manipulation of those widgets. For example here I'm creating 4
  // instances of TextEditingController with different names to link to specific
  // TextField widgets below in the 'controller: _firstNameController' field
  // respectively

  // In flutter, a controller is an object designed to manage and interact with the
  // state or behavior of specific UI elements or widgets. It provides a programmatic
  // way to control and access the properties of these widgets, often simplifying the
  // handling of user input or dynamic content.

  @override
  void initState() {
    super.initState();
    if (widget.student != null) {
      _firstNameController.text = widget.student!.firstName;
      _lastNameController.text = widget.student!.lastName;
      _ageController.text = widget.student!.age.toString();
      _majorController.text = widget.student!.major;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student == null ? 'Add Student' : 'Edit Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // so I've seen this a lot so far. its short hand for List<Widget>
            // They call it literal syntax, but it also seems like an anony syntax
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            TextField(
              controller: _majorController,
              decoration: InputDecoration(labelText: 'Major'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveStudent(context),
              child: Text('Save Student'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveStudent(BuildContext context) {
    // A method that either adds a new student or updates an existing one in the
    // provider and then navigates back.
    final student = Student(
      id: widget.student?.id ?? DateTime.now().millisecondsSinceEpoch,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      age: int.parse(_ageController.text),
      major: _majorController.text,
    );
    if (widget.student == null) {
      Provider.of<StudentProvider>(context, listen: false).addStudent(student);
    } else {
      Provider.of<StudentProvider>(
        context,
        listen: false,
      ).updateStudent(student);
    }
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _majorController.dispose();
    super.dispose();
  }
}
