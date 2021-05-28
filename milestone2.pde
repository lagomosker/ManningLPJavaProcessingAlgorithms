/*David Moskowitz
Manning LiveProject: Sort and Search Algorithms deliverable 2 5/28/2021
Selection sort
Hop.
*/

int[] numbers;//The values to be randomized
int progress;//How far along the array we've travailed
void setup()
{
  numbers=new int[200];
  int index;
  size (1600,400);
  colorMode(HSB,200,100,100); 
  java.util.Random rand=new java.util.Random();
  for (index=0; index<200; index++)
  {
    numbers[index]=rand.nextInt(200);
    System.out.println(index+":"+numbers[index]);
  }
  progress=0;
  
  
}

void swap(int first, int second)
{
  int temp;
  temp=numbers[first];
  numbers[first]=numbers[second];
  numbers[second]=temp;
}

void nextStep()
{
  for (int first=progress; first<200; first ++)
  {
    for (int second=first; second<200; second++)
    {
      if (numbers[second]<numbers[first])
      {
        swap(first,second);
  //      System.out.println("Swapping" + first+":" +second+ numbers[first]+":"+numbers[second]);
        progress=first;
        return;
      }
    }
  }
  progress=199;//Kluge. We is done!
  System.out.println("all done");
}

void draw()
{
  if (progress==199)
  {
    
    return;
  }
  for (int iter=0; iter<10; iter++)
    nextStep();
    //Is this the best way to clear the canvas? DOubtful
  fill(100);   
  rect(0,0,1600,400);
  for (int index=0; index<200; index++)
  {
    fill(numbers[index]+1,100,100);  
    rect(index*8,400-numbers[index],7,numbers[index]);
  }
}
