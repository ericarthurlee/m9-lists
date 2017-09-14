# Exercise 2: `*apply()`

# Create a *list* of 10 random numbers. Use the `runif` function to make a vector of random numbers,
# then use `as.list()` to convert that to a list.
integer <- sample(1:100, 10)
rational <- runif(10, min = 1, max = 100)
ls.rational <- as.list(rational)

# Use `lapply()` to apply the `round()` function to each number, rounding it to the nearest .1
ls.ro.rational <- lapply(ls.rational, round)


## Bonus

# Create a variable 'sentence' that has contains a sentence of text (go for something longish).
# Make it lowercase
sentence <- 'while i do not agree with what you say i defend to the death your right to say it'

# Use the `strsplit()` function to split the sentence into vector of letters.
# Hint: split on `""` to split on everything
# Note: this will return a _list_ with 1 element (which is the vector of letters)
strsplit(sentence, '')

# Extract the vector of letters from the resulting list
sentence.repeat <- strsplit(sentence, '')[[1]]

# Use the `unique()` function to get a vector unique letters
sentence.unique <- unique(letters)

# Define a function CountOccurances that takes in two parameters: a letter and a vector letters.
# The function should return how many times that letter occurs in the vector
# Hint: use a filter!
CountOccurrences <- function(a, b) {
  if(all(a != letters)) {
    err1 <- 'Error: the first argument must be a lower-case letter of the alphabet.'
    return(err1)
  } else if(!is.vector(b)) {
    err2 <- 'Error: the second argument must be a vector.'
    return(err2)
  } else if(all(a != letters) & !is.vector(b)) {
    err3 <- 'Errors: the first argument must be a lower-case letter of the alphabet and the second argument must be a vector.'
    return(err3)
  } else if((any(a == letters)) & (is.vector(b))) {
    x1 <- length(b[grep(a, b)])
    f1 <- paste('The letter', a, 'appears', x1, 'time/s.')
    return(f1)
  }
}

# Call your CountOccurances() function to see how many times the letter 'e' is in your sentence.
CountOccurrences('e', sentence.repeat)

# Use `sapply()` to apply your CountOccurances() function to each unique letter in the vector to determine its frequency!
# Convert the result into a list (using `as.list`).
occurrences <- sapply(letters, CountOccurrences, sentence.repeat)
ls.occurrences <- as.list(occurrences)

# Print the resulting list of frequencies
print(ls.occurrences)
