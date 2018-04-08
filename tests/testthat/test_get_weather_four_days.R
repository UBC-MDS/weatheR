context("Testing get_weather_four_days function")

good_appid <- "30fa7fb8f61487eb20b39289b6726d29"
good_city <- "Toronto"

bad_appid <- ""
bad_city <- ""

test_that("Check data integrity",{
  result<-get_weather_four_days(good_appid, good_city)
  
  # Expected outputs
  expect_equal(is.data.frame(result), TRUE) # output is a data frame
  expect_equal(nrow(result), 4) # output is four rows, one for each day of forecast
  expect_equal(ncol(result), 5) # output is five columns
})

test_that('Error in parameters', {
  # expected error:
  expect_error(get_weather_four_days(bad_appid,good_city), "Invalid API key")
  expect_error(get_weather_four_days(good_appid,bad_city), "Invalid city name")
})