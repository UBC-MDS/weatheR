#' Get current weather description (cwd)
#'
#' The function helps to extract description of current weather from the OpenWeatherMap API
#'
#' @param key A string, your API key
#' @param location A string, the location where you want to check the weather
#'
#' @return A string that describe current weather in the location indicated
#' @export
#' @examples
#'
#' key<-"&APPID=8196eccade1594d99afd30e0924dca7d"
#' cwd(key,"Vancouver,CA")
#'

cwd<-function(key,location){

  # prepare url
  base<-"api.openweathermap.org/data/2.5/weather?q="
  url<-paste0(base,location, "%appid=", key)
  # get information from API using the url
  text<-httr::GET(url)
  data<-httr::content(text)

  # extract information from data
  info<-paste0("The weather status in", data$name, ",", data$sys$country, "(Latitude:", data$coord$lat,", Longitude:", 
               data$coord$lon,") is", data$weather[[1]]$description,", with mean temperature", data$main$temp-273.15,
               "C, humidity", data$main$humidity,", visibility",data$visibility,", and wind speed", data$wind$speed,".")
  return(info)
}
