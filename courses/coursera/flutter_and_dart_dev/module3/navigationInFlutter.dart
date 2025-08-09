/*

Module 3 - Navigation In Flutter

Navigation is the process of moving between different screens
or pages. Flutter makes this simple using built-in elements
including 
  ▪ navigator - widget that manages a stack of pages
  ▪ drawer - which is a slide-in menu for navigation

3 types of navigation I might use 
  ▪ Stack Navigation
    ▪ similar to a stack of cards
    ▪ transitions between pages or screens by stacking
    ▪ new screens push current screens to the stack
    ▪ top screen is removed when going back
    ▪ typically used for hierarchical and linear flows
      ▪ For example an ecommerce app
        ▪ product list screen is clicked and it pushes
        ▪ product details screen and from there
        ▪ click to the checkout screen
  ▪ Tab Navigation
    ▪ tabs enable users to switch views quickly without losing current views
    ▪ Flutter makes it easy with built-in widgets such as TabBar and TabBarView
    ▪ Tabs are customizable for the appearance
    ▪ for example tab navigation for diffent sections of an app
      ▪ Home tab: displays the user's feed
      ▪ Search tab; Allows users to search for content
      ▪ Notifications tab: Shows notifications and alerts
      ▪ Profile tab: Displays the user's profile information
  ▪ Drawer Navigation
    ▪ The side menu slides out of the side of the screen
    ▪ This method conserves screen space
    ▪ Ideal for apps with a lot of options that don't fit in a tab bar.
      Such as a newsfeed app
      ▪ Drawer navigation: for many sections or options
      ▪ Top stories: The main new feed
      ▪ Categories: different categories, such as sports, technology,a nd 
        entertainment
      ▪ Bookmarks: Saved articles
      ▪ Settings: App settings and preferences


Recap:

▪ Navigation elements in Flutter are navigator and drawer
▪ Sstack navigation allows transitions by stacking pages or screens
▪ Tab navigations enable users to switch between sections
▪ Drawer navigation slides out from the side of the screen
*/
