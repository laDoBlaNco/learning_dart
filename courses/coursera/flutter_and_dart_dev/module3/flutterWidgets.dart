/*
Module 3 - Flutter Widgets

For an apps success, ensuring a seamless and interactive user experience is
crucial

Significance of Widgets in Flutter
  ▪ Key role in displaying data and capturing user input
  ▪ Everything in Flutter is a widget
    ▪ Fundamental components that determine the apps appearance and state
    ▪ organized in a hierarchical widget tree

Types of widgets - 2 main types
  ▪ Stateless Widgets
    ▪ immutable, do not store any state, constant during the application life
      ▪ text
      ▪ icons
      ▪ raisedButton
      ▪ etc.
  Stateful Widgets
    ▪ Maintains and manages state, dynamic
      ▪ checkbox
      ▪ radio
      ▪ slider

In flutter widgets are classified based on their functionality
  ▪ Basic Widgets
    ▪ build the core structure of an app
      ▪ Text: string of text - Text('Hello, Flutter!');
        ▪ headings, labels, or paragraphs
      ▪ Image: display images from sources - Image.network('https://example.com/image.png)
        ▪ logos, photos, or visual content
      ▪ Icon: display icons - Icon(Icons.star)
        ▪ buttons, navigation bars, or lists
      ▪ ElevatedButton: elevated for a raised look - 
        ElevatedButton(
          onPressed: (){};
          child: Text('Press me');
        )
        ▪ submitting forms, navigation between scenes, etc.
  
  ▪ Layout Widgets
    ▪ stucture and position the widgets on the screen
      ▪ Column: vertical arrangement
        Column(
          children: <Widget>[
            Text('First item');
            Text('Second item');
          ],
        )
        ▪ stacking widgets
      ▪ Row: horizontal arrangement
        Row(
          chldren: <Widget>[
            Text('First item');
            Text('Second item');
          ],
        )
        ▪ toolbar or rows of buttons
      ▪ Container: groups and styles other widgets with padding, margines, borders,
        background colors, and so on
        Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.blue,
          child: Text('This is inside a container'),
        )
      ▪ Stack: overlaps widgets on top of each other
        Stack(
          children: <Widget>[
            Container(color: Colors.blue, width: 100, height: 100),
            Container(color: Colors.red, width: 50, height: 50),
          ],
        )
        ▪ like in a photo with a caption

  ▪ Input Widgets
    ▪ recieve user inputs such as text fields, radio buttons, and switches
      ▪ TextField: allows user to enter text
        TextField(
          decoration: InputDecoration(labelText; 'Enter your name');
        )
        ▪ search bar or form fields
      ▪ Checkbox: allows for multiple options selection
        Checkbox(
          value: true,
          onChanged: (bool? value){},
        )
        ▪ settings or form options with multiple selections
      ▪ Radio: allows for single option selection
        Radio(
          value: 1,
          groupValue: selectedValue,
          onChanged: (int? value) {},
        )
        ▪ settings or form options with a single selection
      ▪ Switch: allows for toggling between on/off states
        Switch(
          value: true,
          onChanged: (bool value) {},
        )
        ▪ enabling/disabling features

  ▪ Button Widgets
    ▪ interactive widgets that users can tap to trigger actions
      ▪ ElevatedButton: elevated for a raised look
        ElevatedButton(
          onPressed: (){},
          child: Text('Elevated Button'),
        )
        ▪ primary actions like submitting forms
      ▪ TextButton: flat button
        TextButton(
          onPressed: (){},
          child: Text('Text Button');
        )
        ▪ secondary actions like navigation links
      ▪ IconButton: icon instead of text
        IconButton(
          icon: Icon(Icons.thumb_up),
          onPressed: (){},
        )
        ▪ secondary actions such as 'like' or 'share'

  ▪ List Widgets
    ▪ display scrollable lists of items
      ▪ ListView: scrollable list
        ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
          ],
        )
        ▪ for contact lists or messages

Considerations for widget development
  ▪ Again EVERYTHING IN FLUTTER IS A WIDGET, (just a long list of widgets)
  ▪ identify the hierarchical structure
  ▪ arrange within layouts
  ▪ familiarize with stateful and stateless widgets, manage states
  ▪ To master core widgets explore:
    ▪ Text, Image, Button, Icon, and Container to build the foundation
    ▪ Use flexible layouts
    ▪ Use widgets for user input learning form widgets
    ▪ using lists and grids for displaying data efficiently
  ▪ Adhere to Material Design guildlines
  ▪ Ensure layouts adapt to all form factors and screens
  ▪ Break large widgets into smaller chunks
  ▪ Follow overall guidelines for a polished and professional look


Recap
  ▪ Everything in Flutter is a widget organized in a hierarchical structure
    called a widget tree, which efficiently updates the UI based on state 
    changes.
  ▪ Stateless widgets are immutable and constant, while Stateful widgets 
    are dynamic and can manage and update their state over time
  ▪ Flutter offers a wide variety of widgets, including basic, layout, input
    button, and list widgets, each serving specific functions to build responsive
    UIs
  ▪ Focus on understanding the widget tree, mastering core widgets, managing state,
    following design best practices, and avoiding common pitfalls for effective
    app development
*/
