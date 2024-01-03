# Flutter Weather App

An application for displaying the weather in your city.

## Installation

Use the terminal to clone project to install app.

```bash
git clone https://github.com/BechkaloVolodymyr/VB-weather.git
```
After that execute the following commands: 
```bash
flutter clean
```
```bash
flutter pub get
```
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```
## How to run app
You need a file to use this application, please contact the developer. 
This file will need to be inserted into the root of the project.
After that you will be able to run the apk either using visual studio or command.

```bash
flutter run --dart-define-from-file=api-keys.json
```