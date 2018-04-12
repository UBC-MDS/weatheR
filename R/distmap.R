#' distmap(api, city1, city2)
#'
#'Returns distance between two cities.
#'
#' @param api api of user
#' @param city1 name of a city lowercase
#' @param city2 name of a city lowercase
#'
#' @return Distance between two cities in km
#' @export
#'



distmap <- function(api, city1, city2) {
  require(geosphere)
  require(httr)
  require(dplyr)

  url <- paste0('http://api.openweathermap.org/data/2.5/weather?q=',city1,'&APPID=',api)
  ow <- content(GET(url))

  lat1 <-  ow$coord$lat
  lon1 <-  ow$coord$lon

  url <- paste0('http://api.openweathermap.org/data/2.5/weather?q=',city2,'&APPID=',api)
  ow <- content(GET(url))

  lat2 <-  ow$coord$lat
  lon2 <-  ow$coord$lon

  D <- geosphere::distm(c(lon1, lat1), c(lon2, lat2))
  r <- paste("The distance between", city1, "and", city2, "is", D, "km")
  return(r)

}
