######
# Task 3
# setwd(paste0(getwd(), '/adventofcode/adventofcode'))
input <- read.table('task3/input.txt', sep = ',', stringsAsFactors = FALSE)
input <- as.vector(input$V1)
inputList <- list()
inputVec <- numeric()
for(i in 1:length(input)) {
  x <- as.numeric(trimws(strsplit(trimws(input[i]), ' ')[[1]]))
  inputList[[i]] <- x[!is.na(x)]
  inputVec <- rbind(inputVec, x[!is.na(x)])
}
inputVec <- c(inputVec[, 1], inputVec[, 2], inputVec[, 3])

CheckTriangle <- function(x) {
  if(x[1] + x[2] <= x[3]) return(FALSE)
  if(x[1] + x[3] <= x[2]) return(FALSE)
  if(x[2] + x[3] <= x[1]) return(FALSE)
  return(TRUE)
}

triangles <- logical(length = length(inputList))
trianglesCol <- logical(length = length(inputVec) / 3)
nums <- seq(1, length(inputVec), by = 3)
for(i in 1:length(inputList)) {
  triangles[i] <- CheckTriangle(inputList[[i]])
  trianglesCol[i] <- CheckTriangle(inputVec[c(nums[i]:(nums[i] + 2))])
}
cat('There are', sum(triangles), 'possible triangles of', length(inputList), '\n')
cat('There are', sum(trianglesCol), 'possible column triangles of', length(inputList))
