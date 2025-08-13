/* Module 4: Expert Viewpoints: Key Differences Between Stateless and Stateful Widgets in Flutter

• What are the key differences between stateless and stateful
  widgets in flutter?
  • Stateful Widgets
    • When I need to update state in a widget
    • Examples: Calculator app where the values change
      or a settings page where a username or profile pic changes
    • Mutable and can maintain their state 
    • change over time
    • Two classes:
      • Widget class (which is immutable)
      • State class (which actually stores the state of the widget)
    • More examples: Forms, scrollable list, and video players
    • Dynamic
    • Can change during app runtime based on user interactions
      or data changes

   • Stateless Widgets
    • When you don't need to update the state
    • Example: Terms and conditions in an app
    • Immutable: Properties cannot change once they are created
    • UI components not requiring their state to be managed
    • More examples: Buttons, text labels, and icons
    • Simple widgets
    • Static: Don't change over time
    • Don't depend on data changes during app runtime

*/