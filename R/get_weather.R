# get_weather(city)
#
# Returen a picture of temperature and humidity of a city
#
# For example: get_weather("London,UK")
#
#


get_weather <- function(city,api){
  require(httr)
  require(ggplot2)
  require(dplyr)
  require(tidyr)

  #use public api to grab data
  url <- GET(paste0("api.openweathermap.org/data/2.5/forecast?q=",city,"&appid=",api))
  if (status_code(url) == 404){
    stop("wrong city name")
  }
  else if (status_code(url) == 401){
    stop("wrong API")
  }

  data <- content(url)

  # load time
  time <- rep(0,8)
  for (i in seq(1,8)){
    time[i] <- substr(strsplit(data$list[[i]]$dt_txt," ")[[1]][2],1,5)
  }

  # load temperature
  temp <- rep(0,8)
  for (i in seq(1,8)){
    temp[i] <- data$list[[i]]$main$temp-273.15
  }
  temp <- round(temp,digits = 1)

  # load humidity
  humidity <- rep(0,8)
  for (i in seq(1,8)){
    humidity[i] <- data$list[[i]]$main$humidity*0.1
  }
  humidity

  #create a data frame of every variables
  dataframe <- data.frame(time,temp,humidity)

  # create pictures
  #p <- ggplot(dataframe,aes(x = time))+
  #  geom_point(aes(y = temp),color = "blue",size  =2)+
  #  geom_text(aes(y=temp, label = paste0(temp,"C")), vjust=2)+
  #  geom_line(aes(y = temp, group = 1), color = "blue")+
  #  geom_bar(aes(y=humidity),stat = "identity",alpha = 0.5)+
  #  geom_text(aes(y=humidity, label = humidity*10), vjust=2)+
  #  scale_y_continuous(sec.axis = sec_axis(~.*5, name = "Humidity"))+
  #  labs(x = "Time", y = "Temperature")+
  #  ggtitle(paste0("Weather of ",city))
  return(dataframe)
}
