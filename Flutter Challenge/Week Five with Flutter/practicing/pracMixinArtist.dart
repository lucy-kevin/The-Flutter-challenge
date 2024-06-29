

void main(List<String> args) {
  Artist artist1 = Artist();
  artist1.Paint(paintingStyle: "Good");
  artist1.Sing(song: "Awesome God");
  
  
  
}
mixin HasTalent{
 abstract String? paintingStyle;
 abstract String? song;
}
mixin CanPaint on HasTalent{
  void Paint({
    required String paintingStyle,
  }){
    print("$runtimeType can Paint using this $paintingStyle style ");
    this.paintingStyle;
  }
}
mixin CanSing on HasTalent{
  void Sing({
    required String song,
  }){
    print("$runtimeType can sing this $song");
    this.song;
  }
}

class Artist with HasTalent, CanPaint, CanSing{
  @override
  String? paintingStyle;
  
  @override
  String? song;
  

}