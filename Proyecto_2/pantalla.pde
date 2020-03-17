class pantalla{
  void cambio(){
    if(pantalla == 0){
      imageMode(CORNER);
  image(fondo,z,0);
  image(fondo1,z+fondo.width,0);
  image(fondo2,z+fondo.width+fondo1.width,0);
  if(z <= -fondo.width-fondo1.width){
    z = 0;
  }
      fill(255);
      textSize(80);
      text("VIDA",300,100);
      textSize(28);
      text("Controles:\n\n*Presiona 'a' para poder avansar en el juego\n\n*Posiciona el mouse dentro de la pantalla de juego y clikea para\n crear un escudo\n\n*En la pantalla de conclucion presiona 'e' para volver al inicio\n\nEl juego esta pensado para durar 5 min aprox.Si el jugador no\navansa se prolongara el tiempo\n\nPresiona 'ENTER' para comenzar",0,150);
    }
    if(pantalla == 1){
      a.pan2();
      mundo.step();
      per.display();

      for (int i = escudo.size()-1; i >= 0; i--) {
    muro p = escudo.get(i); 
    if (p.done()) {
      escudo.remove(i);
    }
      
      for(muro c:escudo){
        c.display();
      }
  }
      suelo.display();
  for (objetos b: nuevos) {
         Vec2 force = per.attract(b);
         b.applyForce(force);
        }
  
  if(xa < 0){
    for (objetos b: nuevos) {
         b.display();
        }
  }
  
  for (int i = nuevos.size()-1; i >= 0; i--) {
    objetos p = nuevos.get(i);
    if (p.done()) {
      nuevos.remove(i);
    }
    
  }
  if(xa < 0){
    for (golpes b: problemas) {
         b.display();
        }
  }
  for (int i = problemas.size()-1; i >= 0; i--) {
    golpes p = problemas.get(i);
    if (p.done()) {
      problemas.remove(i);
    }
  }
  
  if(tiempo == 5){
    pantalla = 2;
  }
  
    }  
    if(pantalla == 2){
      switch(key){
        case 's':
        saveFrame();
        break;
      }
      for (int i = nuevos.size()-1; i >= 0; i--) {
    objetos p = nuevos.get(i);
    if (p.borrar()) {
      nuevos.remove(i);
    }
    
  }
  for (int i = problemas.size()-1; i >= 0; i--) {
    golpes p = problemas.get(i);    
    if (p.borrar()) {
      problemas.remove(i);
    }
  }
      fill(0);
      rectMode(CORNER);
      rect(0,0,width,height);
      textSize(32);
      fill(255);
      text("Gracias por jugar\n\nEste proyecto fue inspirado en:\nThe flood\n\nTodas las estrellas que juntaste\nson las cosas buenas que te\nofrece la vida y todos\nlos asteroides son\nlos problemas que enfrentaras\ndia a dia",0,40);
      estrella.resize(60,60);
      fondo4.resize(70,70);
      image(estrella,40,400);
      image(fondo4,200,400);
      text("Presiona 'e' para ir al menu",0,500);
    }
  
  }
}
