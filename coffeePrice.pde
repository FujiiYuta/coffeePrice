//kadai2
//1069rows
//coffee price data
//3-4-47 Yuta Fujii
//by quandl.
import de.bezier.data.sql.mapper.*;
import de.bezier.data.sql.*;
float open[] = new float[1069];
float high[] = new float[1069];
float low[] = new float[1069];
float settle[] = new float[1069];
float volume[] = new float[1069];

SQLite db;
boolean flag1 = true;
boolean flag2 = false;
boolean flag3 = false;
boolean flag4 = false;
boolean flag5 = false;


void setup(){
  size(1100, 800);
  background(0);
  db = new SQLite(this, "coffee.db");
    if(db.connect()){
    int a = 0;
    for(int i = 1; i <= 1069; i++){
      a++;
      String sql = "SELECT Open,High,Low,Volume,Settle FROM coffee_data where id = "+i;
      db.query(sql);
      open[i-1] = db.getFloat("Open");
      high[i-1] = db.getFloat("High");
      low[i-1] = db.getFloat("Low");
      volume[i-1] = db.getFloat("Volume");
      settle[i-1] = db.getFloat("Settle");
      println(a+" : "+open[i-1]);
    }
  }
}

void draw(){
  background(0);
  fill(0,0,255);
  noStroke();
  rect(30,10,80,30);
  fill(0,255,0);
  noStroke();
  rect(110,10,80,30);
  fill(255,255,0);
  noStroke();
  rect(190,10,80,30);
  fill(255,100,0);
  noStroke();
  rect(270,10,80,30);
  fill(255,0,0);
  noStroke();
  rect(350,10,80,30);
  textSize(18);
  fill(0);
  text("Low",210, 30);
  fill(255);
  text("Open",45, 30);
  text("High",130,30);
  text("Volume",278,30);
  text("Settle",365,30);
  stroke(255);
  line(30, 50, 30, height-30); 
  line(30, 50, 20, 70);
  line(30, 50, 40, 70);
  line(30, height-30, width-30, height-30);
  line(width-30, height-30, width-50, height-40);
  line(width-30, height-30, width-50, height-20);
  textSize(8);
  text("0", 10, height-20);
  text("100", 10, height-130);
  text("200", 10, height-130);
  text("1999", 1017+29, height-20);
  text("1998", 767+29, height-20);
  text("1997", 516+29, height-20);
  text("1996", 267+29, height-20);
  text("1995/3",29,height-20);
  if(flag1){
    int p1 = 0;
    if( p1 == 0){
      p1++;
    }
    while(p1 < 1069){
      //float start_x = map(p-1, 0, 1069, 0, width);
      //float start_y = map(open[p-1], 0, 300, height, 0);
      float end_x = map(p1+30, 0, 1069, 0, width);
      float end_y = map(open[p1], 0, 1069, height-30, 0);
      //line(start_x, start_y, end_x, end_y);
      stroke(0,0,255);
      point(end_x,end_y);
      p1++;
    }
  }if(flag2){
    int p2 = 0;
    if( p2 == 0){
      p2++;
    }
    while(p2 < 1069){
      float end_x = map(p2+30, 0, 1069, 0, width);
      float end_y = map(high[p2], 0, 1069, height-30, 0);
      stroke(0,255,0);
      point(end_x,end_y);
      p2++;
    }
  }if(flag3){
      int p3 = 0;
    if( p3 == 0){
      p3++;
    }
    while(p3 < 1069){
      float end_x = map(p3+30, 0, 1069, 0, width);
      float end_y = map(low[p3], 0, 1069, height-30, 0);
      stroke(255,255,0);
      point(end_x,end_y);
      p3++;
    }
  }if(flag4){
    int p4 = 0;
    if( p4 == 0){
      p4++;
    }
    while(p4 < 1069){
      float start_x = map(p4+29, 0, 1069, 0, width);
      float start_y = map(volume[p4-1], 0, 1069, height-30, 0);
      float end_x = map(p4+30, 0, 1069, 0, width);
      float end_y = map(volume[p4], 0, 1069, height-30, 0);
      stroke(255,100,0);
      line(start_x, start_y, end_x, end_y);
      p4++;
    }
  }if(flag5){
    int p5 = 0;
    if( p5 == 0){
      p5++;
    }
    while(p5 < 1069){
      float end_x = map(p5+30, 0, 1069, 0, width);
      float end_y = map(settle[p5], 0, 1069, height-30, 0);
      stroke(255,0,0);
      point(end_x,end_y);
      p5++;
    }
  }
}

void mouseClicked(){
  if(mouseX >= 30 && mouseX <= 110 && mouseY >= 10 && mouseY <=40){
    //rect(30,10,80,30);
    //open
    flag1 = !flag1;
    
  }else if(mouseX > 110 && mouseX <= 190 && mouseY >= 10 && mouseY <=40){
    //rect(110,10,80,30);
    //high
    flag2 = !flag2;
    
  }else if(mouseX > 190 && mouseX <= 270 && mouseY >= 10 && mouseY <=40){
    //rect(190,10,80,30);
    //low
    flag3 = !flag3;
   
  }else if(mouseX > 270 && mouseX <= 350 && mouseY >= 10 && mouseY <=40){
    //rect(270,10,80,30);
    //volume
    flag4 = !flag4;
    
  }else if(mouseX > 350 && mouseX <= 430 && mouseY >= 10 && mouseY <=40){
    //rect(350,10,80,30);
    //settle
    flag5 = !flag5;
    
  }
}
