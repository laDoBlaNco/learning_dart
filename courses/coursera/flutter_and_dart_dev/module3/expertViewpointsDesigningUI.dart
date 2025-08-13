/*

Module 3 - Expert Viewpoints: Key Aspects of Designing User Interfaces with Flutter

What are some key aspects to consider when designing user interfaces
with Flutter?
  • Everything in Flutter is a Widget
    • Class hierarchy in Flutter describing UI structure and layout
    • Managed in a tree
    • Small elements like text, buttons, and images are also widgets
  • Knowing official design guidelines for Android: Material design
  • App's overall theme and visual identify (including colors, fonts, fontstyles)
  • Flutter theming system allows defining global styles
  • App layout  and navigation structure
  • Create complex UI sttructures with Flutter layout widgets (columns and rows and 
    constraints)
  • Understanding how to manage navigation and routes in Flutter for a seamless
    user experience is necessary and crucial 


How to work with orientation, layout widgets and constraints to create
responsive and visually appealing Flutter apps?
  • Orientation builder widget: to change the layout of an app
  • For example: Photo grid
    • In landscape mode: show four  or five photos in each row
      of the grid
    • In portrait mode: Show two or three photos in each row
      of the grid
  • Layout widgets: To arrange elements in rows, columns, grids
    and so on.
  • Grid widget for photo grid
  • Column widget for task list
  • Contraints: Sized box, container, and expanded widgets applied to
    the child elements
    • Sized box is fixed
    • Expanded and containers are dynamic
  • Orientation: 
    • Apps should adapt to both portrait and landscape modes
    • Use media query to detect orientation and adjust the layout accordingly
  • Layout Widgets: use flex widgets like rows and columns to create adaptive
    layouts
  • Constraints: Decide the size and place of the widgets
  • Expanded and flexible widgets allow widgets to flexibly occupy the 
    available space
  • In dashboard app, for example, layout changes dynamically based the device
    orientation and screen size

*/
