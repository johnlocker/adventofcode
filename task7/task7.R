######
# Task 7
input <- read.table('task7/input.txt', sep = ',', stringsAsFactors = FALSE)
input <- as.vector(input$V1)

# get functions
source('task7/task7_functions.R')

# check list
detectedTLS <- logical()
for(i in 1:length(input)) {
  splIP <- strsplit(input[i], '')[[1]]
  detectedTLS[i] <- DetectTLS(splIP)
}
cat(sum(detectedTLS), 'of', length(input), 'IPs support TLS.')

