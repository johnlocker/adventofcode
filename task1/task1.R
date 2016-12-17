######
# Task 1
input <- as.vector(read.table('task1/input.txt', sep = ',', stringsAsFactors = FALSE))

xRange <- c(-10, 250)
yRange <- c(-60, 160)
# make grid
plot(-10000,
     xlim = xRange,
     ylim = yRange,
     xlab = 'x',
     ylab = 'y',
     main = 'grid',
     bty = 'n')
for(i in xRange[1]:xRange[2]) {
  segments(i, yRange[1], i, yRange[2], col = 'grey92')
  if(i %% 10 == 0) segments(i, yRange[1], i, yRange[2])
}
for(i in yRange[1]:yRange[2]) {
  segments(xRange[1], i, xRange[2], i, col = 'grey92')
  if(i %% 10 == 0) segments(xRange[1], i, xRange[2], i)
}
for(i in yRange[1]:yRange[2]) {
  if(i %% 10 == 0) segments(xRange[1], i, xRange[2], i)
}
for(i in xRange[1]:xRange[2]) {
  if(i %% 10 == 0) segments(i, yRange[1], i, yRange[2])
}

# start
start <- c(0, 0)
points(start[1], start[2], col = 'red', pch = 19)
segStart <- start
kompass <- 'north'
kompassNr <- 1
paths <- numeric()
for(w in input) {
  w <- gsub(' ', '', as.character(w))
  cat('now moving:', w, '\n')
  splitedW <- strsplit(as.character(w), '')[[1]]
  direct <- splitedW[1]
  dist <- as.numeric(paste(splitedW[c(2:length(splitedW))], collapse = ''))
  
  if(kompass == 'north') {
    if(direct == 'L') {
      segEnd <- c(segStart[1] - dist, segStart[2])
    } else {
      segEnd <- c(segStart[1] + dist, segStart[2])
    }
  }
  if(kompass == 'west') {
    if(direct == 'L') {
      segEnd <- c(segStart[1], segStart[2] - dist)
    } else {
      segEnd <- c(segStart[1], segStart[2] + dist)
    }
  }
  if(kompass == 'south') {
    if(direct == 'L') {
      segEnd <- c(segStart[1] + dist, segStart[2])
    } else {
      segEnd <- c(segStart[1] - dist, segStart[2])
    }
  }
  if(kompass == 'east') {
    if(direct == 'L') {
      segEnd <- c(segStart[1], segStart[2] + dist)
    } else {
      segEnd <- c(segStart[1], segStart[2] - dist)
    }
  }
  xPath <- c(segStart[1]:segEnd[1])
  yPath <- c(segStart[2]:segEnd[2])
  if(length(xPath) == 1) { xPath <- rep(xPath, length(yPath))}
  if(length(yPath) == 1) { yPath <- rep(yPath, length(xPath))}
  for(i in 2:length(xPath)) {
    curPath <- paste(c(xPath[i], yPath[i]), collapse = ',')
    if(curPath %in% paths) {
      cat('\ncrossing at', curPath, '\n')
      cat('Distance away:', sum(abs(as.numeric(strsplit(curPath, ',')[[1]]))), '\n')
    }
    paths <- c(paths, paste(c(xPath[i], yPath[i]), collapse = ','))
  }
  # draw path
  segments(segStart[1],
           segStart[2],
           segEnd[1],
           segEnd[2],
           col = 'blue',
           lwd = 2)
  
  
  kompassNr <- kompassNr + ifelse(direct == 'L', -1, 1)
  kompassNr <- ifelse(kompassNr == 0, 4, kompassNr)
  kompassNr <- ifelse(kompassNr == 5, 1, kompassNr)
  kompass <- c('north', 'east', 'south', 'west')[kompassNr]
  segStart <- segEnd
  Sys.sleep(0.5)
}
points(segEnd[1], segEnd[2], col = 'purple', pch = 19)

cat('Distance away:', sum(abs(segEnd)))
