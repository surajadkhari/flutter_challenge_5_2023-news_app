

# News App

A Flutter news app that uses the Riverpod state management library, follows a Domain Driven Architecture (DDA) design pattern, and check for internet connectivity 
## Features

- Browse the latest news stories from a variety of sources.
- Search for news stories by keyword or phrase.
- Check for internet connection

## Dependencies

This app depends on the following packages:


•	dio: ^5.0.0
•	dartz: ^0.10.1
•	flutter_riverpod: ^2.2.0
•	cached_network_image: ^3.2.3
•	flutter_animate: ^4.1.1+1
•	flutter_svg: ^2.0.1
•	shimmer: ^2.0.0
•	intl: ^0.18.0
•	firebase_messaging: ^14.3.0
•	flutter_local_notifications: ^13.0.0


## API

This app uses the NewsAPI to fetch news articles. You can sign up for a free API key at https://newsapi.org/.


## Installation

To run this app locally, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the project directory in your terminal.
3. Run `flutter pub get` to install the required dependencies.
4. Run `flutter run` to start the app.
4. Replace API key with your own key

## Usage

Once the app is running, you can use the following features:

- Browse news stories by scrolling through the main screen.
- Search for news stories by typing keywords into the search bar.
- Check internet connection .

## Code Structure

This app follows a Domain Driven Architecture (DDA) pattern, with separate layers for the domain, application, and presentation logic. The code is organized into the following folders:

- `lib/domain`: Contains the domain logic for the app, including model, repositories, and datasource.
- `lib/presentation`: Contains the presentation controller for the app, including widgets and screens.



### Screenshots


