class golpes{
  Body body;
  float r;

  golpes(float r_, float x, float y) {
    r = r_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;

    bd.position = mundo.coordPixelsToWorld(x,y);
    body = mundo.world.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = mundo.scalarPixelsToWorld(20);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 20;
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
    fill(#F4F50C);
    stroke(#F4F50C);
    rectMode(CENTER);
    imageMode(CENTER);
    image(fondo4,0,0,40,40);
    popMatrix();
  }
  
  boolean done() {
    Vec2 pos = mundo.getBodyPixelCoord(body);
    if (pos.x < -30 || pos.y < 30) {
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
