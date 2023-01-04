# Multiplatform SwiftUI Template

## Explanation

This repository serves as a starting-point/template that I use whenever I start a new app. Of course this is opionated because it is setup the way I like working with Xcode/Swift projects, so let me provide some reasoning for some of the stuff in here:

### Pure Swift

I don't know Objective-C and Swift is the language I have been using and learning for years so the template is geared towards Swift and more specifically SPM.
There is a regular `.xcodeproj` file in there of course but to avoid merge conflicts, and even more importantly, help modularisation, I usually put all my business logic and UI into an SPM package which is then references as a local dependency in the project file.
Generally, I avoid adding stuff to the project file as much as possible (again, to avoid merge conflicts)

**Note: There is a branch named `tuist` with the same setup, but using [tuist](https://tuist.io) to generate the project files which is kind of a middle ground**

### Fastlane

There's a bootstrapped `fastlane` folder in there with the basic setup for `match` and uploading to App Store Connect

### swift-format

I also included a `.swiftformat` file that I like to use, with the options enabled/disabled that I prefer

## Usage

- Create a new repository from this template
- clone your newly created repo
- run `cd folder/of/your/repo`
- open the folder in Visual Studio Code or similar
- search for `MyApp` and rename everything accordingly
- rename all the folders as well
- update the bundle identifier in `Configuration/Common.xcconfig`
- change all the metadata in the `fastlane` folder (or get rid of it)
- you're done!
