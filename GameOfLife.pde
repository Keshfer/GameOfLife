//CHECK TO SEE IF LIFELOGIC WORKS
import de.bezier.guido.*;
import java.util.ArrayList;
//private Button oof;
public final static int NUM_ROWS = 20;
public final static int NUM_COLS = 18;
public Button[][] buttArray = new Button[20][18];
public GoButton gg;
public ClearButton erase;
public int countRow = 0;
public int countCol = 0;
ArrayList <Integer> changeRow = new ArrayList<Integer>();
ArrayList <Integer> changeCol = new ArrayList<Integer>();

public void setup() {
  frameRate(8);
  size(400, 400);
  //rectMode(CENTER);
  //makes manager
  Interactive.make( this );

  //makes a grid of Button stored in array
  for (int i = 0; i < 400; i = i + 20) {
    for (int y = 0; y < 350; y = y + 20) {
      //System.out.println(countRow + "," + countCol);
      buttArray[countRow][countCol]= new Button(i, y, 20, 20);
      if (countCol >= 17) {
        countCol = 0;
      } else {
        countCol++;
      }
    }
    if (countRow >= 20) {
      countRow = 0;
    } else {
      countRow++;
    }
  }
  //Instance of GoButton
  gg = new GoButton(360, 365, 30, 30);
  erase = new ClearButton(320,365,30,30);
  
}

public void draw() {
  background(0, 0, 0);
}


public void isLiveDead(int NM_ROWS, int NM_COLS, int row, int col) {//checks if cell is live or not
  if (row >= 0 && row < NM_ROWS && col >= 0 && col < NM_COLS) {
    if (buttArray[row][col].on) {
      //System.out.println("live");
      LifeLogic(true, row, col);
    } else {
      //System.out.println("dead");
      LifeLogic(false, row, col);
    }
  } else {
    System.out.println("Doesn't exist");
  }
}

public Boolean isValid(int NM_ROWS, int NM_COLS, int row, int col) {//checks if cell exists in grid
  if (row >= 0 && row < NM_ROWS && col >= 0 && col < NM_COLS) {
    return true;
  } else {
    return false;
  }
}
public void LifeLogic(Boolean status, int row, int col) { //Determines what dies lives reproduce
  int countAlive = 0;
  int countDead = 0;

  if (status) {
    //Checks neighboring cells clockwise starting from 12 o clock
    if (isValid(NUM_ROWS, NUM_COLS, row, col-1)) {
      if (buttArray[row][col-1].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    if (isValid(NUM_ROWS, NUM_COLS, row+1, col-1)) {
      if (buttArray[row+1][col-1].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    if (isValid(NUM_ROWS, NUM_COLS, row+1, col)) {
      if (buttArray[row+1][col].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    if (isValid(NUM_ROWS, NUM_COLS, row+1, col+1)) {
      if (buttArray[row+1][col+1].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    if (isValid(NUM_ROWS, NUM_COLS, row, col+1)) {
      if (buttArray[row][col+1].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    if (isValid(NUM_ROWS, NUM_COLS, row-1, col+1)) {
      if (buttArray[row-1][col+1].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    if (isValid(NUM_ROWS, NUM_COLS, row-1, col)) {
      if (buttArray[row-1][col].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    if (isValid(NUM_ROWS, NUM_COLS, row-1, col-1)) {
      if (buttArray[row-1][col-1].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    //System.out.println("alive stat " + countAlive);
    //System.out.println("alive stat " + countDead);
    if (countAlive < 2) {
      changeRow.add(row);
      changeCol.add(col);
    } else if (countAlive > 3) {
      changeRow.add(row);
      changeCol.add(col);
    }
  } else {
    //Checks neighboring cells clockwise starting from 12 o clock
    if (isValid(NUM_ROWS, NUM_COLS, row, col-1)) {
      if (buttArray[row][col-1].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    if (isValid(NUM_ROWS, NUM_COLS, row+1, col-1)) {
      if (buttArray[row+1][col-1].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    if (isValid(NUM_ROWS, NUM_COLS, row+1, col)) {
      if (buttArray[row+1][col].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    if (isValid(NUM_ROWS, NUM_COLS, row+1, col+1)) {
      if (buttArray[row+1][col+1].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    if (isValid(NUM_ROWS, NUM_COLS, row, col+1)) {
      if (buttArray[row][col+1].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    if (isValid(NUM_ROWS, NUM_COLS, row-1, col+1)) {
      if (buttArray[row-1][col+1].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    if (isValid(NUM_ROWS, NUM_COLS, row-1, col)) {
      if (buttArray[row-1][col].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    if (isValid(NUM_ROWS, NUM_COLS, row-1, col-1)) {
      if (buttArray[row-1][col-1].on) {
        countAlive++;
      } else {
        countDead++;
      }
    }
    //System.out.println("dead stat " + countAlive);
    //System.out.println("dead stat " + countDead);
    if (countAlive == 3) {
      changeRow.add(row);
      changeCol.add(col);
    }
  }
  //changes cells' states
  
}
