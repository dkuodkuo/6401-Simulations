###################
### Question 48 ###
###################

flip.runs <- function(n, p) # n = number of flips, p = P(Heads)
{
  reps = 100000
  runs.count = numeric(reps)
  for (i in 1:reps)
  {
    flips = sample(0:1, n, c(p, 1-p), repl = T)
    runs.count[i] = length(rle(flips)$length)
  }
  est = mean(runs.count)
  actual = (n - 1) * 2 * p * (1 - p) + 1
  print(paste0(est, " is the simulated mean of number of runs."))
  print(paste0(actual, " is the theoretical mean of number of runs."))
  print(paste0("***EXTRA INFO***"))
  print(paste0(n, " = number of flips, ", p, " = P(Heads)."))
  print(paste0("Estimate was obtained by performing ", reps, " simulations."))
  print(paste0("Actual value was obtained by (",n,"-1)*2*",p,"*(1-",p,")+1."))
}

flip.runs(30, 0.2)
