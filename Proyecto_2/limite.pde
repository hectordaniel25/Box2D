class Limite{
  float x,y;
  float w;
  float h;
  Body b;
  
  Limite( float x_, float y_, float w_, float h_){
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
    
    //definir sus caracteristicas 
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.friction = 4;
    fd.restitution = 0.4;
    fd.density = 1;
    
    b.createFixture(fd);
  }
  
  void display(){
    pushMatrix();
      translate(x,y);
      noStroke();
      imageMode(CENTER);
      image(camino2,c,0,800,50);
      image(camino,c+800,0,w,50);
      image(camino2,c+1600,0,800,50);
      if(c <= -1600)c=0;
    popMatrix();
  }

}
