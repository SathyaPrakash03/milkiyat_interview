
import 'dart:convert';

import 'package:milkiyat/model/model.dart';
import 'package:http/http.dart' as http;

class NetworkProvider{
  Future<Model> fetchList() async{
    final response = await http.get(Uri.parse("https://milkiyat.bangalore2.com/api/home/"),);

    if(response.statusCode == 200){
      return Model.fromJson(jsonDecode(response.body));
    }
    else
    {
      print(response.statusCode);
      return Model.fromJson({});
    }
  }
}