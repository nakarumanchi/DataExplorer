context("create report")

test_that("test if quiet is working for create_report", {
  skip_on_cran()
  dir_name <- getwd()
  file_name <- "testthat-report.html"
  file_dir <- file.path(dir_name, file_name)
  expect_silent(create_report(iris, output_file = file_name, output_dir = dir_name, quiet = TRUE))
  expect_message(tmp <- capture.output(create_report(iris, output_file = file_name, output_dir = dir_name, quiet = FALSE)))
  expect_message(tmp <- capture.output(create_report(iris, output_file = file_name, output_dir = dir_name)))
  if (file.exists(file_dir)) file.remove(file_dir)
})

test_that("test if report is generated", {
  skip_on_cran()
  dir_name <- getwd()
  file_name <- "testthat-report.html"
  file_dir <- file.path(dir_name, file_name)
  create_report(iris, output_file = file_name, output_dir = dir_name, quiet = TRUE)
  expect_true(file.exists(file_dir))
  expect_gte(file.info(file_dir)$size, 100000)
  if (file.exists(file_dir)) file.remove(file_dir)
})
