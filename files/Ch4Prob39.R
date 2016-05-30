###################
### Question 39 ###
###################

# elevator.a is for part a, elevator.b is for part b

elevator.a <- function(n, k) # n = number of floors, k = number of people
{
  reps = 100000
  floor.count = numeric(reps)
  for (i in 1:reps)
  {
    floor.count[i] = length(unique(sample(2:n, k, repl = T)))
  }
  est = (mean(floor.count))
  actual = (n - 1) * (1 - ((n-2)/(n-1))^k)
  print(paste0(est, " is the simulated mean of number of stops."))
  print(paste0(actual, " is the theoretical mean of number of stops."))
  print(paste0("***EXTRA INFO***"))
  print(paste0(n, " = number of floors, ", k, " = number of people."))
  print(paste0("Estimate was obtained by performing ", reps, " simulations."))
  print(paste0("Actual value was obtained by (",n,"-1)*(1-((",n,"-2/(",n,"-1))^",k,")"))
}

elevator.b <- function(n, k, p) # n = number of floors, k = number of people,
{                             # p = probability vector
  reps = 100000
  floor.count = numeric(reps)
  for (i in 1:reps)
  {
    floor.count[i] = length(unique(sample(2:n, k, p, repl = T)))
  }
  est = (mean(floor.count))
  actual = sum(1 - (1 - p)^k)
  print(paste0(est, " is the simulated mean of number of stops."))
  print(paste0(actual, " is the theoretical mean of number of stops."))
  print(paste0("***EXTRA INFO***"))
  print(paste0(n, " = number of floors, ", k, " = number of people."))
  print(paste0("The probability distribution was as follows:"))
  print(p)
  print(paste0("Estimate was obtained by performing ", reps, " simulations."))
  print(paste0("Actual value was obtained by sum(1 - (1 - p)^k)"))
}

elevator.a(10, 30)
elevator.b(10, 30, c(0.1, 0.05, 0, 0.05, 0.1, 0.2, 0.3, 0.1, 0.1))
