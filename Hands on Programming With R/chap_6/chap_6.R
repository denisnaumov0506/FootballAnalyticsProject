remove.packages('pryr')
install.packages('pryr')

library(pryr)

print(as.environment("package:stats"))

print(globalenv())
print(baseenv())
print(emptyenv())

# Look up an environment's parent with parent.env
print(parent.env(globalenv()))

# empty environment is the only R environment without a parent
parent.env(emptyenv())

ls(emptyenv())
ls(globalenv())

# You can use R's $ syntax to access an object in a specific environment. For
# example, you can access deck from the global environment
head(globalenv()$deck, 3)

# Assign function to save an object into a particular environment
assign("new", "Hello Global", envir = globalenv())

globalenv()$new

environment()
new
new = 'Hello Active'
new

show_env <- function(){
  list(ran.in = environment(),
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}

show_env()

environment(show_env)
environment(pryr)

show_env <- function(x){
  a = 1
  b = 2
  c = 3
  list(ran.in = environment(),
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}

foo = 'take me to your runtime'

show_env(foo)

deal <- function() {
  card <- deck[1, ]
  assign('deck', deck[-1, ], envir = globalenv())
  card
}

deal()

environment(deal)

#DECK <- deck
deck <- deck[-1,]
head(deck, 3)

shuffle <- function(cards) {
  random <- sample(1:52, size=52)
  cards[random, ]
}

head(deck, 3)
a <- shuffle(deck)

head(deck, 3)
head(a, 3)


shuffle <- function() {
  random <- sample(1:52, size = 52)
  assign('deck', DECK[random, ], envir=globalenv())
}

shuffle()
deal()
deal()


# You could create a function that takes deck as an agrument and saves a copy of
# deck as DECK. The function could also save its own copies of deal and shuffle:

setup <- function(deck) {
  DECK <- deck
  
  DEAL <- function() {
    card <- deck[1, ]
    assign('deck', deck[-1,], envir = parent.env(environment()))
    card
  }
  
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign('deck', DECK[random, ], envir = parent.env(environment()))
  }
  list(deal = DEAL, shuffle = SHUFFLE)
}

DECK = deck
DECK

cards = setup(DECK)

deal <- cards$deal
shuffle <- cards$shuffle

deal
shuffle

environment(deal)
environment(shuffle)

shuffle()
deal()
rm(deck)
