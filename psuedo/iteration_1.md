# Iteration 1
##  Ship
##  Cell
### render
  + use a if statement to determine if cell is one of four conditions
    + 'M' indicating miss because there is not ship in cell and it has returned true for fired_upon
    + '.' indicating if fired_upon returns false
    + 'H' indicating if ship.empty? returns false and if fired_upon returns true
    + 'X' indicating if ship.empty? returns false and if fired_upon returns true and if ship.sunk? returns true
