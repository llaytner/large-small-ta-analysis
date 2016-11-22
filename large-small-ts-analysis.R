# GIT #
#steps to set up: 1) tell GIT who you are--> go to GIT tab in environ and click shell "git config -- global user.name "YOUR NAME""

#2--First Commit--
get_data <- function(){
  read.csv("surveys.csv")
}
#check box and check commit--diff space below the 3 new green lines getting added to this file
#box with commit message, here you write what you did and why you did it and click commit
#look at history, and you can see each thing you have done
#to revert back click on tool icon and click revert

get_size_class <- function(weight) {
  if(weight>50){ 
    size_class = "large"
  }else {size_class = "small"
  }
    return(size_class)
}

#3--import data--
main_data <- read.csv("houseelf-earlength-dna-data.csv")

#4 -- commit multiple files--
write.csv(main_data, "houseelf_earlength_dna_data_1.csv", row.names = FALSE)
main_data1 <- read.csv("houseelf_earlength_dna_data_1.csv")
#file.rename(main_data, houseelf_earlength_dna_data_1.csv)

#5--adding a remote--

#6 --pushing changes --
#from assignment 7Now that you’ve set up your remote repository for collaborating with Dr. Granger you’d better get to work since she can see everything you’re doing.
#Write a function to calculate the GC-content of a sequence, regardless of the capitalization of that sequence. 
#(Hint: using the function str_to_lower or str_to_upper in the stringr package might be useful). 
#This function should also be able to take a vector of sequences and return a vector of GC-contents (it probably does this without any extra work so give it a try).

#Function to calculate the GC content
library(stringr)

get_GC_content=function(sequence){
  sequence=str_to_lower(sequence)
  Gs <- str_count(sequence, "g")
  Cs <- str_count(sequence, "c")
  gc_content <- (Gs + Cs) / str_length(sequence) * 100
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
earlength <- data.frame(houseelf$seq, stringsAsFactors = FALSE)


#calculate gc_content for all of the dna sequences
gc_contents <- data.frame(gc_content = numeric(nrow(dnaseq)))
for (i in 1:nrow(dnaseq)){
  gc_contents[i,] <- get_gc_content(dnaseq[i,])
}
gc_contents

#determine ear length category
ear_length_cats <- data.frame(ear_lengths = numeric(nrow(seq())))
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

houseelf_analysis <- data.frame(species= ID, ear, gc_contents, stringsAsFactors = FALSE)
write.csv(houseelf_analysis.csv)
