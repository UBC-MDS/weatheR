[![Build Status](https://travis-ci.org/fyang95/weatheR.svg?branch=master)](https://travis-ci.org/fyang95/weatheR)

# weatheR
    
[![Build Status](https://travis-ci.org/UBC-MDS/weatheR.svg?branch=master)](https://travis-ci.org/UBC-MDS/weatheR)

### Contributors

* Fang Yang (@fyang95)
* Susan Fung 
* Ted Thompson (@TeddTech)
* Tina Qian

### Overview

This package provides four useful wrapper functions around the [OpenWeatherMap API](https://openweathermap.org/). The four functions are: `distmap()`, `cloudmap()`, `get_weather()` and `get_weather_four_days()`

* `distmap(api, 'city1', 'city2')`: Calculate distance between two cities

	*Argument:*

  `api` - User's API

  `city1` - Name of a city (lowercase)

  `city2` - Name of a city (lowercase)

	*Value:*

  Returns a string telling the user the distance between two cities in km

* `cloudmap(api, 'alberta', dense = 0.2 )`: Returns most popular response on webpage.       

  *Arguments:*

    `api` - User's API

    `city` - Name of a city (lowercase)

    `dense` - Transparency of points

  *Value:*

    Returns a response. This will be of a character type.

* `get_weather_four_days(api, 'Vancouver' )`: Returns 4-day weather forecast for selected city

    *Arguments:*

    `api` -  API Key for openweathermap.org

    `city` - City name and country code divided by comma, use ISO 3166 country codes

    *Value:*

    Data frame containing temp_min, temp_max, humidity and weather for the next 4 days in city local time. Temperature in Celsius      

### Installation

Install this package directly from GitHub:
```
devtools::install_github("UBC-MDS/weatheR")
```

### Usage
Simple example demonstrating the functionality of this package:

```
# load package
library(weatheR)

api <- # Enter Your API here

# Calculate distance between two cities
distmap(api, 'vancouver', 'toronto')

# Returns a plot showing how dense clouds are in the area
cloudmap(api, 'alberta', dense = 0.2 )

# Returns weather forecast for the next 24 hours for selected city
get_weather(api, city):

# Returns 4-day weather forecast for selected city
get_weather_four_days(api, 'Vancouver')
```
