# 6401 Simulations

These files were made to double check my probability homework with simulations in R. The textbook being used for these questions is **Introduction to Probability**, by Jessica Hwang and Joseph K. Blitzstein, Har/Psc edition.

Note: the outputs presented are only one instance of a random simulation, and thus will differ between each test run.

## Chapter 3

### Question 18

[File](files/Ch3Prob18.R)

The question asks for the probability of a team being the first to win a set number of games, given that their probability of winning individual games is p.

Both ```baseball.a()``` and ```baseball.b()``` simulate the probability of a team winning a series of games. However, their conditions are slightly different in the sense that:

- ```baseball.a()``` stops playing after one team reaches the required number of wins (in this case, 4).
- ```baseball.b()``` plays out an entire set of games (in this case, 7), and whoever has more wins is the overall winner.

```baseball.a()``` was used to confirm the probability of the scenario in the first place, while ```baseball.b()``` was used to demonstrate that "first to 4 wins" is equivalent to "best of 7 games".

Example output of ```baseball.a(0.7, 4)```:

```
## [1] "0.87656 is the simulated probability that team A wins the series."
## [1] "0.873964 is the theoretical probability that team A wins the series."
## [1] "***EXTRA INFO***"
## [1] "0.7 = probability team A wins, 4 wins total needed for series."
## [1] "Estimate was obtained by performing 1e+05 simulations of games,"
## [1] "Of which team A won 87656 times. (87656/1e+05)"
## [1] "Actual value was obtained by sum(dnbinom(0:(4-1),4,0.7))"
```

Example output of ```baseball.b(0.7, 4)```:

```
## [1] "0.87305 is the simulated probability that team A wins the series."
## [1] "0.873964 is the theoretical probability that team A wins the series."
## [1] "***EXTRA INFO***"
## [1] "0.7 = probability team A wins, 4 wins total needed for series."
## [1] "Estimate was obtained by performing 1e+05 simulations of games,"
## [1] "Of which team A won 87305 times. (87305/1e+05)"
## [1] "Actual value was obtained by sum(dnbinom(0:(4-1),4,0.7))"
```

## Chapter 4

### Question 6

[File](files/Ch4Prob06.R)

The question assumes the same scenario as the previous one, but assumes p = 0.5 for both teams. It then asks for the expected mean and variance of games played between the two teams, assuming that the games played stops once a team reaches 4 wins. ```baseball.c()``` simulates this scenario and calculates sample mean and variance as estimates.

Example output of ```baseball.c(0.5, 4)```:

```
## [1] "5.81244142857143 is the simulated mean of number of games played."
## [1] "1.02699749656939 is the simulated variance of number of games played."
## [1] "***EXTRA INFO***"
## [1] "0.5 = probability team A wins, 4 wins total needed for series."
## [1] "Estimate was obtained by performing 7e+05 simulations of games."
```

### Question 11

[File](files/Ch4Prob11.R)

This question is an application of the [St. Petersburg paradox](https://en.wikipedia.org/wiki/St._Petersburg_paradox). ```petersburg()``` simulates the process of betting under the rules of the St. Petersburg paradox, but with the assumption of a limited bank.

Example output of ```petersburg(0.5, 31)```:

```
## [1] "0.000800000000000027 is the simulated mean of winnings."
```

Note: to make the simulation run faster, decrease the ```total``` in the function.

### Question 39

[File](files/Ch4Prob39.R)

TTH
