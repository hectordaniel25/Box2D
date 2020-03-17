class muro{
  float x,y;
  float w;
  float h;
  Body b;
  
  muro( float x_, float y_, float w_, float h_){
    w = w_;
    h = h_;
    x = x_;
    y = y_;
    
    BodyDef bd = new BodyDef();
    Vec2 posicionInicial = new Vec2(x_,y_);
    Vec2 posicionEnMundo = mundo.coordPixelsToWorld(posicionInicial);
    bd.position.set(posicionEnMundo);
    bd.type = BodyType.STATIC;
    
    b = mundo.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float ancho = mundo.scalarPixelsToWorld(w_);
    float alto = mundo.scalarPixelsToWorld(h_);
    ps.setAsBox(ancho/2,alto/2);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.friction = 4;
    fd.restitution = 0.4;
    fd.density = 1;
    
    b.createFixture(fd);
  }
  
  void killBody() {
    mundo.destroyBody(b);
  }
  
  void display(){
    pushMatrix();
      translate(x,y);
      rectMode(CENTER);
      stroke(0);
      fill(0);
      imageMode(CENTER);
      image(fondo3,0,0,20,100);
    popMatrix();
  }
  
  boolean done() {
    if (mousePressed == false) {
      killBody();
      return true;
    }
    return false;
  }

}
