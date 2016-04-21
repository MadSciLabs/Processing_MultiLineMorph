
PShape _s;
PShape _c;

int _scale = 2;
boolean START = false;

int _count = 0;

ArrayList<ArrayList<PVector>> target = new ArrayList<ArrayList<PVector>>();
ArrayList<ArrayList<PVector>> _cur = new ArrayList<ArrayList<PVector>>();

/*
ArrayList<PVector> _pic1 = new ArrayList<PVector>();
ArrayList<PVector> _pic2 = new ArrayList<PVector>();
ArrayList<PVector> _pic3 = new ArrayList<PVector>();
*/

ArrayList<ArrayList<PVector>> _pic1 = new ArrayList<ArrayList<PVector>>();
ArrayList<ArrayList<PVector>> _pic2 = new ArrayList<ArrayList<PVector>>();
ArrayList<ArrayList<PVector>> _pic3 = new ArrayList<ArrayList<PVector>>();


void loadVector(String _path, ArrayList<ArrayList<PVector>> _new)
{
  PShape _s = loadShape(_path);
  
  println("child : " + _s.getChildCount());  
  
  for (int i=0; i<_s.getChildCount(); i++)
  {
    _c = _s.getChild(i);
    println("vertex : " + _c.getVertexCount());
    for (int j=0; j<_c.getVertexCount(); j++)
    {
       _new.add(_c.getVertex(j));
    }
  }

}

void setup() {
  size(1400, 600);
  // The file "bot.svg" must be in the data folder
  // of the current sketch to load successfully
  _s = loadShape("g_1.svg");
  
  println("child : " + _s.getChildCount());  
  
  //Pic 1
  loadVector("g_1.svg",_pic1);
  loadVector("g_1.svg",_cur);

  //Pic 2
  loadVector("g_2.svg",_pic2);
  
  //Pic 3
  loadVector("g_3.svg",_pic3);
}

void draw() {
  stroke(0);
  strokeWeight(1);
  //shape(s, 0, 0, 800, 400);
  
  background(255);
  
  smooth();
  noFill();
  stroke(0, 0, 0);
  
  for (int j=0; j<
  beginShape();
  //for (PVector _p:_cur)
  for (int i=0; i<590; i++)
  {
    PVector _p = _cur.get(i);
    curveVertex(_scale*_p.x, _scale*_p.y);
    
    if (START) {
      
//println("move");
      
      PVector _d = new PVector(target.get(i).x,target.get(i).y);
      _d.sub(_p);
    
      if (abs(_d.mag()) > 1) {
        _d.mult(.025);
      }

      //_d.x = _d.x/1000;
      //_d.y = _d.y/1000;
   
      _p.add(_d);  
    }
    
  }
  endShape();
  
}

void mouseClicked() {
 
     _count++;
     
     switch (_count%3) {
      
       case 1:
         target = _pic2;
         break;
       
       case 2:
         target = _pic3;
         break;
         
       case 0:
         target = _pic1;
         break;
     }
     
     START = true;
     
  }