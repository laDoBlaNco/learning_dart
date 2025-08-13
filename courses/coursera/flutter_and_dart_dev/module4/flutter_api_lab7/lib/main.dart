// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'post_model.dart';

// import http package for http requests, dart:convert for json decoding, and
// post_model.dart for the model class

// Create a function to fetch data fron an API
Future<List<Post>> fetchPosts() async {
  // the fetchPosts functions sends http get request to the api endpoint
  // If the request is successful (statusCode 200), it decodes the json response
  // and maps it to a list of Post objects
  try {
    // try-catch block handles exceptions tha tmay occur during the requests
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  } catch (e) {
    throw Exception('Failed to load posts: $e');
  }
}

// 3. Create a StatefulWidget to display the data inside the main function
void main() {
  // the main entry point of a flutter app. Calls runApp(MyApp()) to start the application
  // with MyApp widget
  runApp(const MyApp());
  // creates and attaches MyApp to the screen, which sets up the basic app structure
}

class MyApp extends StatelessWidget {
  // The root widget of teh app. It doesn't change state; it simply defines the app's
  // structure
  const MyApp({super.key});
  /*
  NOTE to self: {super.key} is shorthand for 'MyApp({Key? key}) : super(key: key);
  This is the normal syntax for passing required args of a subclass to the superclass.
  Keys in flutter are identifiers used by flutter to uniquely identify widgets, elements
  , and semantics nodes. They are crucial for preserving state across widget rebuilds,
  especially when dealing with the lists of dynamic widgets or widgets that maintain
  internal state. So maybe I only see them when dealing with StatefulWidgets in the app.
  */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter API Lab', home: const PostList());
    // MaterialApp provides the core app features and sets the 'home' to 'PostList, which
    // is the main screen where data will be displayed
  }
}

class PostList extends StatefulWidget {
  // A stateful widget that allows dynamic content. Here it is used to display data
  // fetched from the API
  const PostList({super.key});

  @override
  _PostListState createState() => _PostListState();
  // creates the mutable state for PostList to manage data fetching and display
}

class _PostListState extends State<PostList> {
  // manages the state for PostList
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
    // initiates the API call to fetch posts when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Data')),
      body: FutureBuilder<List<Post>>(
        // reacts to future (futurePosts) and rebuilds the UI depending on the state
        // of the data fetching (loading, error, or success)
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
            // shows a loading indicator while waiting
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Failed to load data.'),
                  Text('Error: ${snapshot.error}'),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futurePosts = fetchPosts();
                      });
                    },
                    child: const Text('Retry'),
                  ),
                  // added a 'retry' button to attempt fetching data again in case of error
                ],
              ),
            );
            // displays the error message if the API call fails
          } else if (snapshot.hasData) {
            return ListView.builder(
              // used to dynamically generate a scrollable list of posts when data
              // is successfully fetched.
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].body),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
