import peasy.PeasyCam;

PeasyCam cam;
PointsObj po;

FloatToPixel f2p;
PixelToFloat p2f;
int maxColor = 255 * 255 * 255;
GameState gs;
float scaleVal = 200;
float strokeWeightVal = 1/scaleVal;

void setup() {
  size(1024, 1024, P3D);
  gs = GameState.OBJ;

  cam = new PeasyCam(this, 400);
  po = new PointsObj("test.obj");
  
  f2p = new FloatToPixel(po);
  
  p2f = new PixelToFloat(f2p);
}

void renderPointsObj(PointsObj _po) {
  pushMatrix();
  strokeWeight(strokeWeightVal);
  translate(-width/8, height/8, 0);
  scale(scaleVal, scaleVal, scaleVal);
  rotateX(radians(180));
  _po.draw();
  popMatrix();
}

void draw() {
  background(0);
  
  switch (gs) {
    case OBJ:
      renderPointsObj(po);
      break;
    case F2P:
      camera();
      pushMatrix();
      f2p.draw();
      popMatrix();
      break;
    case P2F:
      renderPointsObj(p2f.po);
      break;
  }
  
  surface.setTitle("" + frameRate);
}
