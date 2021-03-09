public class Button { // creates a button

  private float x, y, width, height;
  private boolean on;


  private Button(float xx, float yy, float ww, float hh) {
    x=xx;
    y=yy;
    width=ww;
    height=hh;
    Interactive.add( this );// registers it with manager
  }
  public void mousePressed() { 
    on = !on;
    //System.out.println("poo");
  }
  public void draw() { // occurs after the draw() outside of class
    if (on) {
      fill(255);
      //System.out.println("ah");
    } else {
      fill(100);
    }
    rect(x, y, width, height);
  }
}
