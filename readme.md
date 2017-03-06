# Snakes and Ladders Kata

## User stores part 1

### Token Can Move Across the Board

As a player
I want to be able to move my token
So that I can get closer to the goal

* Given the game is started
When the token is placed on the board
Then the token is on square 1

* Given the token is on square 1
When the token is moved 3 spaces
Then the token is on square 4

* Given the token is on square 1
When the token is moved 3 spaces
And then it is moved 4 spaces
Then the token is on square 8

### Moves Are Determined By Dice Rolls
As a player
I want to move my token based on the roll of a die
So that there is an element of chance in the game

* Given the game is started
When the player rolls a die
Then the result should be between 1-6 inclusive

* Given the player rolls a 4
When they move their token
Then the token should move 4 spaces

### Player Can Win the Game
As a player
I want to be able to win the game
So that I can gloat to everyone around

* Given the token is on square 97
When the token is moved 3 spaces
Then the token is on square 100
And the player has won the game

* Given the token is on square 97
When the token is moved 4 spaces
Then the token is on square 97
And the player has not won the game
