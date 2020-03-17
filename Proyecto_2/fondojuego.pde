class fondo{
  void pan2(){
  imageMode(CORNER);
  image(fondo,xa,0);
  image(fondo1,xa+fondo.width,0);
  image(fondo2,xa+fondo.width+fondo1.width,0);
  if(xa <= -fondo.width-fondo1.width){
    tiempo += 1;
    xa = 0;
  }
  }
}
