class HesenElmuslim{
  late int id;
  late String category;
  late List<dynamic> array;



  HesenElmuslim();

  List<Zeker> getAzkarByIndex(HesenElmuslim hesenElmuslimItem){
    List<Zeker> azkar = [];
    azkar = hesenElmuslimItem.array.map((e) => Zeker.fromMap(e)).toList();
    return azkar;
  }

  HesenElmuslim.fromMap(Map<String,dynamic> map){
    id = map['id'];
    category = map['category'];
    array = map['array'];
  }
  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = <String,dynamic>{};
    map['id'] =  id ;
    map['category']=  category;
    map['array']=  array;
    return map;
  }

}

class Zeker{
  late int id;
  late String text;
  late int count;

  Zeker();


  Zeker.fromMap(Map<String,dynamic> map){
    id = map['id'];
    text = map['text'];
    count = map['count'];
  }
  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = <String,dynamic>{};
    map['id'] =  id ;
    map['text']=  text;
    map['count']=  count;
    return map;
  }
}