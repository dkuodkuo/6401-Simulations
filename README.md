# 6401 Simulations

These files were made to double check my probability homework with simulations in R. The textbook being used for these questions is Introduction to Probability by Jessica Hwang and Joseph K. Blitzstein, Har/Psc edition.

## Chapter 3

### Question 18

[File](files/Ch3Prob18.R)

Both ```baseball.a()``` and ```baseball.b()``` simulates the probability of a team winning a series of games. However, their conditions are slightly different in the sense that:

- ```baseball.a()``` stops playing after one team nets the required number of wins (in this case, 4).
- ```baseball.b()``` plays out an entire set of games (in this case, 7), and whoever has more wins is the overall winner.

Theoretically, "first to 4 wins" is equivalent to "best of 7 games", and this was used just to simulate both cases to demonstrate equivalent probability. More importantly, ```baseball.a()``` was used to confirm the theoretical probability.

Output of ```baseball.a(0.7, 4)```:

```
## [1] "0.87656 is the simulated probability that team A wins the series."
## [1] "0.873964 is the theoretical probability that team A wins the series."
## [1] "***EXTRA INFO***"
## [1] "0.7 = probability team A wins, 4 wins total needed for series."
## [1] "Estimate was obtained by performing 1e+05 simulations of games,"
## [1] "Of which team A won 87656 times. (87656/1e+05)"
## [1] "Actual value was obtained by sum(dnbinom(0:(4-1),4,0.7))"
```

Output of ```baseball.b(0.7, 4)```:

```
## [1] "0.87305 is the simulated probability that team A wins the series."
## [1] "0.873964 is the theoretical probability that team A wins the series."
## [1] "***EXTRA INFO***"
## [1] "0.7 = probability team A wins, 4 wins total needed for series."
## [1] "Estimate was obtained by performing 1e+05 simulations of games,"
## [1] "Of which team A won 87305 times. (87305/1e+05)"
## [1] "Actual value was obtained by sum(dnbinom(0:(4-1),4,0.7))"
```
