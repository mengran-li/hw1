//I want to make a scene game that switches between day and night. 
//The background I set in the daytime scene is in the style of Halloween.
//The coordinates and transparency are randomly generated. 
//It will interact with your mouse. 
//It will still be connected when you move the mouse.
//There is also a brush effect.
PVector q[]=new PVector[150];
float dst[]=new float[150];
float dst1[]=new float[150];
float move_dist;
boolean mo=true;

int aa=1000;
int max_r=150;
int orbit_range=round(random(50,60));
PVector p[]=new PVector[aa];
float n[]=new float[aa];
float theta[]=new float[aa];
float rnew[]=new float[aa];
float r[]=new float[aa];
float theta_gap[]=new float[aa];
float easing[]=new float[aa];
color c[]=new color[aa];
boolean mouse_tag=true;



PVector v[]=new PVector[3];
float x1=-1,y1=500;
float x2=599,y2=500;
float cx1=300,cy1=300,cx2=300,cy2=300;
float cx3=300,cy3=300,cx4=300,cy4=300;
int num=int(random(50,60)); 
int b_num=10;
float win_width,win_length;
PVector t_tree[]=new PVector[num];
PVector t_bran[]=new PVector[num];
PVector leaf_b[]=new PVector[num];
PVector hill[]=new PVector[num];
PVector leaves[]=new PVector[num];
float[] t_width=new float[num];
float[] t_height=new float[num];
color c_t[]=new color[num];
float[] m_width=new float[num];
color c_m[]=new color[num];
float[] leafb_width=new float[num];
float[] leafb_length=new float[num];
float[] leaff_width=new float[num];
float[] leaff_length=new float[num];
float[] hill_width=new float[num];
float[] hill_length=new float[num];
color c_h[]=new color[num];//color hill
float[] leaves_c=new float[num];
float[] speed=new float[num];
float radius=5;

void setup()
{
    
  //star
  for (int i=1;i<=149;i++)
  {
    q[i]=new PVector(random(width),random(height));
    move_dist=random(20,40);
  }

//mouse
  for (int i=1;i<=aa-1;i++)
  {
    r[i]=random(1,5);
    c[i]=color(230,229,113);
    rnew[i]=round(i/100)*(orbit_range/(round(aa/100)-1))+(max_r-orbit_range);
    theta[i]=random(360)*PI/180;
    theta_gap[i]=random(72/PI);
   
    p[i] = new PVector(mouseX+cos(theta[i])*rnew[i],mouseY+sin(theta[i])*rnew[i]);
    easing[i]=random(0.015,0.7);
  }
  frameRate(60);
  smooth();

  
  size(900,600);
  for(int i=0;i<=num-1;i++)
  {
    c_t[i]=color(234,230,255);
    c_m[i]=color(230,219,255);
    c_h[i]=color(230,216,255);
    win_width=30;
    win_length=width/3;
    t_tree[i]=new PVector(random(width),0);
    leaf_b[i]=new PVector(random(width),random(0,30));
    hill[i]=new PVector(random(width),win_length);
    leaves[i]=new PVector(random(width),random(30,width/4));
    t_width[i]=random(5,8);
    m_width[i]=random(5,20);
    leafb_width[i]=random(70,90);
    leafb_length[i]=random(170,190);
    leaff_width[i]=random(120,140);
    leaff_length[i]=random(100,120);
    hill_width[i]=random(width/4,width/3);
    hill_length[i]=random(100,200);
    leaves_c[i]=random(20,30);
  }
}


void draw_wind()
{

  v[0]=new PVector(0,height*1/3);
  v[1]=new PVector(width/4,0);
  v[2]=new PVector(width*3/4,0);
  fill(232,198,178);
  rect(v[0].x-100,v[0].y,width+100,win_width);
  rect(v[1].x,v[1].y,win_width,win_length);
  rect(v[2].x-win_width,v[2].y,win_width,win_length);
}



