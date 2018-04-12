context("Testing cloudmap")

api <- '02c3680b276051044255784768becd85'
a <- content(GET(paste0("http://api.openweathermap.org/data/2.5/weather?q=toronto&APPID=",api)))
city <- 'toronto'

# This test validates the api
test_that("Validate api", {
  expect_equal(a$name,"Toronto")
})

# This test the plot
test_that("Check cloudmap", {
  expect_equal(typeof(cloudmap(api, city, dense = 0.2 )),"list")
})
