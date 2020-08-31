# Square Mobile Project

## Thank you for taking the time to review this project 🎉
• Built and compiled with Xcode 12.0 beta 4
• Made to run on iOS 14 (but could work on iOS 13+)
• Focus was tailored towards mobile UI 

### Third Party Dependecies Used:
• Stevia
This was used for purely auto layout synthetic suger. This library makes working with autolayout and constraints so much easier. It is very similar to Square's open sourced Paralayout library.

• Kingfisher
This library was used for caching images retrieved from the JSON payload. It has built in placeholder, loading (downloading) activity indicators, downsampling, and rounded corner processing.

### Copied in code:
• Colors.swift
Within this file there resides a convenience extension of UIColor that translates a hex color string to UIColor. This makes it easier to work with the custom colors I used when I designed the layout within Sketch (file included).

• String+Extension.swift
This piece of code I kept in my snippets whenever I need to deal with presenting phone numbers in a more elegeant manner.

### Architecture:
• MVVM
• Depedency Injection
• Depedency Inversion
• SRP

I tried to follow SOLID principles as much as possible.

### Time to Completion:
• 5-7 hours

I took more time abstracting the network layer into proper interfaces/protocols so that the codebase was more easily testable and extensible for the future. I am utilizing separate structs (found in the Helpers directory) for Strings, Colors, Layout, Fonts. The service layer is abstracted behind a protocol and funnels into a generic networking layer. Both are injected into the main view controller at run time. The goal was the keep the TableViewController as lean as possible, thus the data source methods were extracted out into its own file, a view model was used to handle binding the TableViewCell UI properties. Some optimizations could have been employed in the form of a Presenter object that handled displaying the alerts to the user or at the very least extend UIView and have public methods.

There are 5 unit tests included. Three of the tests were for testing the different JSON endpoints that were supplied. One test was for testing a mock bad network request. The last test was to test the view model itself.
