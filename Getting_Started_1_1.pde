  void setup() {
        // Print out the version of Java you are using
      println(System.getProperty("java.version"));

      //size of canvas 
      size(800, 400);
    }

    void draw() {
      //Color in the canvas background
        background(255, 255, 255);
        
        line(400,40,40,200);
        fill(255,0,0);
        rect(360,0,80,80);
        fill(0,0,255);
        rect(0,160,80,80);
        
    }
