class Model{
  List<_Background_images> _background_image= [];
  List _items= [];
  List _topPicks= [];
  Model.fromJson(Map<String, dynamic> parsedJson){
    List<_Background_images> temp = [];
    List tempItems = [];
    List tempTopPicks = [];

    if(parsedJson["background_images"] != null){
        _Background_images background_image = _Background_images(parsedJson["background_images"]);
        temp.add(background_image);

      _background_image = temp;
    }

    if(parsedJson["data"][0]['items'] != null){
      tempItems = parsedJson["data"][0]['items']  ;
    }
    _items = tempItems;


    if(parsedJson["data"][1]['items'] != null){
      tempTopPicks = parsedJson["data"][1]['items']  ;
    }
    _topPicks = tempTopPicks;

  }
  List <_Background_images> get backgroundImages => _background_image;
  List get items => _items;
  List get topPicks => _topPicks;
}

class _Background_images{

  late List _image;

  _Background_images(result){
    _image = result;
  }
  List get image => _image;
}