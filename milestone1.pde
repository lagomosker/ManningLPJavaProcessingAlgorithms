/*David Moskowitz
Manning LiveProject: Sort and Search Algorithms deliverable 1 5/27/2021
Lots of hardcoded values--including leaving the draw() alone. Just getting toes wet.
Hop.
*/
void setup()
{
  int[] numbers=new int[200];
  int index;
  size (1600,400);
  colorMode(HSB,200,100,100); 
  java.util.Random rand=new java.util.Random();
  for (index=0; index<200; index++)
  {
    numbers[index]=rand.nextInt(200);
    fill(numbers[index]+1,100,100);
    rect(index*8,400-numbers[index],7,numbers[index]);
  }
  
  
}


void draw()
{
}
