/* Module 4: Managing State in Flutter

Introduction
• Building a complex application involves:
  • Dynamic user interactions
  • Real-time updates
• State management is a core concept in any interactive application
  that:
  • Ensures a seamless user experience
  • Keeps data consistent
  • Provides optimal performance

What is state?
  • It's mainly data, representing information, which is
    used to create the current UI
  • If the state (data) changes, it requires refreshing the
    UI to aling with and reflect the updated state
  • Encompasses all data that may change while a widget is
    active
  • Involves user interactions, such as button clicks or 
    data retrieved from an API

There are 2 main types of state in Flutter
  • Ephemeral state
    • A temporary state that is managed within a single
      widget
    • Example: Checked state of a checkbox or the value
      in a textfield
  • App state
    • a state that needs to be shared across multiple parts
      of an application
    • Example: User authentication status or theme settings

Why are state management techniques essential?
  • To separate business logic from the UI (SoC) Separation of Concerns
    • Significance: Important to manage a codebase with large data volume
  • To optimize performance to its fullets potential
    • Significance: Important to avoid relying only on setState() for
      every small widget update

Basic state management techniques:
  • setState() method
    • Available in StatefulWidget
    • Informs the framework about the internal state updation
      Exmple code (I've seen this in some of the labs)
      
      class Counter extends StatefulWidget{
      // defining a counter widget that can maintain some state
        @override
        _CounterState createState() => _CounterState();
        // create a _CounterState class to manage the state of the counter widget
      }

      class _CounterState extends State<Counter>{
        int _counter = 0;
        // initialize the _counter variable to keep track of the account

        void _incrementCounter(){
          setState(() {
            _counter++;
          });
        }
        // defines a _incrementCounter method that increases _counter by 1
        // and updates the UI with setState()

        // Then we build the UI with a title, a message showing how many
        // times a button was pressed, and a floating button to increment
        // the counter

        @override
        Widget build(BuildContext context){
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('You have pushed the button this many times:'),
                  Text('$_counter', style: Theme.of(context).textTheme.headline4),
                  // I think 'headline4' is deprecated though
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          );
        }
      }

  • InheritedWidget() class 
    • Used for more complex statemanagement
    • Allows passing data down the widget tree
    • Reacts to changes
      Example code:

      class MyInheritedWidget extends InheritedWidget{
        final int data;
        // data stores an integer value

        MyIheritedWidget({required this.data, required Widget child}) : super(child: child);

        @override
        bool updateShouldNotify(covariant MyInheritedWidget oldWidget){
          return oldWidget.data != data;
        }
        // here we check if the data has been changed

        static MyInheritedWidget? of(BuildContext context){
          return context.dependOnInheritedWidgetofExactType<MyInheritedWidget>();
        }
        // provides a way to access the data directly from the widget tree using
        // the static method '.of'
      }

      class ParentWidget extends StatefulWidget{
        @override
        _ParentWidgetState createState() => _ParentWidgetState();
      }
      // displays a stateful widget with counter

      class _ParentWidgetState extends State<ParentWidget>{
        int counter = 0

        void incrementCounter(){
          setState((){
            counter++;
          });
        }
        // incrementCounter method increases my counter by 1

        @override
        Widget build(BuildContext context){
          return MyInheritedWidget(
            data: counter,
            child: Scaffold(
              appBar: AppBar(title: Text('Inherited Widget Example')),
              body: Center(child: ChildWidget()),
              floatingActionButton: FloatingActionButton(
                onPressed: incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            ),
          );
        }
        // build wraps the child widgets and displays a button to increase the 
        // counter
      }

      class ChildWidget extends StatelessWidget{
        @override
        Widget build(BuildContext context){
          final inheritedData = MyInheritedWidget.of(context)?.data ?? 0;
          return Text('Counter value: $inheritedData');
        }
      }
      // ChildWidget displays a stateless widget that reads the counter value
      // and shows it as text

Recap:
  • State refers to data utilized by Flutter to create the user interface
  • The two main types of states in Flutter are ephemeral state and app
    state
  • Primary reasons for implementing state management techniques are:
    • Separating the business logic from the UI (SoC)
    • Optimizing the performance to its fullest potential
  • The setState() method is the simple way to manage state in Flutter
    • lets the app know when the state has changed
  • For more complex state management, InheritedWidget class and (.of)
    method can be used to pass data down the widget tree

  

*/
