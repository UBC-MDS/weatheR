context("Test function cwd")
test_that("cwd output type is correct", {
  key<-"&APPID=8196eccade1594d99afd30e0924dca7d"
  location<-"vancouver,CA"  
  
  expect_is(cwd(key,location),"character")

})
