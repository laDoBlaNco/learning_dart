/* Module 4: Calling APIs with Flutter

Understanding APIs
  • Example: Users rely on weather alerts to plan daily activities
  • Application Programming Interfaces (APIs) deliver this weather
    data to their smartphones
  • Faciliate communication between software  systems
  • Provide my app access  real-time data from a distant server
  • Help me build dynamic mobile applications in Flutter

Understanding Asynchronous Programming
  • API interactions are async network requests
  • When data is requested from a network due to latency or other 
    factors, responses may be unpredictable
  • Apps may freeze or become unresponsive if these requests are managed 
    synchronously

Future and asynce/await keywords
  • Future & asynce/await
    • prevent my app from freezing
    • Futures
      • potential values or errors that aren't available
        yet
      • Serve as a placehold for those value in async operations
    • async/await
      • pauses code execution until the future value is returned

Making a correct API call
  • Send a request to the server
    • Identify the web address or endpoint to use
    • Use HTTP package to communicate with the server  
      • http.get or http.post depending on the type of info
    • Manage and interpret the response (json format)
  • Parse the JSON data
    • use json.decode ('dart:convert') to transform the json 
      string into a dart object (i.e., map or list)
    • create a dart model class with properties matching the 
      json structure
    • map the model class with the decoded json data
  • Update the UI
    • Use stateful widget to hold the api data
    • add the setState() method to notify the framework that the
      object's state has changed

Error handling
  • Errors are highly probably due to the same factors that make 
    async programming neceessary with network calls (latency, connection issues, etc)
  • Error-handling measures are essential
    • Try-catch block
      • handles exceptions and prevents the app from crashing
    • Timeouts
     • prevent the app from freezing
    • User messages
     • inform usrs when an error occurs

  Code Example:
  
  import 'package:flutter/material.dart';
  import 'dart:async';
  import 'package:http/http.dart' as http; // using http package to make http calls

  void main(){
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return MaterialApp(
        title: 'Error Handling Example',
        home: ApiCallScreen(),
      );
    }
  }

  class ApiCallScreen extends StatefulWidget{
    @override
    _ApiCallScreenState createState()=> _ApiCallScreenState();
  }

  class _ApiCallScreenState extends State<ApiCallScreen>{
    String _responseMessage = ''; // shows user messaging
    bool _isLoading = false; // manages loading state

    Future<void> fetchData() async {
      setState((){
        _isLoading = true;
        _responseMessage = '';
      });

      try{
        final response = await http  // another example of multiling chaining
          .get(Uri.parse('https://api.example.com/data'))
          .timeout(Duration(seconds: 5)); // Setting a timeout

        if(response.statusCode == 200){
          setState((){
            _responseMessage = 'Data fetched successfully: ${response.body}';
          });
        }else{
          setState((){
            _responseMessage = 'Error: ${response.statusCode}';
          });
        }
      }catch(e){
        setState((){
          _responseMessage = 'An error occurred: $e';
        });
      }finally{
        setState((){
          _isLoading = false;
        });
      }
    }

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text('API Call with Error Handling Handling'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if(_isLoading)
                CircularProgressIndicator()
              else
                Text(_responseMessage),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: fetchData,
                child: Text('Fetch Data'),
              ),
            ],
          ),
        ),
      );
    }
  }

Best Practices
  • Minimize the number of API calls by implementing caching
  • Enchance security using HTTPs, authentication protocols,
    and data validation techniques
  • Use modular code to improve code maintainability and 
    testability
  • Implement error handling to prevent crashes

Considerations
  • Become familiar with Future and async/await keywords
  • Create try-catch-finally blocks to manage potential
    errors
  • Become familiar with different HTTP methods, like:
    • .get
    • .post
    • .delete
    • .put
  • use dart:convert to parse json data
    • Its essential to map json to dart structures for 
      data manipulation
  • Become familiar with state management solutions to manage UI
    such as:
    • Provider
    • Riverpod
    • Setstate
    • Block
  • Take note of API rate limits to avoid getting blocked by a server
  • Use additional headers or auth tokens in my requests

Recap:
• Understand APIs and how they help access external data
• use precautions to manage the asynchronous nature of API
  calls
• Create my first API by sending a request to the server
• Identify and manage errors by using error-handling techniques
• Understand best practices and critical considerations for
  API interactions
  
*/
