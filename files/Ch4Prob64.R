###################
### Question 64 ###
###################

repeat.sample <- function(N, n) # N = population size, n = sample size
{
  reps = 1000
  out = numeric(reps)
  for (i in 1:reps)
  {
    samp = sample(1:N, n, repl = T)
    out[i] = length(unique(samp)) != n
  }
  sim = mean(out)
  actual = 1 - prod(((N-n+1):N)/N)
  est = 1 - exp(-sum(0:(n-1))/N)
  
  print(paste0(sim, " is the simulated probability of more than one repeat."))
  print(paste0(actual, " is the theoretical probability of more than one repeat."))
  print(paste0(est, " is the estimated probability of more than one repeat."))
  print(paste0("***EXTRA INFO***"))
  print(paste0(N, " = population size, ", n, " = sample size."))
  print(paste0("Simulated probability used ", reps, " simulations."))
  print(paste0("Actual value was obtained by 1 - prod(((",N,"-",n,"+1):",N,")/",N,")"))
  print(paste0("Estimate was obtained by 1 - exp(-sum(0:(",n,"-1))/",N,")"))
}

repeat.sample(1000000, 1000)
