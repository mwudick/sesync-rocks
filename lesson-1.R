## Scripting in the editor

vals <- c(5, 6, 12)

data <- data.frame(counts = vals)

## Anatomy of a function

first <- function(df) {         # The arguments, or input, to the function goes here.  
   result <- df[[1, 1]]                  # The body of the function goes here.
   return(result)          # Any output of the function goes here.
}

## Change the url for the origin repo

system('git remote set-url origin https://github.com/mwudick/sesync-rocks.git')


## Install missing packages

requirements <- c('tidyr',
                  'ggplot2',
                  'RSQLite',
                  'rmarkdown')
missing <- setdiff(requirements,
                   rownames(installed.packages()))

if (length(missing)!=0) {
  install.packages(missing)
}
