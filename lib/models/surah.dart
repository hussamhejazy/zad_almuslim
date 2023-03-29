class Surah {
  late String _type;
  late int _count;
  late int _index;
  late int  _page;
  Surah();
  Surah.fromMap(Map<String,dynamic> map){
    _type = map['type'];
    _count = map['count'];
    _index = map['index'];
    _page = map['page'];
  }
  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = <String,dynamic>{};
    map['type'] =  _type ;
    map['count']=  _count;
    map['index']=  _index;
    map['page']=  _page;
    return map;
  }


}