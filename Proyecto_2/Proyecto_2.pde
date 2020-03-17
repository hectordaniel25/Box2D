//proyecto 2: vida monito avansa en un solo sentido para absorber o colisionar con objetos

PImage fondo,fondo1,fondo2,fondo3,fondo4,camino,camino2,estrella;
int xa = 0;
int c = 0;
int tiempo = 0;
int pantalla = 0;
PFont bits;
int z = 0;

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing mundo;
fondo a;
pantalla p;
mover uno;
atraer per;
Limite suelo;
ArrayList<objetos> nuevos;
ArrayList<golpes> problemas;
ArrayList<muro> escudo;

void setup(){
  size(800,600);
  mundo = new Box2DProcessing(this);
  mundo.createWorld();
  mundo.setGravity(0,-2);
  fondo = loadImage("1.jpg");
  fondo1 = loadImage("2.jpg");
  fondo2 = loadImage("1.jpg");
  fondo3 = loadImage("muro.jpg");
  fondo4 = loadImage("Asteroid.png");
  camino = loadImage("34.jpg");
  camino2 = loadImage("35.jpg");
  estrella = loadImage("estrella.png");
  uno = new mover();
  a = new fondo();
  p = new pantalla();
  per = new atraer(20,100,500);
  suelo = new Limite(400,600,800,50);
  nuevos = new ArrayList<objetos>();
  problemas = new ArrayList<golpes>();
  escudo = new ArrayList<muro>();
  bits = loadFont("8-Bit-Madness-48.vlw");
  textFont(bits);
}

void draw(){
  p.cambio();
  z -= 1;
}

void keyPressed(){
  uno.cambio();
}

void mousePressed(){
  escudo.add(new muro(mouseX,mouseY,20,100));
}
