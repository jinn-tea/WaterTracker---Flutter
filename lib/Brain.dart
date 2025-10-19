class WaterBrain {
  int dailyTarget;
  int currentWater;

  WaterBrain({this.dailyTarget = 1000, this.currentWater = 0});


  void resetWater(){
    currentWater = 0;
  }

  void addWater(int addedAmount) {
    int add = addedAmount;
    currentWater += add;
    if (currentWater > dailyTarget) {
      currentWater = dailyTarget;
    }
  }


  int get percent => ((currentWater / dailyTarget) * 100).round();


  int get remaining {
    int rem = dailyTarget - currentWater;
    return rem < 0 ? 0 : rem;
  }

  double get waterLevel => currentWater / dailyTarget;
}


