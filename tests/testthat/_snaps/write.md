# xportr_write Test 15: Large file sizes are reported and warned

    Code
      xportr_write(large_df, path = tmp)
    Condition
      Warning:
      i xpt file size is: 8.01GB.
      x XPT file sizes should not exceed 5GB. It is recommended you call `xportr_write` with `max_size_gb` set to 5 or less to split the file into smaller files.

# xportr_write Test 17: `xportr_write` validates variable name lengths

    Code
      adsl %>% xportr_write(tmp, strict_checks = TRUE)
    Condition
      Error in `xportr_write()`:
      ! The following validation checks failed:
      * Variable `VERYLONGVAR` must be 8 characters or less.

# xportr_write Test 18: `xportr_write` validates first characters of variable names

    Code
      adsl %>% xportr_write(tmp, strict_checks = TRUE)
    Condition
      Error in `xportr_write()`:
      ! The following validation checks failed:
      * Variable `.VAR` must start with a letter.
      * Variable `.VAR` cannot contain any non-ASCII, symbol or underscore characters.
      * Variable `.VAR` cannot contain any lowercase characters.

# xportr_write Test 19: `xportr_write` detects illegal characters in variable names

    Code
      adsl %>% xportr_write(tmp, strict_checks = TRUE)
    Condition
      Error in `xportr_write()`:
      ! The following validation checks failed:
      * Variable `VA_R` cannot contain any non-ASCII, symbol or underscore characters.
      * Variable `VA_R` cannot contain any lowercase characters.

# xportr_write Test 20: `xportr_write` detects lowercase letters in variable names

    Code
      adsl %>% xportr_write(tmp, strict_checks = TRUE)
    Condition
      Error in `xportr_write()`:
      ! The following validation checks failed:
      * Variable `VaR` cannot contain any lowercase characters.
