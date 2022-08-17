# Create a die by creating a vector containing numbers between 1 to 6
die <- 1 : 6
# print(die)
# ls()
# print(die - 1)
# print(die / 2)
# print(die * die)
# print(die + 1:2)
# #print(die + 1:4)

# # Inner multiplication
# print(' ')
# print(die %*% die)
# 
# # Outer multiplication
# print(' ')
# print(die %o% die)
# 
# # Round a number
# round(3.1415, 2)
# 
# # Factorial of a number
# factorial(3)
# 
# # mean of a sequence of numbers
# mean(1:6)
# mean(die)
# round(mean(die))
# 
# # sample function
# sample(x = 1:4)
# 
# print(args(round))
# 
# # sample function with replacement
# sample(x = 1:6, size = 2, replace = TRUE)

dice = sample(die, size = 2, replace = TRUE)
print(dice)
print(sum(dice))

roll = function() {
  die = 1:6
  dice = sample(die, size = 2, replace = TRUE)
  sum(dice)
}

print(roll())

roll2 = function(bones = 1:6, size = 2, replace = TRUE) {
  probs = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8)
  dice = sample(bones, size = size, replace = replace, prob = probs)
  sum(dice)
}

print(roll2())

