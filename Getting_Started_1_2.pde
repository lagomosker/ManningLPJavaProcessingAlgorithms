int xBlue=0;
int xBlueMove=3;
  
  void setup() {
        // Print out the version of Java you are using
      println(System.getProperty("java.version"));

      //size of canvas 
      size(800, 400);
    }

    void draw() {
      //Color in the canvas background
        background(255, 255, 255);
        //Blue box overstepping bounds? 
        if (((xBlueMove+xBlue+80)>800)||((xBlueMove+xBlue)<0))
          xBlueMove*=-1;
        xBlue+=xBlueMove;   
          
        
        line(400,40,xBlue+40,200);
        fill(255,0,0);
        rect(360,0,80,80);
        fill(0,0,255);
        rect(xBlue,160,80,80);
        
    }
