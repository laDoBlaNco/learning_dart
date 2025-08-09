/*
Module 3 - Interaction and Forms in Flutter

Interaction and form handling are essential to craate dynamic
and responsive apps. 
  ▪ Handled  through widgets, the building blocks of Flutter apps.
  ▪ Manage everything from layout and styling to user input
    and gesture recognition
  
Flutter Button Presses
  ▪ Create TextButton, ElevatedButton, or OutlineButton
  ▪ Trigger an onPressed event with a button tap
    ▪ Define the button
    ▪ Set the onPressed callback

Handling Text Input
  ▪ TextField widgets for forms, search, and/or textual data:
    ▪ Create a TextField
    ▪ Use TextEditingController to retrive text from TextField
      ▪ particular important as it provides the methods needed to
        ▪ clear the field
        ▪ retrieve the current value
        ▪ or modify the text programatically
    ▪ Use InputDecoration property to customize appearance of TextField

Form Validation
  ▪ Forms are simply multiple TextField widgets combined in a form
    widget
  ▪ Validation ensures that data entered meets the criteria
    ▪ Handling Form Validation
      ▪ Wrap TextField Widgets in a form, using form widget to group 
        multiple TextField widgets
      ▪ check the input's validity with validators
        ▪ validators are functions that check validity and return an error
          string or null if invalid
      ▪ Use  GlobalKey to manage the form's state
        ▪ The form's state can be accessed and manipulated using the global key
          allowing to check if all inputs are valid before  preceeding.

Gesture Dectectors
  ▪ Interactions and forms can also be managed by gestures
    ▪ multi-finger taps and swipes, etc
  ▪ Common detectors:
    ▪ GestureDetector
    ▪ InkWell
    ▪ Dismissible
  ▪ Detectors provide callbacks for different types of gestures
    ▪ Place the widget inside a GestureDetector widget
      ▪ to detect a tap
    ▪ Define the callback functiosn for gestures
      ▪ to respond onTap or onDoubleTap

Creating an Interactive Form
  ▪ Design my layout using column, row, and container widgets
  ▪ Integrate buttons with appropriate actions
  ▪ Handle text input using TextField widgets with controllers
  ▪ Validate input to ensure fields are not empty or have incorrect data
  ▪ Enhance interaction with gesture detectors for advance interactions



Recap:

  ▪ Developers handle user interactions by creating buttons
  ▪ User interaction is enabled using the TextField widget, which
    is the basic widget for creating text input
  ▪ Forms are made with multiple TextField widgets combined within
    a Form widget
  ▪ Gesture detectors handle interactions such as swipes, taps, and
    long presses.
*/