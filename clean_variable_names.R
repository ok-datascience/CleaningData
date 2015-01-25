# Performs cleaninig valriables names, this code extracted from main file just 
# for simplicity of main code
cleanVariableNames <- function(variableNames) {
  # naive way to clean up variables
  variableNames <- gsub("-mean\\(\\)", "Mean", variableNames)
  variableNames <- gsub("-std\\(\\)", "StdDev", variableNames)
  variableNames <- gsub("^t", "time", variableNames)
  variableNames <- gsub("^f", "freq", variableNames)
  variableNames <- gsub("\\-X", "X", variableNames)
  variableNames <- gsub("\\-Y", "Y", variableNames)
  variableNames <- gsub("\\-Z", "Z", variableNames)
  variableNames <- gsub("\\(\\)", "", variableNames)
  variableNames <- gsub("-", "", variableNames)
  
  return(variableNames)
}