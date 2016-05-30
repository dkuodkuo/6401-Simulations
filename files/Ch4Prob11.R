###################
### Question 11 ###
###################

petersburg <- function(p, bank) # p = probability of flip success, bank = initial money
{
  total = 5000000 # Total random samples limiter (avoid overly long simulation)
  maxflips = floor(log(bank + 1, base = 2)) # Most amount of coin flips possible
  exflips = sum(0.5^(1:maxflips) * (1:maxflips)) # Expected number of coin flips
  reps = signif(total/exflips, digits = 1) # Amount of times to simulate games
  winnings = numeric(reps) # Initialize winnings storage
  
  for(i in 1:reps) # Perform multiple game simulations
  {
    bet = 0 # Bet counter
    while(bet < maxflips) # While betting is still possible (based on bank)
    {
      bet = bet + 1 # Increase bet count
      flip = sample(c(1,0), 1, prob = c(p, 1-p), repl = T) # Simulate one flip
      if(flip == 1)
      {
        winnings[i] = 1  # Gain $1
        break # Exit the while loop, since game is now over
      }
      if(bet == maxflips) {winnings[i] = -2^maxflips + 1} # Lose all money invested
    }
  }
  print(paste0(mean(winnings), " is the simulated mean of winnings."))
}

# Simulate this example
petersburg(0.5, 31)
