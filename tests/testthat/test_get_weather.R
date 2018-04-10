library(testthat)

good_city_name <- "London,UK"
good_api <- "ea4a67edc7fc8631bf71089ab4ec1c09"

wrong_city_name <- "aaa"
wrong_api <- "aaa"

test_that("Wrong city name",{
  expect_error(get_weather(wrong_city_name, good_api),"wrong city name") #test if the city name is correct
})

test_that("Wrong API",{
  expect_error(get_weather(good_city_name, wrong_api),"wrong API") #test if the API is correct
})

test_that("Check data integrity",{
  result<-get_weather(good_city_name, good_api)

  # Expected outputs
  expect_equal(is.data.frame(result), TRUE) # output is a data frame
  expect_equal(nrow(result), 8) # output is 8 rows
  expect_equal(ncol(result), 3) # output is 3 columns
})
