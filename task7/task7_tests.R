# Tests
test1 <- "abba[mnop]qrst"
test2 <- "abcd[bddb]xyyx"
test3 <- "aaaa[qwer]tyui"
test4 <- 'ioxxoj[asdfgh]zxcvbn'

# get functions
source('task7/task7_functions.R')

if (DetectTLS(strsplit(test1, '')[[1]])) {
  cat('\nTest1 successful.')
} else {
  cat('\nTest1 failed.')
}

if (DetectTLS(strsplit(test2, '')[[1]])) {
  cat('\nTest2 failed.')
} else {
  cat('\nTest2 successful')
}

if (DetectTLS(strsplit(test3, '')[[1]])) {
  cat('\nTest3 failed.')
} else {
  cat('\nTest3 successful')
}

if (DetectTLS(strsplit(test4, '')[[1]])) {
  cat('\nTest4 successful.')
} else {
  cat('\nTest4 failed')
}