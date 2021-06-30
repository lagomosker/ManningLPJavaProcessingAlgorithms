//Week 3 milestone 1. Is this it? We'll see how much I have to throw out. 

import java.util.*;

List<SixDData> dataSixD=new ArrayList<SixDData>();
Random randGen=new Random();

void setup(){
  size(1200, 800);
  background(255);
  for (int iCount=0; iCount<800; iCount++)
  {
    SixDData dp=new SixDData();
    dp.a=randGen.nextFloat();
    dp.b=randGen.nextFloat();
    dp.c=randGen.nextFloat();
    dp.d=randGen.nextFloat();
    dp.e=randGen.nextFloat();
    dp.f=randGen.nextFloat();
    dataSixD.add(dp);
  }
  colorMode(RGB,255);
}

void draw()
{
  for (SixDData dp: dataSixD)
  {
    noStroke();
    fill(int(255* (dp.a+dp.d)/2),int(255* (dp.b+dp.e)/2),int(255* (dp.c+dp.f)/2));
    ellipse(dp.getX()*1200, dp.getY()*800,10,10);
  }
}


class SixDData
{
  float a,b,c,d,e,f;
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
}
