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
  url<-paste0(base,location,key)
  # get information from API using the url
  text<-httr::GET(url)
  data<-httr::content(text)

  # extract information from data
  info<-paste("The weather status in",
              paste0(data$name,","),data$sys$country,paste0("(",paste("Latitude:",paste0(data$coord$lat,",") ,"Longitude:",data$coord$lon),")"),
              "is",paste0(data$weather[[1]]$description,","),"with mean temperature",paste0(data$main$temp-273.15,"°C,"),
              "humidity",paste0(data$main$humidity,","),
              "visibility",paste0(data$visibility,","),
              "and wind speed",paste0(data$wind$speed,"."))
  return(info)
}
