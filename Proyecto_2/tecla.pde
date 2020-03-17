class mover{
  void cambio(){
     if(pantalla == 1){
       switch(key){
        case 'a':
        xa -= 1;
        c -= 2;
        if (random(2) < 0.1) {
         objetos p = new objetos(20,random(width,width+30),random(-30,height));
         nuevos.add(p);
        }
        
        for (objetos b: nuevos) {
         Vec2 wind = new Vec2(-2,0);
         b.applyForce(wind);
        }
        
        if (random(3) < 0.1) {
         golpes p = new golpes(20,random(width,width*2),random(-30,height));
         problemas.add(p);
        }
        for (golpes b: problemas) {
         Vec2 wind = new Vec2(-200,0);
         b.applyForce(wind);
        }
        break;
        case 'c':
        pantalla = 0;
        break;
      }
      switch(key){
        case 's':
        saveFrame();
        break;
      }
     }
      if(pantalla == 0){
        switch(key){
          case ENTER:
          pantalla = 1;
          break;
          case 'b':
          pantalla = 2;
          break;
        }
      }
      if(pantalla == 2){
        xa = 0;
        tiempo = 0;
        switch(key){
          case 'e':
          pantalla = 0;
          break;
        }
      }
  }
}

//body.setTransform(vec2,float);
