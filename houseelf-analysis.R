#Basic--Data Management Review
#Dr. Granger is interested in studying the relationship between the length of house-elves’ ears and aspects of their DNA. 
#This research is part of a larger project attempting to understand why house-elves possess such powerful magic. 
#She has obtained DNA samples and ear measurements from a small group of house-elves to conduct a preliminary analysis 
#(prior to submitting a grant application to the Ministry of Magic) and she would like you to conduct the analysis for her 
#(she might know everything there is to know about magic, but she sure doesn’t know much about computers). 
#She has placed the data in a file on the web for you to download.

#Write an R script that:
#Imports the data
#For each row in the dataset checks to see if the ear length is "large" (>10 cm) or "small" (<=10 cm) and determines the GC-content of the DNA sequence (i.e., the percentage of bases that are either G or C)
#Stores this information in a table where the first column has the ID for the individual, the second column contains the string "large" or the string "small" depending on the size of the individuals ears, and the third column contains the GC content of the DNA sequence.
#Exports this table to a csv (comma separated values) file titled grangers_analysis.csv.
#Prints the average GC-contents for large-eared elves and small-eared elves to the screen.
#As you start to work on more complex problems it’s important to break them down into manageable pieces. One natural way to break this list of things down is: 1) import data; 2) determine size category; 3) determine GC-content; 4) calculate the size category and GC-content for each row of data and store it; 5) export this data to csv; 6) calculate and print the average GC-content for large and small ears.

#There are several different specific approaches you could take to doing calculations for each row of data. One is to use dplyr using the rowwise() function (here’s an example). Another is to loop over the rows in the data.frame using

for (row in 1:nrow(data)){...}

#A third is to break the data.frame into vectors and use sapply().

download.file("http://www.datacarpentry.org/semester-biology/data/houseelf-earlength-dna-data.csv",
              "houseelf-earlength-dna-data.csv")
#import the data
houseelf <- read.csv("houseelf-earlength-dna-data.csv")

library(dplyr)

#For each row in the dataset checks to see if the ear length is "large" (>10 cm) or "small" (<=10 cm) 
#and determines the GC-content of the DNA sequence (i.e., the percentage of bases that are either G or C)

#function to categorise ear length of house elves
ear_length= function(earlength){
  ifelse(earlength > 10,"Large","Small") #argument with yes (large) or no (small) outcome
}


#function that calculates GC_content in a dna sequence
get_gc_content <- function(dnaseq){
  Gs <- str_count(dnaseq, "G")
  Cs <- str_count(dnaseq, "C")
  gc_content <- (Gs + Cs) / str_length(dnaseq) * 100
  return(gc_content)
}

#function that determines the earth length category
get_ear_length <- function(seq){
    ear_lengths <- ifelse(seq > 10, "large", "small")
    return(ear_lengths)
}

#Read ID column from csv file
ID <- data.frame(houseelf$id, stringsAsFactors = FALSE)
dnaseq <- data.frame(houseelf$dnaseq, stringsAsFactors = FALSE)
earlength <- data.frame(houseelf$earlength, stringsAsFactors = FALSE)


#calculate gc_content for all of the dna sequences
gc_contents <- data.frame(gc_content = numeric(nrow(dnaseq)))
for (i in 1:nrow(dnaseq)){
  gc_contents[i,] <- get_gc_content(dnaseq[i,])
}
gc_contents

# Read earlength column from csv file
ear <- data.frame(earlengthcat = numeric(nrow(earlength)))
for (i in 1:nrow(earlength)){
  ear[i,] <- ear_length(earlength[i,])
}
ear

grangers_analysis.csv <- data.frame(species= ID, ear, gc_contents, stringsAsFactors = FALSE)
write.csv(grangers_analysis.csv)
