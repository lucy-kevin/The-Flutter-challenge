void main(List<String>args){

  Vehicle vehicle1 = Vehicle("Toyota", "Corolla", 2020);
  Vehicle vehicle2 = Vehicle.electric("Tesla", "Model S", 2021, 100);

  vehicle1.vehicleDetails();
  vehicle2.vehicleDetails();
}

class Vehicle{
  final String make;
  final String model;
  final int year;
  final int? batteryCapacity;


  const Vehicle(
    this.make,
    this.model,
    this.year
  ): batteryCapacity=null;

  const Vehicle.electric(
    this.make,
    this.model,
    this.year,
    this.batteryCapacity,
  );
  void vehicleDetails(){
    if(batteryCapacity == null){
      print("Make: $make");
      print("Model: $model");
      print("Year: $year");
    }else{
      print("Make: $make");
      print("Model: $model");
      print("Year: $year");
      print("Batter Capacity: $batteryCapacity");
    }
    print("________________________________");
  }
}