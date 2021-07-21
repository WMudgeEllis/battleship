class Game

~~puts greeting [NOT WRITTEN]
  DO YOU WANT TO PLAY A GAME?
  y->play
  n->getlost~~



SETUP
~~run method that generates both boards [WRITTEN]~~
~~create both set of ship objects (the computer and the player's)~~
~~run a method that places computer ships [NOT WRITTEN] [TURN]
  -we need an array of all possible positions for the ship then shuffle the first
  -possible column method and valid placement? to get the extras out
  -then [hardcode?] add in the missing possibilites (rows)~~

~~display user board [WRITTEN]  [GAMEFILE BRAIN]
ask user to place ship [WRITTEN-ish] [GAMEFILE BRAIN]
take user input and run method to place ship(s) [WRITTEN-ish] [GAMEFILE BRAIN]
Need to not allow invalid placement and give feedback [NOTWRITTEN-ish] [GAMEFILE BRAIN]
update user's board with ships[WRITTEN]~~


MIDDLE LOOP

~~display both boards [WRITTEN]-while loop that runs while neither set of ships are completely sunk [GAMEFILE BRAIN]~~
~~ask for user input
recieve user input [FIRE UPON DEF]
  -valid coord?
  -fired_upon? (before)~~

tell user feedback [FEEDBACK METHOD]
fire computer's shot [FIRE UPON DEF] [RANDOM SHOT?]
  -getcellsnotempty array then a.shuffle.first
  -in turn, build off of shot



END SETUP

TURN
board


ask for user shot [FRONT END] in game

return feedback [NOTWRITTEN] [IN TURN]
      -HIT
      -MISS
      -SUNK

fire computer shot [NOT WRITTEN]
  -getcellsnotempty array then a.shuffle.first
  -in turn, build off of shot


return computer feedback

check to see if a set of ships are all sunk
update render


METHODS TO WRITE

BOARD HIT METHOD(board, coordstr)
  -HIT A CELL [WRRITTEN]
  -return HIT, MISS, or SUNK

fire computer shot [NOT WRITTEN]
  -getcellsnotempty array then a.shuffle.first
  -in turn, build off of shot


return feedback [NOTWRITTEN] [IN TURN] (board, coord)
      -HIT
      -MISS
      -SUNK

GAME END CHECK[GAMEFILE BRAIN?]
  -return to beginning after the game is over


end



READ EVERYTHING FIRST

Main Menu:

~~User is shown the main menu where they can play or quit~~
Setup:

~~Computer can place ships randomly in valid locations~~
~~User can enter valid sequences to place both ships~~
~~Entering invalid ship placements prompts user to enter valid placements~~


~~User board is displayed showing hits, misses, sunken ships, and ships~~
~~Computer board is displayed showing hits, misses, and sunken ships~~
~~Computer chooses a random shot~~
~~Computer does not fire on the same spot twice~~
~~User can choose a valid coordinate to fire on~~
~~Entering invalid coordinate prompts user to enter valid coordinate~~
~~Both computer and player shots are reported as a hit, sink, or miss~~
~~User is informed when they have already fired on a coordinate~~
~~Board is updated after a turn~~
End Game:

~~Game ends when all the user’s ships are sunk
Game ends when all the computer’s ships are sunk
Game reports who won~~
Game returns user back to the Main Menu
