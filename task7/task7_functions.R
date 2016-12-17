# Functions
CheckReverseABBA <- function(chars) {
  if(chars[1] == chars[4] & chars[2] == chars[3]) {
    if(chars[1] != chars[2]) {
      return(TRUE)
    } else {
      return(FALSE)
    }
  } else {
    return(FALSE)
  }
}

DetectTLS <- function(splString) {
  cur4Chars <- character()
  TSL <- FALSE
  hNet <- FALSE
  for (i in 1:length(splString)) {
    cur4Chars <- c(cur4Chars, splString[i])
    # is hypernet?
    if(splString[i] == '[') {
      hNet <- TRUE
      cur4Chars <- character()
    }
    if(splString[i] == ']') {
      hNet <- FALSE
      cur4Chars <- character()
    }
    if(length(cur4Chars) == 4) {
      if(CheckReverseABBA(cur4Chars)) {
        TSL <- TRUE
        if(hNet) {
          return(FALSE)
        }
      }
      cur4Chars <- cur4Chars[2:length(cur4Chars)]
    }
  }
  return(TSL)
}