#' Retrieve 4-day weather forecast
#'
#' @param appid API Key for openweathermap.org. Get one here: http://openweathermap.org/appid
#' @param city city name and country code divided by comma, use ISO 3166 country codes
#'
#' @return Data frame of temp_min, temp_max, humidity and weather for the next 4 days in city local time. Temperature in Celsius
#' @export
#'
get_weather_four_days<- function(appid, city){
  require(httr)
  
  # API call
  url <- GET(paste0("api.openweathermap.org/data/2.5/forecast?q=",city,"&units=metric&APPID=",appid))
  
  # Error handing: make sure status code is ok
  sc <- status_code(url)
  if (sc == 401){
    stop("Invalid API key")
  }
  else if (sc == 400){
    stop("Invalid city name")
  }
  
  # Extract content
  data <- content(url)
  
  weather<-data.frame()
  n<-1
  
  # Loop through content to get required attributes
  for (i in 1:length(data$list)){
    if ((substr(strsplit(data$list[[i]]$dt_txt," ")[[1]][2],1,2) =="00")& # Using forecast at 12 am
        (n<=4)){
      weather[n,1] <- substr(strsplit(data$list[[i]]$dt_txt," ")[[1]][1],1,15) #date in YYYY-MM-DD
      weather[n,2] <- round(data$list[[i]]$main$temp_min, digits = 0) # Min daily temperature
      weather[n,3] <- round(data$list[[i]]$main$temp_max, digits = 0) # Max daily temperature
      weather[n,4] <- data$list[[i]]$main$humidity # Humidity, %
      weather[n,5] <- data$list[[i]]$weather[[1]]$main #Group of weather parameters (Rain, Snow, Extreme etc.)
      n <- n+1
    }
  }
 
  # Rename columns of data frame
  names(weather)<-c("date", "temp_min","temp_max", "humidity", "weather")
  
  return (weather)
}

appid <- "30fa7fb8f61487eb20b39289b6726d29"
city <- "Vancouver"
van <- get_weather_four_days(appid, city)

