# MarvelCharacters
| App Experience |
| ------------------- |
| ![Alt text](https://i.imgur.com/omo193F.gif) |

This application shows a list of Marvel characters. More details are revealed on a new screen when selecting one of them.  
It is fed with content from The Marvel API.  
The API documentation can be found here: ​https://developer.marvel.com/.
   
Xcode 11.1  
Swift 5

## Architecture

### MVP (Clean Architecture)
Model-View-Presenter architectural pattern was applied in this project.  
The application was developed aiming at good programming practices and clean code.  
A Service Layer is used in order to access the remote data found in The Marvel API. Furthermore, the app navigation is handled using a Router component.

## Layout
The whole layout was designed using view code approach and the screens were developed to fit well on different iPhone models.

## Unit Tests
Once the Presenter is the most critical layer found in each scene, all of them were fully tested, reaching a code coverage of 100% on them.

## External Dependencies
CryptoSwift pod was used in this project in order to generate a hash necessary to fetch data from Marvel API  ​https://cocoapods.org/pods/CryptoSwift. 

## Setup & Running
To setup the project, simply run pod install and you're good to go (remember to open the .xcworkspace file generated by CocoaPods).
