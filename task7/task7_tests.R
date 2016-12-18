# Tests
test1 <- "abba[mnop]qrst"
test2 <- "abcd[bddb]xyyx"
test3 <- "aaaa[qwer]tyui"
test4 <- 'ioxxoj[asdfgh]zxcvbn'
test5 <- 'aba[bab]xyz'
test6 <- 'xyx[xyx]xyx'
test7 <- 'aaa[kek]eke'
test8 <- 'zazbz[bzb]cdb'

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

if (DetectSSL(strsplit(test5, '')[[1]])) {
  cat('\nTest5 successful.')
} else {
  cat('\nTest5 failed.')
}

if (DetectSSL(strsplit(test6, '')[[1]])) {
  cat('\nTest6 failed.')
} else {
  cat('\nTest6 successful.')
}

if (DetectSSL(strsplit(test7, '')[[1]])) {
  cat('\nTest7 successful.')
} else {
  cat('\nTest7 failed.')
}

if (DetectSSL(strsplit(test8, '')[[1]])) {
  cat('\nTest8 successful.')
} else {
  cat('\nTest8 failed.')
}