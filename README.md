# weatheR
    
[![Build Status]()

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
get_weather_four_days(appid, city):
```

### Contributors

* Fang Yang
* Susan Fung (@fyang95)
* Ted Thompson (@TeddTech)
* Tina Qian

### Overview

The `SOresponse` package is used for text analysis of Stack Overflow responses. There are both R and Python versions for this package. This package will include 4 functions: `distmap()` `cloudmap()` `get_weather()` `get_weather_four_days()`

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


Similar packages to `weatheR`, are `ROpenWeatherMap` and `owmr`. Both these packages seem to be well managed and has been kept up to date. There links respectively are https://github.com/crazycapivara/owmr and https://github.com/mukul13/ROpenWeatherMap.
