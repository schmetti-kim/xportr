# xportr_options ----
## Test 1: options are originally set as expected ----
test_that("options Test 1: options are originally set as expected", {
  op <- options()

  expect_equal(op$xportr.df_domain_name, "dataset")
  expect_equal(op$xportr.df_label, "label")
  expect_equal(op$xportr.domain_name, "dataset")
  expect_equal(op$xportr.variable_name, "variable")
  expect_equal(op$xportr.type_name, "type")
  expect_equal(op$xportr.label, "label")
  expect_equal(op$xportr.length, "length")
  expect_equal(op$xportr.format_name, "format")
  expect_equal(op$xportr.order_name, "order")
})

## Test 2: xportr_options: options can be fetched using the xportr_options ----
test_that("options Test 2: xportr_options: options can be fetched using the xportr_options", {
  expect_equal(xportr_options(), xportr_options_list)
  new_domain <- "new domain name"
  new_label <- "new label name"
  op <- options(xportr.df_domain_name = new_domain, xportr.df_label = new_label)
  on.exit(options(op), add = TRUE, after = FALSE)
  domain <- xportr_options("xportr.df_domain_name")$xportr.df_domain_name
  domain_label <- xportr_options(c("xportr.df_domain_name", "xportr.df_label"))

  expect_equal(domain, new_domain)
  expect_equal(domain_label, list(xportr.df_domain_name = new_domain, xportr.df_label = new_label))
})

## Test 3: xportr_options: options can be set using the xportr_options ----
test_that("options Test 3: options can be set using the xportr_options", {
  op <- options()
  on.exit(options(op), add = TRUE, after = FALSE)
  old_name <- "old name"
  new_name <- "new name"
  old_label <- "old label"
  new_label <- "new label"
  options(xportr.df_domain_name = old_name, xportr.df_label = old_label)
  old_values <- xportr_options(c("xportr.df_domain_name", "xportr.df_label"))
  expect_equal(old_values, list(xportr.df_domain_name = old_name, xportr.df_label = old_label))

  xportr_options(xportr.df_domain_name = new_name, xportr.df_label = new_label)
  new_values <- xportr_options(c("xportr.df_domain_name", "xportr.df_label"))
  expect_equal(new_values, list(xportr.df_domain_name = new_name, xportr.df_label = new_label))
})

## Test 4: xportr_options: xportr.order_verbose can be set ----
test_that("options Test 4: xportr.order_verbose can be set", {
  op <- options()
  on.exit(options(op), add = TRUE, after = FALSE)

  expect_silent(xportr_options(xportr.order_verbose = "warn"))
  expect_equal(getOption("xportr.order_verbose"), "warn")
})

## Test 5: Global option is correctly overridden by the following `xportr_metadata` verbose argument ----
test_that("options Test 5: Global option is correctly overridden by the following `xportr_metadata` verbose argument", {
  # Save original options to restore later
  old_options <- options()
  on.exit(options(old_options), add = TRUE, after = FALSE)

  # Test dataset and metadata
  adsl <- data.frame(
    USUBJID = c("1001", "1002", "1003")
  )

  metadata <- data.frame(
    dataset = "ADSL",
    variable = "USUBJID",
    type = "logical"
  )

  # Configure the global option
  xportr_options(xportr.type_verbose = "warn")

  # The snapshot should capture the type coercion issue as a "message"
  expect_snapshot(
    adsl %>%
      xportr_metadata(metadata, "ADSL", verbose = "message") %>%
      xportr_type()
  )
})

## Test 6: Both `xportr_metadata` verbose and global option are correctly overridden by the following function parameter ----
test_that("options Test 6: Both `xportr_metadata` verbose and global option are correctly overridden by the following function parameter", {
  # Save original options to restore later
  old_options <- options()
  on.exit(options(old_options), add = TRUE, after = FALSE)

  # Test dataset and metadata
  adsl <- data.frame(
    USUBJID = c("1001", "1002", "1003")
  )

  metadata <- data.frame(
    dataset = "ADSL",
    variable = "USUBJID",
    type = "logical"
  )

  # Configure the global option
  xportr_options(xportr.type_verbose = "warn")

  # The snapshot should capture the type coercion issue as an "error"
  expect_snapshot(
    adsl %>%
      xportr_metadata(metadata, "ADSL", verbose = "message") %>%
      xportr_type(verbose = "stop"),
    error = TRUE # generates snapshot despite errors
  )
})

## Test 7: Global option is correctly used when verbose is not specified otherwise ----
test_that("options Test 7: Global option is correctly used when verbose is not specified otherwise", {
  # Save original options to restore later
  old_options <- options()
  on.exit(options(old_options), add = TRUE, after = FALSE)

  # Test dataset and metadata
  adsl <- data.frame(
    USUBJID = c("1001", "1002", "1003")
  )

  metadata <- data.frame(
    dataset = "ADSL",
    variable = "USUBJID",
    type = "logical"
  )

  # Configure the global option
  xportr_options(xportr.type_verbose = "none")

  # The snapshot should not notify the users of the type coercion issue
  expect_snapshot(
    adsl %>%
      xportr_metadata(metadata, "ADSL") %>%
      xportr_type()
  )
})
