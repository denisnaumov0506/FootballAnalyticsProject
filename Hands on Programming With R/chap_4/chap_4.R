deck2[c(13, 26, 39, 52),]
deck2[c(13, 26, 39, 52), 3]
deck2$value[c(13, 26, 39, 52)]
deck2$value[c(13, 26, 39, 52)] = c(14, 14, 14, 14)
# or using R's recycling
deck2$value[c(13, 26, 39, 52)] = 14
print(head(deck2, 13))
deck3 = shuffle(deck)
head(deck3)

print(vec)
print(vec[c(F, F, F, F, T, F, F)])

# Logical Tests
print(1 > 2)
print(1 > c(0, 1, 2))
print(c(1, 2, 3) == c(3, 2, 1))

# %in% is the only operator that does not do normal element-wise execution.
# %in% tests whether the value(s) on the left side are in the vector on the
# right side

print(1 %in% c(3, 4, 5))
print(c(1, 2) %in% c(3, 4, 5))
print(c(1, 2, 3) %in% c(3, 4, 5))
print(c(1, 2, 3, 4) %in% c(3, 4, 5))

# Extract the face column of deck2 and test whether each value is equal to ace

print(deck2$face)
print(deck2$face == "ace")

# Count the number of TRUEs in the previous vector
sum(deck2$face == "ace")

# find all aces inside shuffled deck
print(deck3$face == "ace")
deck3$value[deck3$face == "ace"] = 14

print(head(deck3, n=20))

# In hearts, every card has a value of zero
deck4 = deck
deck4$value = 0

print(head(deck4, 13))

# Assign a value of 1 to every card in deck4 that has a suit of hearts
print(deck4$suit == "hearts")
deck4$value[deck4$suit == "hearts"] = 1
deck4$value[deck4$suit == "hearts"]

# Find all queens
print(deck4[deck4$face == 'queen',])

# Find all spades
print(deck4[deck4$suit == "spades",])

# boolean operators
a = c(1, 2, 3)
b = c(1, 2, 3)
c = c(1, 2, 4)

a == b

b == c

a == b & b == c

# Locate the queen of spades in the deck of cards
print(deck4$face == "queen" & deck4$suit == "spades")

# Save the results of this test to its own object
queenOfSpades = deck4$face == "queen" & deck4$suit == "spades"

# Check whether it selects the correct value
print(deck4[queenOfSpades, ])
print(deck4$value[queenOfSpades])

# Update the value of the queen of spades!
deck4$value[queenOfSpades] = 13

deck4[queenOfSpades, ]

# Exercise on page 87
w = c(-1, 0, 1)
isWPositive = w > 0
print(isWPositive)

x = c(5, 15)
isXGreaterThan10AndLessThan20 = x > 10 & x < 20
print(isXGreaterThan10AndLessThan20)

y = "February"
isFebruary = y == "February"
print(isFebruary)

z = c("Monday", "Tuesday", "Friday", "Hello there")
week = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
isWeekday = all(z %in% week)
print(isWeekday)

# blackjack
deck5 = deck

head(deck5, 13)

facecard = deck5$face %in% c("king", "queen", "jack")

deck5[facecard, ]

deck5$value[facecard] = 10
head(deck5, 13)

1 + NA

# Missing values
print(c(NA, 1:50))

mean(c(NA, 1:50))

mean(c(NA, 1:50), na.rm = TRUE)

# tests like this won't help you find missing values
#print(c(1, 2, 3, NA) == NA)

print(is.na(NA))

vec = c(1, 2, 3, NA)
is.na(vec)

# Set all aces to NA

deck5$value[deck5$face == "ace"] = NA

head(deck5, 13)

install.packages("pryr")
library(pryr)
parenvs(all = TRUE)

print(as.environment("package:stats"))
print(glo)