void draw_tree()
{
   translate(second(),0);
  for(int i=0;i<=num-2;i++)
  {
    t_height[i]=win_length;
    fill(c_t[i]);
    rect(t_tree[i].x,t_tree[i].y,t_width[i],t_height[i]);
  }
  //middle trees
    for(int i=0;i<=20;i++)
  {
    t_height[i]=win_length;
    fill(c_m[i]);
    rect(t_tree[i].x,t_tree[i].y,m_width[i],t_height[i]);
  } 
    for(int i=0;i<=10;i++)
  {
    t_height[i]=win_length;
    fill(232,172,288);
    rect(t_tree[i].x,t_tree[i].y,m_width[i],t_height[i]);
  } 
}


void draw_leaf()
{
    for(int i=0;i<=num-2;i++)
  {  
    fill(c_t[i]);
    ellipse(leaf_b[i].x,leaf_b[i].y,leafb_width[i],leafb_length[i]);
    fill(c_m[i]);
    ellipse(leaf_b[i].x+10,leaf_b[i].y,leaff_width[i]+5,leaff_length[i]);
  } 
}
void draw_leaves()
{
 
  for(int i=0;i<=30;i++)
  {
    fill(c_m[i]);
    ellipse(leaves[i].x,leaves[i].y,leaves_c[i],leaves_c[i]);
  }
}
void draw_hill()
{
 
    //back_hill
  for (int i=0;i<=4;i++)
  {
    fill(c_t[i]);
    ellipse(hill[i].x+200,hill[i].y+10,hill_width[i],hill_length[i]+10);
  }
  //front_hill
  for (int i=0;i<=4;i++)
  {
    fill(c_h[i]);
    ellipse(hill[i].x,hill[i].y,hill_width[i],hill_length[i]);
  }
    for (int i=0;i<=10;i++)
  {
    fill(232,166,197);
    ellipse(hill[i].x+50,hill[i].y+40,hill_width[i],hill_length[i]);
  }
}
void draw_road()
{
  fill(232,166,197);
  rect(-100,height*1/2,width+100,200);
  fill(232,155,198);
  rect(-100,height*1/2+20,width+100,100);
   for (int i=0;i<=8;i++)
  {
    fill(232,155,198);
    ellipse(hill[i].x+20,hill[i].y+70,hill_width[i],hill_length[i]);
  }
  fill(215,158,232);
  rect(-100,height*1/2+50,width+100,100);
    for (int i=0;i<=8;i++)
  {
    fill(215,158,232);
    ellipse(hill[i].x+50,hill[i].y+100,hill_width[i]-30,hill_length[i]-30);
  }
}
  void draw_bg()
  {
    fill(0,0,0);
    rect(0,0,width,height);
    fill(255,255,255);
    for(int i=1;i<=149;i++)
    {
     q[i]=new PVector(q[i].x+cos(second()+random(20,30))+random(-1,1),q[i].y+sin(second()+random(20,30))+random(-1,1));//set points pos
     }
   for (int i=1;i<=149;i++)
    { 
     noStroke();
     ellipse(q[i].x,q[i].y,5,5);
     dst[i]=dist(mouseX,mouseY,q[i].x,q[i].y);
      for(int j=1;j<=num-1;j++)
      {
       if(dst[j]<=200)
        {
          stroke(255,255,255);
          stroke(255,255-dst[j]);
        }
      }  
      for (int j=1;j<=num-1;j++)
      {
       dst1[j]=dist(q[i].x,q[i].y,q[j].x,q[j].y);
        if(dst1[j]<=100)
        {
         stroke(255,255,255);
         stroke(255,255-dst[j]);
         strokeWeight(1);
         line(q[i].x,q[i].y,q[j].x,q[j].y); 
         }  
       }
    }
  }  
  void draw()
{
 background(238,239,255);
  noStroke();
  if (mo)
 { draw_tree();
  draw_leaf();
  draw_leaves();
  draw_hill();
  draw_road();
  draw_wind();}
  if(!(mo))
  {
    draw_bg();
    draw_tree();
    draw_leaf();
    draw_leaves();
    draw_hill();
    draw_road();
  }
    for (int i=1; i<=num-1;i++)
   {
    fill(c[i]);
    theta[i]+=theta_gap[i];
    p[i].lerp(mouseX+cos(theta[i])*(rnew[i]),mouseY+sin(theta[i])*(rnew[i]),0,easing[i]);
    ellipse(p[i].x, p[i].y, r[i],r[i]);
   }  
    }
void mousePressed()
{
  mo=!mo;
}
