/*David Moskowitz
Manning LiveProject: Sort and Search Algorithms deliverable 2 5/28/2021
Selection sort
Hop.
*/

int[] numbers;//The values to be randomized
int [] quick_numbers;
int [] quick_work;
int selection_progress;//How far along the array we've travailed
int qs_pivot;
int qs_start_place;
int qs_end_place;
int qs_last_left_pivot; //i.e. the last pivot number before we kept going left
int qs_last_left_place;
int qs_last_right_place;
IntList left_ints=new IntList();
IntList right_ints=new IntList();
int qs_step_count=0;
int selection_step_count=0;
int qs_comp_count=0;
int selection_comp_count=0;

void setup()
{
  numbers=new int[200];
  quick_numbers=new int[200];
  quick_work=new int[200];
  int index;
  size (1600,850);
  colorMode(HSB,200,100,100); 
  java.util.Random rand=new java.util.Random();
  for (index=0; index<200; index++)
  {
    numbers[index]=rand.nextInt(200);
    quick_numbers[index]=numbers[index];
    //System.out.println(index+":"+numbers[index]);
  }
  selection_progress=0;
  qs_pivot=100;
  qs_start_place=0;
  qs_end_place=199;
  qs_last_left_pivot=0;
  qs_last_right_place=199;
  qs_last_left_place=0;
  
  
}


void nextQSStep()
{
  if (qs_last_left_pivot>=199)
    return;
  qs_step_count++;
  int next_pivot=divide(qs_start_place, qs_end_place,qs_pivot);
  qs_last_left_pivot=qs_pivot;
  
  if (next_pivot==-1)
  {
    qs_pivot=qs_last_left_pivot+1; 
  }
  else
  {
    qs_pivot=next_pivot;
  }
}

//going to return next pivot point
int  divide(int start, int end, int pivot)
{
  int pivot_count=0;//because the pivot number may appear
  int position=start;//for replacing the numbers
  left_ints.clear();
  right_ints.clear();
  for (int index=start; index<=end; index++)
  {
    if (quick_numbers[index]<pivot)
    {
      left_ints.append(quick_numbers[index]);
      qs_comp_count++;
    }
    else if (quick_numbers[index]>pivot)
    {
      right_ints.append(quick_numbers[index]);
      qs_comp_count+=2;
    }
    else 
      pivot_count++;
  }
  //Now we replace the numbers...
  for (int num:left_ints)
  {
    quick_numbers[position++]=num;
  }
  for (int count=0; count<pivot_count; count++)
  {
    quick_numbers[position++]=pivot;
  }
  for (int num:right_ints)
  {
    quick_numbers[position++]=num;
  }
  //System.out.println(start+":"+end+":"+pivot+":"+left_ints.size()+":"+right_ints.size()+":"+pivot_count);
  //Nothing on the left? Start after the pivot 
  if (left_ints.size()<=1)
  {
    qs_start_place=start+left_ints.size()+pivot_count;
    qs_end_place=199;//Todo shrink this after a while so we don't check as many values; Maybe create a stack? 
    return -1;
  }
  else
  {
    qs_end_place=start+left_ints.size();
    return pivot/2;
  }
}


void swap(int first, int second)
{
  int temp;
  temp=numbers[first];
  numbers[first]=numbers[second];
  numbers[second]=temp;
}




void nextSelectionStep()
{
  selection_step_count++;
  for (int first=selection_progress; first<200; first ++)
  {
    for (int second=first; second<200; second++)
    {  
      selection_comp_count++;
      if (numbers[second]<numbers[first])
      {
        swap(first,second);
  //      System.out.println("Swapping" + first+":" +second+ numbers[first]+":"+numbers[second]);
        selection_progress=first;
        return;
      }
    }
  }
  selection_progress=199;//Kluge. We is done!
  System.out.println("all done");
}

void draw()
{
  //Are we done? 
  if ((selection_progress==199)&&(qs_last_left_pivot>=199))
    return;
  //redraw every ten frames, report
  for (int index=0; index<10; index++)
  {
    nextQSStep();
    nextSelectionStep();
  }
  System.out.println("QS:Selection FN " + qs_step_count+":" +selection_step_count);
  System.out.println("QS:Selection Comp" + qs_comp_count+":" +selection_comp_count);
  fill(100);   
  rect(0,0,1600,850);
  for (int index=0; index<200; index++)
  {
    //Selection sort values on the bottom
    fill(numbers[index]+1,100,100);  
    rect(index*8,850-numbers[index],7,numbers[index]);
    
    //Current quick sort on top
    fill(quick_numbers[index]+1,100,100);  
    rect(index*8,400-quick_numbers[index],7,quick_numbers[index]);
    
  }
}
