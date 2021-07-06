int xBlue=0;
int xBlueMove=3;
int yBlue=200;
boolean bSpacePressed=false;
boolean bMouseDown=false;
boolean bDrawing=true;
  
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
        if (((xBlueMove+xBlue+80)>800)||((xBlue+xBlue)<0))
          xBlueMove*=-1;
        xBlue+=xBlueMove;   
          
        
        line(400,40,xBlue+40,yBlue);
        fill(255,0,0);
        rect(360,0,80,80);
        fill(0,0,255);
        rect(xBlue,yBlue-40,80,80);
        
    }
    
    void mousePressed()
    {
      if (bMouseDown)
        return;
      bMouseDown=true;
      
      //Are we in the blue box
      if ((mouseX>(xBlue-40))&&(mouseX<(xBlue+40))&&(mouseY>(yBlue-40))&&(mouseY<(yBlue+40)))
      {
        if (bDrawing)
          {noLoop();bDrawing=false;}
        else
          {loop();bDrawing=true;}
      }
      else
      {  yBlue=mouseY; redraw();}
    }
    
    void mouseReleased()
    {
      bMouseDown=false;
    }
    void keyPressed()
    {
       if (key == CODED) {
        if (keyCode == UP) {
      yBlue--;
    } else if (keyCode == DOWN) {
      yBlue++;
    } }
      else if (key==' ')
      {
        if (!bSpacePressed)
          xBlueMove*=-1;
        bSpacePressed=true;
      }
       }
       
    void keyReleased()
    {
      if (key==' ')
        bSpacePressed=false;
    }
