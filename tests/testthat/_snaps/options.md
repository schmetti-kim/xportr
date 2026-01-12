# options Test 5: Global option is correctly overridden by the following `xportr_metadata` verbose argument

    Code
      adsl %>% xportr_metadata(metadata, "ADSL", verbose = "message") %>% xportr_type()
    Message
      
      -- Variable type mismatches found. --
      
      v 1 variable coerced
      Variable type(s) in dataframe don't match metadata: `USUBJID`
      - `USUBJID` was coerced to <numeric>. (type in data: character, type in metadata: logical)
      i Types in metadata considered as character (xportr.character_metadata_types option): 'character', 'char', 'text', 'date', 'posixct', 'posixt', 'datetime', 'time', 'partialdate', 'partialtime', 'partialdatetime', 'incompletedatetime', 'durationdatetime', and 'intervaldatetime'
      i Types in metadata considered as numeric (xportr.numeric_metadata_types option): 'integer', 'numeric', 'num', and 'float'
      i Types in data considered as character (xportr.character_types option): 'character'
      i Types in data considered as numeric (xportr.numeric_types option): 'integer', 'float', 'numeric', 'posixct', 'posixt', 'time', 'date', and 'hms'
    Output
        USUBJID
      1    1001
      2    1002
      3    1003

# options Test 6: Both `xportr_metadata` verbose and global option are correctly overridden by the following function parameter

    Code
      adsl %>% xportr_metadata(metadata, "ADSL", verbose = "message") %>% xportr_type(
        verbose = "stop")
    Message
      
      -- Variable type mismatches found. --
      
      v 1 variable coerced
    Condition
      Error in `xportr_logger()`:
      ! Variable type(s) in dataframe don't match metadata: `USUBJID`
      - `USUBJID` was coerced to <numeric>. (type in data: character, type in metadata: logical)
      i Types in metadata considered as character (xportr.character_metadata_types option): 'character', 'char', 'text', 'date', 'posixct', 'posixt', 'datetime', 'time', 'partialdate', 'partialtime', 'partialdatetime', 'incompletedatetime', 'durationdatetime', and 'intervaldatetime'
      i Types in metadata considered as numeric (xportr.numeric_metadata_types option): 'integer', 'numeric', 'num', and 'float'
      i Types in data considered as character (xportr.character_types option): 'character'
      i Types in data considered as numeric (xportr.numeric_types option): 'integer', 'float', 'numeric', 'posixct', 'posixt', 'time', 'date', and 'hms'

# options Test 7: Global option is correctly used when verbose is not specified otherwise

    Code
      adsl %>% xportr_metadata(metadata, "ADSL") %>% xportr_type()
    Message
      
      -- Variable type mismatches found. --
      
      v 1 variable coerced
    Output
        USUBJID
      1    1001
      2    1002
      3    1003

