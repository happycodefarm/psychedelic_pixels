// (cc) guillaume stagnaro
// atelier hypermedia
// http://www.ecole-art-aix.fr/hypermedia
// http://www.happycodefarm.net

// on déclare un tableau contenant les periodes de clignotement de chaque pixels.
float[][] periodes = new float[1440][900];

void setup() {
  size(1440, 900);
  noStroke();
  for (int y = 0; y<height; y++) {
    for (int x = 0; x<width; x++) {
      // la periode de chaque pixels depend de sa distance d'avec le centre du sketch.
      periodes[x][y] = 100+ dist(x,y,width/2,height/2)+x+y;
    }
  }
}

void draw() {
  background(255,100,255);
  color pink = color(255, 102, 204);

  long t = millis();
  loadPixels();
  for (int y = 0; y<height; y++) {
    int lineOffset =y*width;
    for (int x = 0; x<width; x++) {
       if (getStateAtTimeWithPeriod(t,periodes[x][y])) pixels[x+lineOffset]=pink;
    }
  }
  updatePixels();

}

boolean getStateAtTimeWithPeriod(long t, float period) {
  boolean onOrOff = (((int)(t / period)) % 2==1);
  return onOrOff;
}

