Coding exercises to be used with iOS engineering interviews.

## Requirements: 

Please create a simple app to search photos on Flickr using their free API. The app should have a search bar above a collection displaying the images resulting from the search. Details on Flickr’s API and recommended request are below. The app does not need to be production-ready, but should represent how you approach architecture, maintenance, and testability.

## Notes: 
- Feel free to use UIKit (programmatic, storyboards, xibs) or SwiftUI, whichever you feel plays to your strengths (at VSCO we favor programmatic UI as we find this easier to maintain with a larger team). 
- Please initialize git within your project and make commits as you iterate. We’re not concerned so much with the content of the commits as much as getting a sense of your facility with git. 
- We love tests, and given the short amount of time to develop this app we’re looking more for an awareness of testability than quantity of unit tests. 
- Please feel free to use frameworks as needed (for example, Alamofire). In general we’re conservative with adding third-party frameworks. Please be prepared to discuss what you took into consideration when choosing a framework (ease of use, security, performance, etc) as well as your choice of dependency management (Cocoapods, SPM, Carthage). 
- Architecture/Patterns are up to you (MVVM, MVC, Coordinator, Redux, etc). Please be prepared to discuss your choices and how it might lend itself to separation of concerns, maintenance, collaboration, and testability.
- Please include a README in your project describing time spent, challenges,, trade-offs, potential edge cases and next steps you’d take given more time.
- Note that the response from Flickr is paginated. Time permitting, please take this into consideration in your implementation.
