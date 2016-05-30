##################
### Question 6 ###
##################

baseball.c <- function(p, w) # p = probability of team A winning, w = wins needed
{
  total = 5000000 # Total random samples limiter (avoid overly long simulation)
  reps = signif(total / (w * 2 -1), digits = 1) # Amount of times to simulate games
  gamesvector = numeric(reps) # Store number of games played per series here
  
  for(i in 1:reps) # Perform multiple game simulations
  {
    games = teamA = teamB = 0 # Team scores at the beginning, also games played
    while(teamA < w & teamB < w) # While no one has won yet, run code
    {
      game = sample(c(1,0), 1, prob = c(p, 1-p), repl = T) # Simulate 1 game
      if (game == 1) # If team A wins,
      {
        teamA = teamA + 1 # team A gains 1 point
        games = games + 1 # game increases in count
      }
      else # If team B wins,
      {
        teamB = teamB + 1 # team B gains 1 point
        games = games + 1 # game increases in count
      }
    }
    # Loop is exited once one of the teams have won
    gamesvector[i] = games # Save number of games played in one season
  }
  ex = mean(gamesvector) # Expected value of games played
  exsq = mean(gamesvector ^2) # Expected value of games played squared
  var = exsq - ex^2 # Variance of games played
  
  print(paste0(ex, " is the simulated mean of number of games played."))
  print(paste0(var, " is the simulated variance of number of games played."))
  print(paste0("***EXTRA INFO***"))
  print(paste0(p, " = probability team A wins, ", w, " wins total needed for series."))
  print(paste0("Estimate was obtained by performing ", reps, " simulations of games."))
}

# Simulate desired result
baseball.c(0.5, 4)
