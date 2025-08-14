// ignore_for_file: unused_import

/*
In this step, I'm developing the home screen that lists all students. Each student's information
will be displayed, and I can navigate to the edit screen by tapping one a student
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'student_model.dart';
import 'student_provider.dart';
import 'edit_student_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student List')),
      body: Consumer<StudentProvider>(
        // users consumer<studentprovider> to listen to student list updates
        // so a consumer is a listener? 🤔
        builder: (context, provider, child) {
          return ListView.builder(
            // implements a listview builder to render each student as a list item
            itemCount: provider.students.length,
            itemBuilder: (context, index) {
              final student = provider.students[index];
              return ListTile(
                title: Text('${student.firstName} ${student.lastName}'),
                subtitle: Text('Age: ${student.age} - Major: ${student.major}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>EditStudentScreen(student: student),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // a floating action button to navigate to the EditStudentScreen for adding a new student
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=>EditStudentScreen(),
            ),
          );
        },
        child:Icon(Icons.add),
        tooltip: 'Add Student',
      ),
    );
  }
}
