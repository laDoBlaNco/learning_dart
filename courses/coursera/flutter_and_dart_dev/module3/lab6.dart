/*
// This lab worked perfectly in dartpad. Need to put it in an actual new project to 
// see it work here. 

// 1. in the first step we create a form on the main screen
// to capture user registration
import 'package:flutter/material.dart';

// 2. define the main entry point function:
void main(){
  // main is the entry point for all flutter apps
  // runApp takes the provided widget (MyApp) and makes it the root of
  // the widget tree
  runApp(const MyApp());
}

// 3. create a stateless widget named MyApp - just classes and subclasses
// underneath it all
class MyApp extends StatelessWidget{
  // Stateless widget used when the widget doesn't manage its own state. Its not
  // dynamic or changing throughout the lifetime of the app
  
  // const constructor is sued here to indicate that MyApp is immutable
  const MyApp({super.key}); 
  
  // we override the build method in this subclass to define the structure
  @override
  Widget build(BuildContext context){
    // build method describes how to display the widget in the app
    // the context parameter provides information about the location
    // of this widget in the tree
    // Then we start building the app by returning a MaterialApp widget
    return MaterialApp(
      // MaterialApp is a convenience widget that wraps several commonly
      // used widgets to design a material app.
      title:'Flutter Navigation Lab',
      initialRoute: '/',
      // initialRoute defines the default route for the app
      routes:{
        '/': (context) => const HomeScreen(),
        '/second':(context)=> const SecondScreen(),
      },
      // routes is a map of route names to the corresonding builders. 
    ); // in build widget the return statement is the only one ending in ;
    // everything else is ended with a ',' as they are expressions or values
    // for the most part
  }
}

// create the HomeScreen widget (again just a class)
class HomeScreen  extends StatefulWidget{
  // my first stateful widget
  const HomeScreen({super.key});
  
  @override
  _HomeScreenState createState()=>_HomeScreenState();
}

// HomeScreen contains the registration form with various input fields and
// a button to navigate to the second screen
// When teh form is submitted, the data is passed to the SecondScreen
class _HomeScreenState extends State<HomeScreen>{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedGender = 'Male';
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator:(value){
                  if(value==null||value.isEmpty){
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator:(value){
                  if(value==null||value.isEmpty){
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              ListTile(
                title:const Text('Date of Birth'),
                subtitle: Text('${_selectedDate.toLocal()}'.split(' ')[0]),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async{
                  final DateTime? picked = await showDatePicker(
                    context:context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if(picked!=null && picked != _selectedDate){
                    setState((){
                      _selectedDate = picked;
                    });
                  }
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: const InputDecoration(labelText: 'Gender'),
                items:['Male','Female','Other']
                  .map((String value)=>DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ))
                  .toList(),
                onChanged: (String? newValue){
                  setState((){
                    _selectedGender = newValue!;
                    // need to figure out what the '!' does at the end of 
                    // newValue!. Has something to do with String? nullable
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()){
                    Navigator.pushNamed(
                      context,
                      '/second',
                      arguments: {
                        'name': _nameController.text,
                        'age': _ageController.text,
                        'dateOfBirth': _selectedDate,
                        'gender': _selectedGender,
                      },
                    );
                  }
                },
                child:const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Here we are setting up the second screen. In the lab its  separate file, 
// but since I'm using dartpad I'm putting it all in one big file. This second
// screen will display the information captured in the first screen. I'll add
// a flutter route to navigate the user to the second screen when they select
// the 'submit' button after filling out the form.

// The data is retrieved using ModalRoute.of(context)?.settings.arguments

class SecondScreen extends StatelessWidget{
  const SecondScreen({super.key});
  
  @override
  Widget build(BuildContext context){
    final Map<String,dynamic> userData = 
      ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text('Name: ${userData['name']}'),
            Text('Age: ${userData['age']}'),
            Text('Date of Birth: ${userData['dateOfBirth']}'),
            Text('Gender: ${userData['gender']}'),
          ],
        ),
      ),
    );
  }
}

*/
