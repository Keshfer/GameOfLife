public class ClearButton {
  private boolean on = false;
  private float x,y,width,height;
  private ClearButton(float xx, float yy, float ww, float hh) {
    x = xx;
    y = yy;
    width = ww;
    height = hh;
    Interactive.add(this);
  }
  void mousePressed() {
    on = !on;
  }
  void draw() {
   if(on) {
     for(int i = 0; i < buttArray.length; i++) {
      for(int h = 0; h < buttArray[i].length; h++) {
        buttArray[i][h].on = false;
      }
     }
     gg.on=false;
     on =!on;
   }
   fill(255,255,255);
   rect(x,y,width,height);
   fill(0,0,0);
   text("Clear",321,383);
  }
}
