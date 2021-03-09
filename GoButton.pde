public class GoButton { // creates start button
  private float x, y, width, height;
  private boolean on;
  private String stat;

  private GoButton(float xx, float yy, float ww, float hh) {// constructor
    x = xx;
    y = yy;
    width = ww;
    height = hh;
    Interactive.add(this);// Registers with manager
  }
  public void mousePressed() {
    on = !on;
  }
  public void draw() {
    if (on) {
      fill(0, 200, 0);
      stat = "Stop";
      for (int t = 0; t < NUM_ROWS; t++) {
        for (int u = 0; u < NUM_COLS; u++) {

          isLiveDead(NUM_ROWS, NUM_COLS, t, u);
        }
      }
      while (changeRow.size() > 0) {
        buttArray[changeRow.get(0)][changeCol.get(0)].on = !(buttArray[changeRow.get(0)][changeCol.get(0)].on);
        changeRow.remove(0);
        changeCol.remove(0);
      }
      changeRow.removeAll(changeRow);
      changeCol.removeAll(changeCol);
    } else {
      fill(200, 0, 0);
      stat = "Start";
    }
    rect(x, y, width, height);
    fill(255, 255, 255);
    text(stat, 362, 383);
  }
}
