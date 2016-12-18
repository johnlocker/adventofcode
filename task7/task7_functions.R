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

CheckReverseABA <- function(chars) {
  if(chars[1] == chars[3] & chars[1] != chars[2]) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
ReverseABA <- function(chars) {
  return(paste(c(chars[2], chars[1], chars[2]), collapse = ','))  
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

DetectSSL <- function(splString) {
  cur3Chars <- character()
  SSL <- FALSE
  hNet <- FALSE
  possibleABA <- vector()
  possibleBABrev <- vector()
  for (i in 1:length(splString)) {
    cur3Chars <- c(cur3Chars, splString[i])
    # is hypernet?
    if(splString[i] == '[') {
      hNet <- TRUE
      cur3Chars <- character()
    }
    if(splString[i] == ']') {
      hNet <- FALSE
      cur3Chars <- character()
    }
    if(length(cur3Chars) == 3) {
      if(CheckReverseABA(cur3Chars)) {
        if(!hNet) {
          possibleABA <- c(possibleABA, paste(cur3Chars, 
                                              collapse = ','))
        } else {
          possibleBABrev <- c(possibleBABrev, ReverseABA(cur3Chars))
        }
        
      }
      cur3Chars <- cur3Chars[2:length(cur3Chars)]
    }
  }
  for(ABA in possibleABA) {
    if(ABA %in% possibleBABrev) {
      return(TRUE)
    }
  }
  return(FALSE)
}