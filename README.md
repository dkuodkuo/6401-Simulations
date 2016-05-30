# STAT 6401 Simulations

These files were made to double-check my probability homework answers, via simulations in R. The textbook being used for these questions is **Introduction to Probability by Jessica Hwang and Joseph K. Blitzstein, Har/Psc edition**.

Note: the outputs presented are only one instance of a random simulation, and thus will differ between each test run. Also, I am avoiding uploading my actual answers with explanations so that this repo doesn't simply become the go-to for someone using Google for answers to their homework.

## Chapter 3

### Question 18

[File](files/Ch3Prob18.R)

The question asks for the probability of a team being the first to win a set number of games, given that their probability of winning individual games is p. Both ```baseball.a()``` and ```baseball.b()``` simulate the probability of a team winning a series of games. However, their conditions are slightly different in the sense that:

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

The question is an application of the [St. Petersburg paradox](https://en.wikipedia.org/wiki/St._Petersburg_paradox). ```petersburg()``` simulates the process of betting under the rules of the St. Petersburg paradox, but with the assumption of a limited bank.

Example output of ```petersburg(0.5, 31)```:

```
## [1] "0.000800000000000027 is the simulated mean of winnings."
```

Note: to make the simulation run faster, decrease the ```total``` in the function.

### Question 39

[File](files/Ch4Prob39.R)

The question assumes a building with an elevator. There are n floors and k people, and we want to find the expected number of stops the elevator makes on each floor (not counting the 1st floor). Both ```elevavtor.a()``` and ```elevator.b()``` simulate the process of k people going to floors 2 through n. However, their conditions are slightly different in the sense that ```elevator.a()``` assumes equal probability between floors, while ```elevator.b()``` assumes different probabilities to each floor.

Example output of ```elevator.a(10, 30)```:

```
## [1] "8.73955 is the simulated mean of number of stops."
## [1] "8.73717490139725 is the theoretical mean of number of stops."
## [1] "***EXTRA INFO***"
## [1] "10 = number of floors, 30 = number of people."
## [1] "Estimate was obtained by performing 1e+05 simulations."
## [1] "Actual value was obtained by (10-1)*(1-((10-2/(10-1))^30)"
```

Example output of ```elevator.b(10, 30, c(0.1, 0.05, 0, 0.05, 0.1, 0.2, 0.3, 0.1, 0.1))```:

```
## [1] "7.40388 is the simulated mean of number of stops."
## [1] "7.39989735963368 is the theoretical mean of number of stops."
## [1] "***EXTRA INFO***"
## [1] "10 = number of floors, 30 = number of people."
## [1] "The probability distribution was as follows:"
## [1] 0.10 0.05 0.00 0.05 0.10 0.20 0.30 0.10 0.10
## [1] "Estimate was obtained by performing 1e+05 simulations."
## [1] "Actual value was obtained by sum(1 - (1 - p)^k)"
```

### Question 48

[File](files/Ch4Prob48.R)

The question assumes a coin with probability p of landing on heads. Flipping the coin gives you a series of heads and tails, and the question asks the expected number of "runs," where a run is defined as a chain of heads or tails. For instance, HTTTHHT has 4 runs: H|TTT|HH|T.

Example output of ```flip.runs(30, 0.2)```:

```
## [1] "10.26352 is the simulated mean of number of runs."
## [1] "10.28 is the theoretical mean of number of runs."
## [1] "***EXTRA INFO***"
## [1] "30 = number of flips, 0.2 = P(Heads)."
## [1] "Estimate was obtained by performing 1e+05 simulations."
## [1] "Actual value was obtained by (30-1)*2*0.2*(1-0.2)+1."
```

### Question 64

[File](files/Ch4Prob64.R)

The question asks for an *approximation* of the probability of choosing someone more than once when sampling 1000 people out of 1000000 for surveying (aka, with replacement). Instead of finding an *exact* probability, the question requires the reader to estimate via indicator random variables. ```repeat.sample()``` simulates the process for a sample probability, as well as comparing the exact probability with the estimated probability.

Example output of ```repeat.sample(1000000, 1000)```:

```
## [1] "0.39 is the simulated probability of more than one repeat."
## [1] "0.393267028558521 is the theoretical probability of more than one repeat."
## [1] "0.39316599912854 is the estimated probability of more than one repeat."
## [1] "***EXTRA INFO***"
## [1] "1e+06 = population size, 1000 = sample size."
## [1] "Simulated probability used 1000 simulations."
## [1] "Actual value was obtained by 1 - prod(((1e+06-1000+1):1e+06)/1e+06)"
## [1] "Estimate was obtained by 1 - exp(-sum(0:(1000-1))/1e+06)"
```
