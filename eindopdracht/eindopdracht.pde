ArrayList<PVector> snake = new ArrayList<PVector>();
PVector pos;

PVector Fd;

PVector dir = new PVector(0, 0);

int size = 20;
int w, h;

int spd = 20;
int len=5;

void setup () {
  size(1080, 720);
  w= width/size;
  h = height/size;
  
  pos = new PVector(w/2, h/2);
  Fd = new PVector(int(random(w)), int(random(h)));
  
  noStroke();
  fill(0);
}

void draw()  {
  background(200);
  drawSnake();
  drawFd();
  
  if(frameCount % spd ==0) {
    updateSnake();
    
  }  
}

void drawFd() {
  fill(255,0,0);
  rect(Fd.x * size, Fd.y * size, size, size);
}

void newFd() {
  Fd = new PVector(int(random(w)), int(random(h)));
}

void drawSnake() {
  fill(0);
  rect(pos.x * size, pos.y * size, size, size);
  for(int i = 0; i < snake.size(); i++) {
    rect(snake.get(i).x * size, snake.get(i).y * size, size, size);
  }
}

void updateSnake() {
  if(dir.x !=0 || dir.y != 0 ) {
    snake.add(new PVector(pos.x, pos.y));
  }
    while(snake.size() > len) {
      snake.remove(0);
    }
    pos.add(dir);
    
    if(pos.x == Fd.x && pos.y == Fd.y) {
      newFd();
      len += 1;
      spd= constrain(spd - 1, 0, 20);
    }
    
    for(int i = 0; i < snake.size(); i ++) {
      if(pos.x == snake.get(i).x && pos.y == snake.get(i).y) {
        reset();
      }
    } 
    
    if(pos.x < 0) { pos.x = w - 1; }
    if(pos.x > w) { pos.x = 0; }
    if(pos.y < 0) { pos.y = h - 1; }
    if(pos.y > h) { pos.y = 0; }
}

void reset() {
  spd = 20;
  len = 5;
  pos = new PVector(w/2, h/2);
  dir = new PVector(0, 0);
  newFd();
  snake = new ArrayList<PVector>();
}


void keyPressed() {
 if(key == CODED) {
   if(keyCode == UP) { dir = new PVector (0, -1);}
   if(keyCode == DOWN) { dir = new PVector (0, 1);}
   if(keyCode == LEFT) { dir = new PVector (-1, 0);}
   if(keyCode == RIGHT) { dir = new PVector (1, 0);}
 }
}
