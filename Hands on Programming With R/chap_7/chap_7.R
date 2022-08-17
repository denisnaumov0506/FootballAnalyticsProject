get_symbols = function(){
  wheel = c('DD', '7', 'BBB', 'BB', 'B', 'C', '0')
  sample(wheel, size = 3, replace = TRUE,
         prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}

get_symbols()

num = -8

if (num < 0) {
  num = num * -1
}

num

a = 3.14
dec = a - trunc(a)
dec

if (dec >= 0.5) {
  a = trunc(a) + 1
} else {
  a = trunc(a)
}

a

a <- 1
b <- 1

if (a > b) {
  print('A wins!')
} else if (a < b) {
  print('B wins!')
} else {
  print("Tie!")
}

