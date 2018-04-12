#' cloudmap(api, city, dense)
#'
#'Returns a plot of how dense clouds are in a given area
#'
#' @param api api of user
#' @param city name of a city lowercase
#' @param dense Transparency of points on plot
#'
#' @return A 2 by 2 plot latitude and longitude plot of points where the transparancy of the points corresponds to how cloudy that area is
#' @export
#'



cloudmap <- function(api, city, country='', dense=0.2) {
  if (country!='') {
    url <-  paste0('http://api.openweathermap.org/data/2.5/weather?q=',city,',',country,'&APPID=',api)
  }else{
    url <- paste0('http://api.openweathermap.org/data/2.5/weather?q=',city,'&APPID=',api)
    ow <- content(GET(url))

    lat <-  ow$coord$lat
    lon <-  ow$coord$lon

    lat <-  seq(lat-1, lat+1, by=dense)
    lon <-  seq(lon-1, lon+1, by=dense)

    df <- expand.grid(lon=lon, lat=lat) %>% data.frame()

    C <- NULL

    for (x in c(1:length(df$lat))){
      url <- paste0('http://api.openweathermap.org/data/2.5/weather?lat=',df$lat[x],'&lon=',df$lon[x],'&APPID=',api)

      OW <- GET(url) %>% content()

      C <- append(C, OW$clouds$all)

    }

    df$clouds <- C
    p <- ggplot(df,aes(lon,lat)) + geom_point(aes(alpha=clouds/max(clouds)), color='blue') + labs(title='Cloud Density', x= 'Longitude', y='Latitude') + scale_fill_continuous(guide = guide_legend(title = "Cloudiness"))
    return(p)
  }
}
