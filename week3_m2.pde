//Week 3 milestone 2. Is this it? We'll see how much I have to throw out. 

import java.util.*;

List<SixDData> dataSixD=new ArrayList<SixDData>();
static Random randGen=new Random();
SixDData dsixRef=new SixDData();
SixDData dsixSel=null;


void setup(){
  size(1200, 900);
  background(255);
  for (int iCount=0; iCount<800; iCount++)
  {
    SixDData dp=new SixDData();
    dataSixD.add(dp);
  }
  colorMode(RGB,255);
}

void draw()
{
  int xPos=(int)mouseX/6; //Because we have 200 points in a 1200 width window
  if ((xPos<0)||(xPos>=200))
    dsixSel=null;
  else
    dsixSel=dataSixD.get(xPos);
    background(255);
  
  for (SixDData dp: dataSixD)
  {
    if ((dsixSel==null)||(dsixSel!=dp))
    {
      noStroke();
      fill(int(255* (dp.a+dp.d)/2),int(255* (dp.b+dp.e)/2),int(255* (dp.c+dp.f)/2));
      ellipse(dp.getX()*1200, dp.getY()*800,4,4);
    }
    else
    {
      stroke(0);
      fill(255,0,255);
      ellipse(dp.getX()*1200, dp.getY()*800,8,8);
    }
  }
  
    stroke(0);
    fill(255,255,0);
    rect(dsixRef.getX()*1200, dsixRef.getY()*800,12,12);
    //Data box time
    if (dsixSel!=null){
    fill(255,255,255);
    rect(0, 800,1200,100);
    fill(0);
    text("Ref (x,y): "+ dsixRef.getX() + ","+ dsixRef.getY() +"Selected (x,y): "+ dsixSel.getX() + ","+ dsixSel.getY() +"  Dim distance: " + dsixRef.getDimDistance(dsixSel)+  " Euclid dist:" + dsixRef.getEuclidDistance(dsixSel), 50,825);       
    }
    System.out.println("Ref (x,y): "+ dsixRef.getX()*1200 + ","+ dsixRef.getY() *800+"    Selected (x,y): "+ dsixSel.getX()*1200 + ","+ dsixSel.getY()*800 +"    Dim distance: " + dsixRef.getDimDistance(dsixSel)+  " Euclid dist:" + dsixRef.getEuclidDistance(dsixSel));
}


class SixDData
{
  float a,b,c,d,e,f;
  
  SixDData(){
    a=randGen.nextFloat();
    b=randGen.nextFloat();
    c=randGen.nextFloat();
    d=randGen.nextFloat();
    e=randGen.nextFloat();
    f=randGen.nextFloat();
  }

  float getX()
  {
    float x=abs(1-((a+b)*c));
    return x;
  }
  float getY()
  {
    float y=abs(1-((d+e)*f));
    return y;
  }
  
        
  float getDimDistance(SixDData dOther)
  {
    return sqrt(pow(this.a-dOther.a,2)+pow(this.b-dOther.b,2)+pow(this.b-dOther.b,2)+pow(this.b-dOther.b,2)+pow(this.b-dOther.b,2)+pow(this.b-dOther.b,2));
  }
  
  float getEuclidDistance(SixDData dOther)
  {
    return sqrt(pow(this.getX()-dOther.getX(),2)+pow(this.getY()-dOther.getY(),2));
  }
}
