# GIT #
#steps to set up: 1) tell GIT who you are--> go to GIT tab in environ and click shell "git config -- global user.name "YOUR NAME""

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
#3
read.csv("houseelf-earlength-dna-data.csv")
