void main(){
    var exampleMaps = {
      "Name" :"Kevin",
      "District": "Arua",
      "Country": "Uganda",
      

    };
    print(exampleMaps.runtimeType);

    var population = Map<String, int>();

    population["Kenya"] = 2000000000;
    population["Uganda"] = 340000000;
  print(population["Kenya"]);
  print(population.length);

  final names = const{
    1 : "Melady",
    2 : "Josephine",

  };

  print(names);
  // this causes an error names[3] = "Evelyn";

  
  var families = {
    "Neka": ["Kevin", "Julie", "Suzan", "Axel"],
    "Edward": ["Phillip","Mercy"],
  };
  print(families);

}