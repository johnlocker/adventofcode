######
# Task 4
# setwd(paste0(getwd(), '/adventofcode/adventofcode'))
input <- read.table('task4/input.txt', sep = ',', stringsAsFactors = FALSE)
input <- as.vector(input$V1)

cipher <- function(x, num) return(letters[(which(letters == x) + num) %% 26])

sectorSum <- 0
decryptedRooms <- data.frame(room = character(length = length(input)),
                             num = numeric(length = length(input)),
                             stringsAsFactors = FALSE)
for(i in 1:length(input)) {
  splString <- strsplit(input[i], '-')[[1]]
  charStr <- splString[c(1:(length(splString) - 1))]
  charSpl <- strsplit(paste(charStr, collapse = ' '), '')[[1]]
  checkStr <- splString[length(splString)]
  num <- as.numeric(strsplit(checkStr, '\\[')[[1]][1])
  charSeq <- gsub('\\]', '', strsplit(checkStr, '\\[')[[1]][2])
  # check if letter freq is equal
  if(charSeq == paste(names(sort(table(charSpl[charSpl != ' ']), 
                                 decreasing = TRUE)[c(1:5)]),
                      collapse = '')) {
    sectorSum <- sectorSum + num
  }
  decoded <- numeric()
  for(j in 1:length(charSpl)) {
    decoded[j] <- ifelse(charSpl[j] == ' ', charSpl[j], cipher(charSpl[j], num))
  }
  decryptedRooms$room[i] <- paste(decoded, collapse = '')
  decryptedRooms$num[i] <- num
}
cat('The sum of sector IDs of real rooms is', sectorSum)
print(decryptedRooms)
decryptedRooms[which(grepl('north', decryptedRooms$room)), ]

