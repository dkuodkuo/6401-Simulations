# 6401 Simulations

These files were made to double check my probability homework with simulations in R. The textbook being used for these questions is Introduction to Probability by Jessica Hwang and Joseph K. Blitzstein, Har/Psc edition.

## Chapter 3

### Question 18

[File](files/Ch3Prob18.R)

Both ```baseball.a()``` and ```baseball.b``` simulates the probability of a team winning a series. However, their conditions are slightly different in the sense that:

- ```baseball.a``` stops playing after one team nets the required wins.
- ```baseball.b``` plays out an entire set of games, and whoever has more wins is the victor.

Theoretically, "first to 4 wins" is equivalent to "best of 7 games", and this was written just to simulate both cases to demonstrate equivalent probability.

```
test
```
