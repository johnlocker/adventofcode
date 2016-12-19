######
# Task 2
# setwd(paste0(getwd(), '/adventofcode/adventofcode'))
input <- read.table('task2/input.txt', sep = ',', stringsAsFactors = FALSE)
input <- as.vector(input$V1)

# Task 2a
numMatrix <- matrix(0, ncol = 3, nrow = 3)
numMatrix[2, 2] <- 1
keypad <- matrix(c(1:9), ncol = 3, byrow = TRUE)
code <- numeric(length = length(input))
# test input
# input <- c('ULL', 'RRDDD', 'LURDL', 'UUUUD')

for(i in 1:length(input)) {
  seqSplit <- strsplit(input[i], '')[[1]]
  for(move in seqSplit) {
    cat('current move:', move, '\n')
    curPos <- which(numMatrix == 1, arr.ind = TRUE)
    if(move == 'U') {
      nextPos <- c(curPos[1] - 1, curPos[2])
    }
    if(move == 'D') {
      nextPos <- c(curPos[1] + 1, curPos[2])
    }
    if(move == 'L') {
      nextPos <- c(curPos[1], curPos[2] - 1)
    }
    if(move == 'R') {
      nextPos <- c(curPos[1], curPos[2] + 1)
    }
    if(!(0 %in% nextPos | 4 %in% nextPos)) {
      numMatrix[curPos[1], curPos[2]] <- 0
      numMatrix[nextPos[1], nextPos[2]] <- 1
    }
    print(numMatrix)
    # Sys.sleep(0.1)
  }
  code[i] <- keypad[which(numMatrix == 1, arr.ind = TRUE)]
  cat('Number is:', keypad[which(numMatrix == 1, arr.ind = TRUE)], '\n')
}

# Task 2b
numMatrix <- matrix(0, ncol = 5, nrow = 5)
numMatrix[c(1, 5), c(1, 2, 4, 5)] <- NA
numMatrix[c(2, 4), c(1, 5)] <- NA

keypad <- numMatrix
keypad[!is.na(keypad)] <- c(5, 2, 6, 'A',
                            1, 3, 7, 'B', 
                           'D', 4, 8, 'C', 9)

# test input
# input <- c('ULL', 'RRDDD', 'LURDL', 'UUUUD')
numMatrix[3, 1] <- 1
code <- numeric(length = length(input))

for(i in 1:length(input)) {
  seqSplit <- strsplit(input[i], '')[[1]]
  for(move in seqSplit) {
    cat('current move:', move, '\n')
    curPos <- which(numMatrix == 1, arr.ind = TRUE)
    if(move == 'U') {
      nextPos <- c(curPos[1] - 1, curPos[2])
    }
    if(move == 'D') {
      nextPos <- c(curPos[1] + 1, curPos[2])
    }
    if(move == 'L') {
      nextPos <- c(curPos[1], curPos[2] - 1)
    }
    if(move == 'R') {
      nextPos <- c(curPos[1], curPos[2] + 1)
    }
    if(0 %in% nextPos | 6 %in% nextPos) next
    if(!is.na(numMatrix[nextPos[1], nextPos[2]])) {
      numMatrix[curPos[1], curPos[2]] <- 0
      numMatrix[nextPos[1], nextPos[2]] <- 1
    }
    print(numMatrix)
  }
  code[i] <- keypad[which(numMatrix == 1, arr.ind = TRUE)]
  cat('Number is:', keypad[which(numMatrix == 1, arr.ind = TRUE)], '\n')
}