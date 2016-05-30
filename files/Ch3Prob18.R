###################
### Question 18 ###
###################

# baseball.a is for part a, baseball.b is for part b

baseball.a <- function(p, w) # p = probability of team A winning, w = wins needed
{
  total = 1000000 # Total random samples limiter (avoid overly long simulation)
  reps = signif(total / (w * 2 -1), digits = 1) # Amount of times to simulate games
  teamAwin = 0 # Store wins here
  
  for(i in 1:reps) # Perform multiple game simulations
  {
    teamA = teamB = 0 # Team scores at the beginning
    while(teamA < w & teamB < w) # While no one has won yet, run code
    {
      game = sample(c(1,0), 1, prob = c(p, 1-p), repl = T) # Simulate 1 game
      if (game == 1) # If team A wins,
        teamA = teamA + 1 # team A gains 1 point
      else # If team B wins,
        teamB = teamB + 1 # team B gains 1 point
    }
    # Loop is exited once one of the teams have won
    if (teamA == w) # If team A is the one that reaches w wins
      teamAwin = teamAwin + 1 # Add 1 to team A series wins
  }
  sim = teamAwin / reps # Proportion of series that team A wins
  actual = sum(dnbinom(0:(w-1), w, p)) # Simulated solution based on earlier
  
  print(paste0(sim, " is the simulated probability that team A wins the series."))
  print(paste0(actual, " is the theoretical probability that team A wins the series."))
  print(paste0("***EXTRA INFO***"))
  print(paste0(p, " = probability team A wins, ", w, " wins total needed for series."))
  print(paste0("Estimate was obtained by performing ", reps, " simulations of games,"))
  print(paste0("Of which team A won ", teamAwin, " times. (", teamAwin, "/", reps, ")"))
  print(paste0("Actual value was obtained by sum(dnbinom(0:(",w,"-1),",w,",",p,"))"))
}

baseball.b <- function(p, w) # p = probability of team A winning, w = wins needed
{
  total = 1000000 # Total random samples limiter (avoid overly long simulation)
  reps = signif(total / (w * 2 -1), digits = 1) # Amount of times to simulate games
  teamAwin = 0 # Store wins here
  
  system=matrix(sample(c(1,0),(w*2-1)*reps,prob=c(p,1-p),repl=T),ncol=reps) # 7 game sets
  teamAwin=sum(colSums(system) > 3) # Save number of 7 game sets where team A wins
  
  sim = teamAwin / reps # Proportion of series that team A wins
  actual = sum(dnbinom(0:(w-1), w, p)) # Simulated solution based on earlier
  
  print(paste0(sim, " is the simulated probability that team A wins the series."))
  print(paste0(actual, " is the theoretical probability that team A wins the series."))
  print(paste0("***EXTRA INFO***"))
  print(paste0(p, " = probability team A wins, ", w, " wins total needed for series."))
  print(paste0("Estimate was obtained by performing ", reps, " simulations of games,"))
  print(paste0("Of which team A won ", teamAwin, " times. (", teamAwin, "/", reps, ")"))
  print(paste0("Actual value was obtained by sum(dnbinom(0:(",w,"-1),",w,",",p,"))"))
}

# Simulate one example
baseball.a(0.7, 4)
baseball.b(0.7, 4)
