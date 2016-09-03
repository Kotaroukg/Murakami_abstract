Elementary_waves e_wave_1, e_wave_2, e_wave_3;
First_wave f_wave;

void setup(){
  size(1000,1000);
  smooth();
  frameRate(5);
  line(0,height/2-100,width,height/2-100);
  e_wave_1 = new Elementary_waves(255,0,0,width/2-100,height/2-100); // RGB 初期座標xy １フレームごとの加速ピクセル
  e_wave_2 = new Elementary_waves(0,255,0,width/2,height/2-100);
  e_wave_3 = new Elementary_waves(0,0,255,width/2+100,height/2-100);
  f_wave = new First_wave(45);//angle

}

void draw(){
  background(255);
  noFill();
  e_wave_1.create_elementary_wave();
  e_wave_1.display();
  e_wave_2.create_elementary_wave();
  e_wave_2.display();
  e_wave_3.create_elementary_wave();
  e_wave_3.display();
  fill(255);
  rect(0,0,width,height/2-101);
  fill(0);
  f_wave.draw_first_wave();



}


class Elementary_waves{
  int color_a, color_b, color_c;
  int coordinates_x, coordinates_y;
  int speed;
  int radius;
  ArrayList elementary_wave;

  Elementary_waves(int _color_a, int _color_b, int _color_c,
      int _coordinates_x, int _coordinates_y){
    color_a = _color_a;
    color_b = _color_b;
    color_c = _color_c;
    coordinates_x = _coordinates_x;
    coordinates_y = _coordinates_y;
    speed = 20; //　１フレームあたりの素元波のスピード

    elementary_wave = new ArrayList();
  }

  void create_elementary_wave(){
    elementary_wave.add(new Elemntary_wave(0,speed)); 
  }

  

  void display(){
    stroke(color_a, color_b, color_c);
    pushMatrix();
    translate(coordinates_x,coordinates_y);
    for(int i = elementary_wave.size()-1; i>=0; i--){
      Elemntary_wave e = (Elemntary_wave)elementary_wave.get(i);
      if(e.update() == false)
      elementary_wave.remove(i);
      }
    popMatrix();
    stroke(0,0,0);//syokika
  }



}


class Elemntary_wave{
  int radius;
  int speed;
  Elemntary_wave(int _radius, int _speed){
    radius = _radius;
    speed = _speed;
  }

  boolean update(){                   // ここで素元波を描く
    radius += speed;
    ellipse(0,0,radius,radius);
    if(radius > width*3 || radius > height*3){
      return false;
    }
    return true;
  }
}


class First_wave{
  float angle;
  int y;
  int speed;
  First_wave(float _angle){
    angle = _angle;
    y = 0;
    speed = 5;
    
  }

  void draw_first_wave(){
    rotate(radians(-angle));
    println(angle);
    line(0,y,width,y);
    y += speed;
  }

}


