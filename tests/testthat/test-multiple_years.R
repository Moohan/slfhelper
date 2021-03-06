test_that("read multiple years works", {
  # Read in multiple years
  indiv <- read_slf_individual(c("1718", "1819"),
    columns = c("year", "anon_chi"),
    from = 1,
    to = 50
  )

  # Test for anything odd
  expect_type(indiv, "list")

  # Test for the existance of the correct variables
  expect_named(indiv, c("year", "anon_chi"))
  expect_length(indiv, 2)

  # Test for the correct number of rows (50 * 2)
  expect_equal(nrow(indiv), 100)

  # Test that we have 50 rows from each year
  expect_equal(
    dplyr::count(indiv, year),
    data.frame(year = c("1718", "1819"), n = c(50L, 50L), stringsAsFactors = F)
  )
})
