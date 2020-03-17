class atraer{
  
  Body body;
  float a;
  
  atraer(float a_,float x,float y){
    a = a_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position = mundo.coordPixelsToWorld(x,y);
    body = mundo.world.createBody(bd);
    
    PolygonShape Ps = new PolygonShape();
    float ancho = mundo.scalarPixelsToWorld(10);
    float alto = mundo.scalarPixelsToWorld(10);
    Ps.setAsBox(ancho/2,alto/2);
    
    body.createFixture(Ps,1);
  }
   
  Vec2 attract(objetos p) {
    float G = 100; 
    Vec2 pos = body.getWorldCenter();    
    Vec2 moverPos = p.body.getWorldCenter();
    Vec2 force = pos.sub(moverPos);
    float distance = force.length();
    distance = constrain(distance,1,5);
    force.normalize();
    float strength = (G * 3 * p.body.m_mass) / (distance * distance); 
    force.mulLocal(strength);       
    return force;
  }
  
  void display() {
    Vec2 pos = mundo.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(random(255),random(255),random(255));
    rectMode(CENTER);
    imageMode(CENTER);
    rect(0,0,10,10);
    popMatrix();
  }
  
}
