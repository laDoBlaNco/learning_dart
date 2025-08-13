// import 'dart:convert'; // json decoding

class Post {
  // The Post class represents a post object with id, title, and body fields
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    // the fromJson factory method parses JSON data into a Post object
    return Post(id: json['id'], title: json['title'], body: json['body']);
    // remember that return always ends in ';' not ,
    // Also I had an aha moment. all the commas are simply cuz these are simple
    // arguments to class instantiations. Remember that every Widget is just a
    // class constructor building a Widget, so everthing is an argument to those 
    // classes
  }
}


