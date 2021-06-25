/*Effectively the solution code, with a few more comments,
variable name changes.
Was in hospital, trying to catch up. Please check with Malena 
if you have any questions regarding my late feedback.
David*/

import java.util.*;

int totalNumbers = 15;

TreeNode root;
Queue<TreeNode> nodesQueue = new LinkedList<TreeNode>();

void setup() {
  size(800, 400);

  root = new TreeNode(0);
  nodesQueue.offer(root);
  //Moving this from global because for now it seems we don't need it there
  List<Integer> randomValues = new ArrayList<Integer>();

  
  int randomValue = root.value = int(random(0, 10));
  for (int iCount = 0; iCount < totalNumbers; iCount++) {
    TreeNode t = nodesQueue.poll();
    randomValues.add(randomValue += random(1, 5));
    nodesQueue.offer(t.left = new TreeNode(randomValue));
    randomValues.add(randomValue += random(1, 5));
    nodesQueue.offer(t.right = new TreeNode(randomValue));
  }

  println(randomValues);
}


void draw() {
  background(255);//White
  stroke(40);
  translate(width/2, height/4);
  // start from the root node, then draw recursively
  drawNode(root, 1);
}

void drawNode(TreeNode tn, int level) {
  if (tn == null) {
    return;
  }

  // links down to left and right
  if (tn.left != null) {
    line(8, -5, 8 - pow(2, 5-level)*10 - 6, 35);
    line(8, -5, 8 + pow(2, 5-level)*10, 35);
  }

  // draw own label and value
  fill(255, 255 - tn.value*1.4, 255);
  rect(-7, -16, 30, 20);
  fill(40);
  text(tn.value, 0, 0);
  
  //Note the pop and push are needed and damn clever to complement the recursive 
  // left side
  pushMatrix();
  translate(-pow(2, 5-level)*10, 40);
  drawNode(tn.left, level + 1);
  popMatrix();
  
  // right side
  pushMatrix();
  translate(pow(2, 5-level)*10, 40);
  drawNode(tn.right, level + 1);
  popMatrix();
}

class TreeNode {
  // own value
  int value = 0;
  // children
  TreeNode left, right;
  
  TreeNode(int value) {
    this.value = value;
  }
}
