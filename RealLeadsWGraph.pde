//LIBRARIES



//GLOBAL VARIABLES
PImage baseMap;
Table table;
int rowCount;
PFont f;
boolean chart= false;
float numCust;
//SETUP
void setup() {
  size(1536, 796);

  f = createFont("Avenir-Medium", 15);
  baseMap = loadImage("usa.png");
  table = loadTable("Active Real Leads Accounts2.csv", "header");

  println(table.getRowCount() + " total rows in table");
  float numCust=table.getRowCount();
}





//Draw
void draw() {
  image(baseMap, 0, 0, width, height);
  for (TableRow row : table.rows ()) {
    String name = row.getString("Name");
    String website = row.getString("Website");
    String market = row.getString("Area/Markets");
    String state = row.getString("State");
    String budget = row.getString("Budget");
    String target = row.getString("Targeting");
    String geoKeywords = row.getString("Geo-Keywords");
    String start = row.getString("Start Date");
    String billing = row.getString("Billing Date");
    String contact = row.getString("Billing Contact");
    String email = row.getString("Email");
    String phone = row.getString("Phone");
    String adWordsId = row.getString("AdWords ID Number");
    float lat = map(row.getFloat("Lat"), 49.8, 24.2, 0, height);
    float longa = map (row.getFloat("Long"), -125.5, -66.5, 0, width);
    float count = row.getFloat("Count");
    println(name + " (" + website + ") in in areas " + target);
    fill(255, 0, 0, 78);
    textMode(MODEL);
    noStroke();



    float markerSize = 10.4;//0.05*sqrt(float(myData[i][2]))/PI;
    ellipse(longa, lat, markerSize, markerSize);

    ///This next block controls the   
    if ((mouseX > (longa - markerSize/3)) && (mouseX < (longa + markerSize/3)) &&
      (mouseY > (lat - markerSize/3)) && (mouseY < (lat + markerSize/3))) {

      textFont(f);
      noStroke();
      rect(longa-60, lat+markerSize, width/2, 60);
      fill(0);
      text(market +","+ state, longa-60, lat + 15+markerSize);
      text("Targeted Areas: " + target, longa-60, lat +30+markerSize);
      text("Geo Keywords: "+geoKeywords, longa-60, lat+45+markerSize);
      //text(longa + ": " + lat, longa-60, lat+60+markerSize);
      noFill();
    } else {
      noFill();
    }
    
    if (chart==true) {
      for (int i=0; i<numCust; i++){
      int p=0;  
      p=p+p;
      rect(100, height-100, width-100, height-100);
      text(count + "Real Leads Customers in " +market +","+ state, 150+15*p, 100 + 15*p);
      }
    }
  }
}
void keyPressed() {
  if (key == 'q'){ 
    chart=true;
} if (key == 's'){ 
    saveFrame("images/customermap####.png");
}else {
    chart=false;
  }
}