//I followed this YouTube tutorial to make the timer: "02 - Processing - Creating a Timer Class" by Christopher Ockerby 

class Timer {
  float Time;
  
  Timer(float set) {
    Time = set;
  }
  
  float getTime() {
    return(Time);
  }
  
  void setTime(float set) {
    Time = set;
  }
  
  void countUp() {
    Time = Time + 1 / frameRate;
  }

}
