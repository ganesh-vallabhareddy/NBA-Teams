# NBA Teams App

This is a Flutter application that displays a list of NBA teams using data fetched from the 'balldontlie.io' API. It allows users to view the abbreviations and cities of various NBA teams.

I have developed this application as a learning project to gain hands-on experience with API integration, HTTP request methods, and other related concepts.

## Features

- Fetches NBA team data from 'balldontlie.io' API.
- Displays a list of NBA teams with their abbreviations and cities.
- User-friendly and straightforward UI.

## How it works

The app uses the 'http' package to make a GET request to the 'balldontlie.io' API, which provides NBA team data. The data is fetched asynchronously using the 'FutureBuilder' widget to handle the loading state. Once the data is obtained, it is decoded from JSON format using the 'dart:convert' library. The 'Team' class is used to represent each NBA team, and a list of 'Team' objects is populated with the fetched data.

The main UI consists of a 'Scaffold' with an app bar displaying the title 'NBA Teams'. The body of the app shows a list of NBA teams using the 'ListView.builder' widget, where each team is displayed in a 'ListTile' with its abbreviation and city.
