class objetos{
  Body body;
  float r;

  objetos(float r_, float x, float y) {
    r = r_;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;

    bd.position = mundo.coordPixelsToWorld(x,y);
    body = mundo.world.createBody(bd);

    PolygonShape cs = new PolygonShape();
    float ancho = mundo.scalarPixelsToWorld(10);
    float alto = mundo.scalarPixelsToWorld(10);
    cs.setAsBox(ancho/2,alto/2);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 10;
    fd.restitution = 0.5;

    body.createFixture(fd);

  }

  void applyForce(Vec2 v) {
    body.applyForce(v, body.getWorldCenter());
  }
  
  void killBody() {
    mundo.destroyBody(body);
  }


  void display() {
    Vec2 pos = mundo.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(0,255,0);
    stroke(0,255,0);
    imageMode(CENTER);
    image(estrella,0,0,10,10);
    popMatrix();
  }
  
  boolean done() {
    Vec2 pos = mundo.getBodyPixelCoord(body);
    if (pos.x < 0) {
      killBody();
      return true;
    }
    return false;
  }
  
  boolean borrar() {
    if (pantalla == 2) {
      killBody();
      return true;
    }
    return false;
  }
  
}
